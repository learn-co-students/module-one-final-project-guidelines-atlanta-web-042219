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

  def welcome#still need to check to make sure name doesn't exist
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
    gif = Gif.all.select{|gifs| gifs.category == category}
    # binding.pry
    user_choice = gif.sample
    puts user_choice.url#should actually display this gif in the terminal
    puts "type 'keep' to keep this gif or 'reject' for another option"
    input = user_input
    if input == "keep"
      save_mood(user_choice, @name)
      puts "TEST STRING"#remove this line when project complete
      return
    elsif
      while input == "reject"
        puts gif.sample.url
        puts "type 'keep' to keep this gif or 'reject' for another option"
        input = user_input
        if input == "reject"
          gif_options(category)
        elsif input == "keep"
          save_mood(user_choice, @name)
          puts "test string"#remove this line when project complete
          return
        end
      end
    else
      puts "please enter keep or reject"
      gif_options(category)
    end
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


  def user_input
    gets.chomp
  end
end
