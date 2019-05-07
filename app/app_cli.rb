require 'pry'
class InstamoodRun

  def run
    welcome
    #puts a welcome
    #ask for user name
    main_menu
    #ask how they're feeling
    #display_gif_options
    #choose to keep/reject a gif

  end

  def welcome
    puts "Welcome to Instamood!"
    puts "Enter your Username"
    user_input
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
        gif_options("like an Imposter")
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
    return Gif.all.find_by(category: category).url
    # binding.pry
    # gif.first
    ##pull random gif from gif table where category matches feeling
    # puts "type 'keep' to keep this gif or 'reject' for another option"
    # input = user_input
    # if input == "keep"
    #   #run save_mood
    # elsif input == "reject"
    #   n = rand(1..Gif.all.length)
    #   while input == "reject"
    #     gif.find_by(id: n)
    #     puts "type 'keep' to keep this gif or 'reject' for another option"
    #     input
    #   end
    # else
    #   puts "please enter keep or reject"
    #   gif_options
    # end
  end

  # def save_mood
  #   #once they choose to keep once
  #   #user_input_caption
  #   #save new Mood instance to the db
  # end



  # def  display_gif_options
  # end


  def user_input
    gets.chomp
  end

end
