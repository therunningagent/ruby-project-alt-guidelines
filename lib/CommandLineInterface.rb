require_relative '../config/environment'

class CommandLineInterface

    def greeting
        puts "Welcome to Rob-a-thon!"
        sleep (0.75)
        puts "Are you a new robber? (Y or N)"
        user_response = gets.chomp
        if user_response == "Y"
            create_new_user
        else 
            sign_in
        end 
    end 
    
    def create_new_user
        sleep(0.75)
        system("clear")
        puts "Please enter a username."
        new_user_response = gets.chomp
    end 

    def sign_in
        puts "Welcome back. Please enter in your username."
        sign_in_response = gets.chomp
        puts "Hello #{sign_in_response}."
    end 

end 