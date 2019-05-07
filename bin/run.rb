require_relative '../config/environment'

puts "Welcome to the Future Game of Thrones!"

sleep(2)

puts "Enter your name get and ready pledge your allience!"

user = gets.chomp

puts "#{user} Whos allience will you join?"

puts "1. Will it be House Targarian?"
puts "2. Will it be House Lannister?"
puts "3. Will it be House Stark?"

user_house = gets.chomp
