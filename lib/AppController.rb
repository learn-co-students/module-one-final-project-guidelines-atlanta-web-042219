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
        prompt = TTY::Prompt.new(active_color: :cyan)
        @@current_user = prompt.ask("Please type in your name to begin:")
        if User.find_by(name: @@current_user) == nil
            User.create(name: @@current_user)
            puts "********************************************************************"
            puts "Hello #{@@current_user}, my name is Qamar, it's lovely to meet you!\nYou can tell me anything you like to clear your head and,\n I can tell you how you've been feeling today."
            puts "********************************************************************"
        else
            puts "********************************************************"
            puts "Welcome back #{@@current_user}, I'm sure you missed me!"
            puts "********************************************************"
        end
        
        
    end

    def mood_check
        puts "On a scale of 1 to 10, how are you feeling today?"
        new_rating = gets.strip
        Rating.create(value: new_rating.to_i, date: Date.today)
        puts "********************************"
        puts "Thank you, let's begin shall we?"
        puts "********************************"
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
        puts "Breathe in"
        3.downto(0) do |i|
            puts ".........."
            sleep 1
        end
        puts "Breathe out"
        3.downto(0) do |i|
            puts ".........."
            sleep 1
        end
        end
    end
    
    def generate_technique
        techniques = [
            "Try a body scan. Close your eyes and focus on one part of your body at a time.\nAcknowledge the feeling then move on to the next body part. ", 
            "Try to actively listen to someone today. Focus on the person's body language\nand what they're saying so they can feel fully heard and seen.", 
            "Try a 5 senses exercise. Notice 5 things that you can see, 4 things that you can feel,\n3 things that you can hear, 2 things you can smell, and 1 thing that you can taste.",
            "Try being an alien. Pretend you're an alien who inhabited your human body, then look\naround at your life with foreign eyes to induce gratitude and for a new perspective.",
            "Observe a leaf for 5 minutes. This exercise calls for nothing but a leaf and your attention.\nPick up a leaf, hold it in your hand, and give it your full attention for five minutes.\nNotice the colors, the shape, the patterns, and the texture.",
            "If you feel your minding drifting to the future of anxiety or regret of the past, bring your\nattention to your breathe and nothing else. Focusing on the air flowing in your lungs will\nbring you back to the present"
        ]
        puts "*****************************************************************************"
        puts techniques.sample
        puts "*****************************************************************************"
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
        choices = ["Show me today's ratings", "Exit"]
        input = prompt.select("Welcome to feelings central!", choices)

        case (input)
        when "Show me today's ratings"
            mood_ratings
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
      rating_array.each do |rating| 
        if (1..3).include?(rating.value)
            puts "Straight crap"
            puts "*********"
        elsif (4..6).include?(rating.value)
            puts "It's a meh from me dog"
            puts "*********"
        elsif (7..9).include?(rating.value)
            puts "Feelin' Good"
            puts "*********"
        else 
            puts "Perfect!!!"
            puts "*********"
      end
    end
end
    

end