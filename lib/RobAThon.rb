require_relative '../config/environment'
require "pry"


class RobAThon

    @@prompt = TTY::Prompt.new
    @@artii = Artii::Base.new:font => 'epic'

    def logo
        puts @@artii.asciify("Rob-A-Thon")
    end
    
    def spinner_intro
        spinner = TTY::Spinner.new("[:spinner] Scanning your eyes 👀👀👀👀", format: :pulse_2)
            spinner.auto_spin
            sleep(2)
            spinner.stop("Done!")
    end 

    def spinner_game
        spinner = TTY::Spinner.new("[:spinner] Your fate awaits...", format: :pulse_2)
            spinner.auto_spin
            sleep(2)
            spinner.stop("Done!")
    end 

    def greeting
        puts "Welcome to Rob-a-thon!"
        sleep (0.75)

        choices = ["Yes", "No"]

        selection = @@prompt.select("Are you a new robber?", choices)

        case selection
        when "Yes"
            system("clear")
            spinner_intro
            create_new_user
        when "No"
            system("clear")
            sign_in
        end 
    end 

    $user_search = nil

    def create_new_user
        sleep(0.75)
        system("clear")
        puts "Please enter a username."
        new_user_response = gets.chomp.to_s
        $user_search = User.create(username: new_user_response)
        sleep(0.75)
        system("clear")

        spinner = TTY::Spinner.new("[:spinner] Preparing your kit...", format: :pulse_2)
            spinner.auto_spin
            sleep(2)
            spinner.stop("Done!")
            system("clear")

        puts "Thank you #{$user_search.username}. It's time to make some $$$!"
        puts
        main_menu
    end 

    def sign_in
        puts "Welcome back. Please enter in your username."
        sign_in_response = gets.chomp
        $user_search = User.find_by(username: sign_in_response)
        puts 
        if $user_search
            system("clear")
            puts @@artii.asciify("Hello ")
            puts @@artii.asciify("#{sign_in_response}")
            puts
            main_menu
        else
            puts "Sorry we could not find your account. Please try again.🥺"
            sleep(3)
            system("clear")
            sign_in 
        end 
    end 

    ## main menu 

    def main_menu

        choices = ["Make some 🤑🤑🤑", "Game History", "High Score", "Delete User"]

        selection = @@prompt.select("Main Menu", choices)

        case selection
        when "Make some 🤑🤑🤑"
            system("clear")
            select_character
        when "Game History"
            system("clear")
            game_history
        when "High Score"
            system("clear")
            history_score
        when "Delete User"
            system("clear")
            delete_user
        end 
    end 

    ## select_character

    def select_character
        character_choices = ["Speedy Gonzalez", "James Bond", "Cat Woman", "Super Woman", "Spongebob Squarepants"]

        selection = @@prompt.select("Character selection:", character_choices)

        sg = Character.all.find { |character| character.name == selection}
        puts "Your health count is #{sg.health_count} and you have $#{sg.total_money} in the bank."
        sleep(1)
        current_game = Game.create(user_id: $user_search.id, character_id: sg.id, health_count: sg.health_count, total_money: sg.total_money)
        scenario(current_game)
    end 

     # scenarios

    def scenario(current_game)
        puts 
        random_location = ["Louis Vuitton", "Walmart", "Disney World", "Bank of America", "your friend's house", "Cartier"].sample
        puts "I'll take you to #{random_location}.."
        sleep(1)
        puts 
        start_game(current_game)
    end 
    
    ## start_game

    def start_game(current_game)

        move_choices = ["Run 🏃‍♂️", "FIGHT 👊", "Surrender 👐", "Walk-away🚶"]

        selection = @@prompt.select("How would you like to proceed... It's your choice and yours alone.", move_choices)

        case selection
            when "Run 🏃‍♂️"
                run(current_game)
            when "FIGHT 👊"
                fight(current_game)
            when "Surrender 👐"
                surrender(current_game)
            when "Walk-away🚶"
                walk_away(current_game)
            end 
    end 

    ## robber methods

    def random_num_generator
        num = rand(1..10)
        num
    end 

    def game_stats(current_game)
        puts
        system("clear")
        puts "You currently have #{current_game.total_money} and your health count is #{current_game.health_count}."
    end

    def check_alive(current_game)

        if current_game.health_count <= 0 
            puts "Tough luck trooper."
            sleep(5)
            main_menu
        else current_game.health_count > 0 
            start_game(current_game)
        end 
    end

    def run(current_game)
        if random_num_generator > 7 
            current_game.total_money += 500
        else 
            current_game.total_money -= 500
            current_game.health_count -= 1
        end
        game_stats(current_game)
        check_alive(current_game)
    end 

    def fight(current_game)
        if random_num_generator > 8 
            current_game.health_count += 1
        else 
            current_game.health_count -= 1
        end
        game_stats(current_game)
        check_alive(current_game)
    end 

    def surrender(current_game)
        if random_num_generator > 5 
            current_game.health_count += 2
        else 
            current_game.health_count -= rand(1..5)
        end
        game_stats(current_game)
        check_alive(current_game)
    end 

    def walk_away(current_game)
        choices = ["Yes", "No"]

        selection = @@prompt.select("You're done already? We just started to have some fun.", choices)

        case selection
        when "Yes"
            system("clear")
            game_stats(current_game)
            puts 
            main_menu
        when "No"
            puts
            puts "Phew. Let's keep playing."
            sleep(2)
            system("clear")
            scenario(current_game)
        end 
    end 

    ## game_history

    def game_history
        # Game.all.select { |game| game.user_id == $user_search.name}
        Game.where(user_id: $user_search.id)
    end 

    ## high_score

    def high_score
    end

    ## delete_user
    def delete_user

        choices = ["Yes", "No"]

        selection = @@prompt.select("Is this your username '#{$user_search.username}' and would you like to proceed?", choices)

        case selection
        when "Yes"
            User.where(username: $user_search.username).destroy_all
            puts "Your user name has been deleted!"
            sleep(3)
            system("clear")
            greeting
        when "No"
            main_menu
        end 
    end 


end 