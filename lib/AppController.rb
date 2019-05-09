class AppController
    attr_reader :name

    def initialize
        welcome
        main_menu
    end
    # This code will be optimized with the prompt gem but this is just to get it all up and running with a 
    # basic structure
    #Add optional verification step with randomly generated PIN
    def welcome
        puts "Welcome to literally the best app ever!"
        prompt = TTY::Prompt.new(active_color: :cyan)
        name = prompt.ask("What's your name?")
        if User.find_by(name: name) == nil
            User.create(name: name)
            puts "*********************"
            puts "Hello #{name}"
            puts "*********************"
        else
            puts "*********************"
            puts "Welcome back #{name}"
            puts "*********************"
        end
        
        
    end

    def main_menu
        puts "Main Menu"
        puts "1. Practice Mindfulness"
        puts "2. Your Journal"
        puts "3. Your Mood"
        puts "4. Exit"
        choice = gets.strip

        case (choice.to_i)
        when 1
            be_mindful
        when 2
            access_journal
        when 3
            access_mood
        when 4
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
        puts "Select what you'd like to do today"
        puts "1. Have a breathing exercise"
        puts "2. Practice a technique"
        puts "3. Exit"
        choice = gets.strip

        case (choice.to_i)
        when 1
            breath_exercise
            be_mindful
        when 2
            generate_technique
            be_mindful
        when 3
            main_menu
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            be_mindful
        end
    end

    def breath_exercise
        3.times do
        puts "Inhale"
        5.downto(0) do |i|
            puts ".........."
            sleep 1
        end
        puts "Exhale"
        5.downto(0) do |i|
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
        puts "Welcome to your journal!"
        puts "1. Create New Entry"
        puts "2. Read Past Entries"
        puts "3. Exit"
        choice = gets.strip

        case (choice.to_i)
        when 1
            # create_entry Should take in an input and save it into the database with a timestamp
            access_journal
        when 2
            # journal_entries Should display all of the user's previous entries with an edit/delete prompt at the bottom
            access_journal
        when 3
            main_menu
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            access_journal
        end
    end

    def access_mood
        puts "Welcome to feelings central!"
        puts "1. Show ratings for the week"
        puts "2. Summarize for the week"
        puts "3. Exit"
        choice = gets.strip

        case (choice.to_i)
        when 1
            # mood_ratings Should take all mood ratings for the week and display them
            access_mood
        when 2
            # summarize_mood Should take all the mood ratings and present it nicely
            # e.g You starting out this week feeling horribly, but you've improved to feel great!
            access_mood
        when 3
            main_menu
        else
            puts "*******************"
            puts "Invalid try again!"
            puts "*******************"
            access_mood
        end
    end

end