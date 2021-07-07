require 'pry'
class InstamoodRun
  attr_accessor :name

  def run
    welcome
    #puts a welcome
    #ask for user name
    #creates new user with name IF NAME DOES NOT EXIT
    main_menu
    #ask how they're feeling
    #display_gif_options
    #choose to keep/reject a gif
  end

  def welcome
    puts "Welcome to Instamood!"
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
  end

  def hru
    puts "How are you feeling?"
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
    puts "Please choose a number"
  end


  def gif_options(category)
    gif = Gif.where("category  = 'happy'")#find active record method for this where query
    # binding.pry
    user_choice = gif.sample
    puts user_choice.url#should actually display this gif in the terminal
    puts "type 'keep' to keep this gif or 'reject' for another option"
    input = user_input
    until input == "keep"
      if input == "reject"
        puts gif.sample.url
        puts "keep or reject"
        input = user_input
      else
        puts "please type keep or reject"
        input = user_input
      end
    end
    save_mood(user_choice, @name)
    puts "TESTING 1 2 3"
    return
  end

  def save_mood(gif, user)
    puts "Enter your caption"
    caption = user_input
    Mood.create(
      gif_id: gif.id,
      user_id: user.id,
      caption: caption
    )
  end



  def  display_gif_options
    #HOW TO ACTUALLY DISPLAY THE GIF IN THE TERMINAL
  end

  def delete_gifs
    #After all previously chosen gifs show up, gives option to delete
    #user can delete their previous gifs
  end


  def user_input
    gets.chomp.downcase
  end
end
