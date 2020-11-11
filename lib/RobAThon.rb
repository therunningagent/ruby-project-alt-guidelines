require_relative '../config/environment'

class RobAThon

    ## greeting + user prompt

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
        new_user_response = gets.chomp.to_s
        new_user = User.new(username: new_user_response)
        sleep(0.75)
        system("clear")
        puts "Thank you #{new_user.username}. It's time to make some $$$!"
        main_menu
    end 

    def sign_in
        puts "Welcome back. Please enter in your username."
        sign_in_response = gets.chomp.to_s
        if User.find_by(username: sign_in_response)
            sleep(1.5)
            system("clear")
            puts "OH HELLO #{sign_in_response}. Let's go make some $$$!"
            sleep(1.5)
            system("clear")
            main_menu
        else
            puts "Sorry we could not find your account. Please try again."
            sleep(3)
            system("clear")
            sign_in 
        end 
    end 
end 