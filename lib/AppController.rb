require 'pry'
class AppController
    attr_reader :name
    @@current_user = nil

    def initialize
        welcome
        mood_check
        main_menu
    end
    # This code will be optimized with the prompt gem but this is just to get it all up and running with a 
    # basic structure
    #Add optional verification step with randomly generated PIN
    def welcome
        puts "Welcome to literally the best app ever!"
        prompt = TTY::Prompt.new(active_color: :cyan)
        @@current_user = prompt.ask("What's your name?")
        if User.find_by(name: @@current_user) == nil
            User.create(name: @@current_user)
            puts "*********************"
            puts "Hello #{@@current_user}"
            puts "*********************"
        else
            puts "*********************"
            puts "Welcome back #{@@current_user}"
            puts "*********************"
        end
        
        
    end

    def mood_check
        puts "On a scale of 1 to 10, how are you feeling today?"
        new_rating = gets.strip
        Rating.create(value: new_rating.to_i, date: Date.today)
        puts "Thank you, let's just jump into it"
    end

    def main_menu
        prompt = TTY::Prompt.new(active_color: :cyan)
        choices = ["Practice Mindfulness", "Your Journal", "Your Mood", "Exit"]
        input = prompt.select("Main Menu", choices)

        case (input)
        when "Practice Mindfulness"
            be_mindful
        when "Your Journal"
            access_journal
        when "Your Mood"
            access_mood
        when "Exit"
            puts "Thank you for using my app!"
            exit
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            main_menu
        end
    end

    def be_mindful
        prompt = TTY::Prompt.new(active_color: :cyan)
        choices = ["Have a breathing exercise", "Practice a technique", "Exit"]
        input = prompt.select("Select what you'd like to do today", choices)

        case (input)
        when "Have a breathing exercise"
            breath_exercise
            be_mindful
        when "Practice a technique"
            generate_technique
            be_mindful
        when "Exit"
            main_menu
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            be_mindful
        end
    end

    def breath_exercise
        2.times do
        puts "Inhale"
        3.downto(0) do |i|
            puts ".........."
            sleep 1
        end
        puts "Exhale"
        2.downto(0) do |i|
            puts ".........."
            sleep 1
        end
        end
    end
    
    def generate_technique
        techniques = ["YOLO", "Buy a cat", "Get sum chick-fil-a"]
        puts "*******************"
        puts techniques.sample
        puts "*******************"
    end

    def access_journal
        prompt = TTY::Prompt.new(active_color: :cyan)
        choices = ["Create New Entry", "Read Past Entries", "Exit"]
        input = prompt.select("Welcome to your journal!", choices)

        case (input)
        when "Create New Entry"
            create_entry
            access_journal
        when "Read Past Entries"
            journal_entries
            access_journal
        when "Exit"
            main_menu
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            access_journal
        end
    end

    def journal_entries
        name = User.find_by(name: @@current_user)
        entries = Entry.where(user_id: name.id)
        entries.each { |entry| puts "#{entry.id}. #{entry.content}"}
        prompt = TTY::Prompt.new(active_color: :cyan)
        choices = ["Edit entry", "Delete entry", "Exit"]
        input = prompt.select("What would you like to do?", choices)

        case input
        when 'Edit entry'
            edit_entry
            journal_entries
        when "Delete entry"
            delete_entry
            journal_entries
        when 'Exit'
            main_menu
        end

    end

    def create_entry
        name = User.find_by(name: @@current_user)
        puts "Tell me what's on your mind"
        content = gets.chomp
        new_entry = Entry.create(content: content, rating_id: Rating.last.id, user_id: name.id)
        User.find_by(name: @@current_user).entries << new_entry
        Rating.last.entries << new_entry
        puts "***************"
        puts "Your entry has been saved!"
    end

    def entry_prompt
        puts "****************************************"
        puts "Type in the number of your desired entry"
        puts "****************************************"
    end

    def edit_entry
        entry_prompt
        choice = gets.chomp
        entry = Entry.find(choice.to_i)
        if entry == nil
            puts "There's no such entry, please try again"
            edit_entry
        else 
            puts entry.content
            puts "**************************"
            puts "Type in your content"
            new_content = gets.chomp
            entry.update(content: new_content)
            puts "**************************"
            puts "Your edit has been saved!"
        end
    end

    def delete_entry
        entry_prompt
        choice = gets.chomp
        entry = Entry.find(choice.to_i)
        if entry == nil
            puts "There's no such entry, please try again"
            edit_entry
        else 
            puts entry.content
            puts "**************************"
            puts "Are you sure you want to delete this entry? (Y/N)"
            answer = gets.strip
            if answer.capitalize == "Y" 
                entry.destroy 
                puts "Your entry has been destroyed!"
            else
                puts "I'll take you back to your journal"
                journal_entries
            end
            
        end
    end

    def access_mood
        prompt = TTY::Prompt.new(active_color: :cyan)
        choices = ["Show me today's ratings", "Summarize my ratings for the week", "Exit"]
        input = prompt.select("Welcome to feelings central!", choices)

        case (input)
        when "Show me today's ratings"
            mood_ratings
            access_mood
        when "Summarize my ratings for the week"
            summarize_mood
            access_mood
        when "Exit"
            main_menu
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            access_mood
        end
    end

    def mood_ratings
      user = User.find_by(name: @@current_user)
      entry_array = Entry.where(user_id: user.id)
      rating_array = entry_array.map { |entry| entry.rating.date == Date.today ? entry.rating : nil }.compact
      binding.pry
      rating_array.each do |rating| 
        puts rating.value 
        puts "*********"
      end
    end

    

end