require 'pry'
class InstamoodRun
  attr_accessor :name

  def run
    welcome
    sleep 2
    main_menu
    #ask how they're feeling
    #display_gif_options
    #choose to keep/reject a gif
    sleep 1
    second_menu
    #ask what they want to do next
      #update_mood
      #delete_moods
      #see moods of other users
      #rate_the_app
      #exit

  end

  def second_menu
    sleep 1
    what_next
    choice = user_input.to_i
    until choice != 0 && choice <= 7
      puts "please type a number 1-7"
      choice = user_input.to_i
    end
    case choice
      when 1#working
        main_menu
      when 2#working
        puts "enter the mood id for the mood you'd like to update"
        id = user_input.to_i
        @name.update_mood(id)
        second_menu
      when 3#working
        puts "your feelings are valid! DON'T DELETE!"
        sleep 1
        puts "if you still want to delete type yes"
        input = user_input
        if input == "yes"
          @name.delete_moods
          second_menu
        else
          puts "Whew! Good choice."
          second_menu
        end
          puts "your feelings are valid! DON'T DELETE!"
          #sleep
          puts "if you still want to delete type yes"
          input = user_input
          if input == "yes"
            @name.delete_moods
            second_menu
          else
            puts "Whew! Good choice."
            second_menu
          end
      when 4#working
        @name.list_moods
        second_menu
      when 5#working
        Mood.list_all
        second_menu
      when 6
        #rate the app
      when 7#working
        abort("Thank you for using Instamood! Have a good day!")
      end
  end

  def what_next#COMPLETE
    puts "what would you like to do next?"
    sleep 1
    puts <<-end
    1. create a new mood
    2. update a mood
    3. delete my moods
    4. view my moods
    5. view all moods
    6. rate the app :)
    7. exit Instamood :(
    end
    puts "please choose a number"
  end

  def welcome
    puts "Welcome to Instamood!"
    sleep 1
    puts "Enter your Username"
    name = user_input
    user = User.all.find{|user| user.name == name}
    if user
      @name = user
      puts "Welcome back #{name}!"
    else
      @name = create_user(name)
    end
  end

  def create_user(name)
    User.create(
      name: name
    )
  end

  def main_menu
    hru#asks how they're feeling
    sleep 1
    feeling = user_input.to_i
    until feeling != 0 && feeling <= 10
      puts "please type a number 1-10"
      feeling = user_input.to_i
    end
    case feeling
      when 1
        gif_options("happy")
      when 2
        gif_options("sad")
      when 3
        gif_options("flirty")
      when 4
        gif_options("angry")
      when 5
        gif_options("excited")
      when 6
        gif_options("calm")
      when 7
        gif_options("hangry")
      when 8
        gif_options("tired")
      when 9
        gif_options("frustrated")
      when 10
        gif_options("imposter")
      end
      second_menu
  end

  def hru
    puts "How are you feeling?"
    sleep 1
    puts <<-end
    1. Happy
    2. Sad
    3. Flirty
    4. Angry
    5. Excited
    6. Calm
    7. Hangry
    8. Tired
    9. Frustrated
    10. Like an Imposter
    end
    sleep 1
    puts "Please choose a number"
  end

  def gif_options(category)
    gif = Gif.where("category = '#{category}'")#find active record method for this where query
    # binding.pry
    user_choice = gif.sample
    puts user_choice.url#should actually display this gif in the terminal
    sleep 1
    puts "type 'keep' to keep this gif or 'reject' for another option"
    input = user_input
    until input == "keep"
      if input == "reject"
        puts gif.sample.url
        sleep 1
        puts "keep or reject"
        input = user_input
      else
        sleep 1
        puts "please type keep or reject"
        input = user_input
      end
    end
    save_mood(user_choice, @name)
    puts "TESTING 1 2 3"
    return
  end

  def save_mood(gif, user)
    sleep 1
    puts "Enter your caption"
    caption = user_input
    Mood.create(
      gif_id: gif.id,
      user_id: user.id,
      caption: caption
    )
  end

  def  display_gif_in_terminal
    #HOW TO ACTUALLY DISPLAY THE GIF IN THE TERMINAL
  end


  def user_input
    gets.chomp.downcase
  end

end
