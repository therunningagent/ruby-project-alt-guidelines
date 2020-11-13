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
        puts

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
    $character = nil

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
        puts @@artii.asciify("#{$user_search.username}")
        # puts "It's time to make some $$$ 💰💰!"
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

        choices = ["Make Some Money 🤑🤑🤑", "Game History", "High Score", "Delete User"]

        selection = @@prompt.select("Main Menu", choices)

        case selection
        when "Make Some Money 🤑🤑🤑"
            system("clear")
            select_character
        when "Game History"
            system("clear")
            game_summary
            sleep(3)
            main_menu
        when "High Score"
            system("clear")
            high_score
            sleep(3)
            main_menu
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
        $character = sg 
        puts "Your health count is #{sg.health_count} 💕 and you have $#{sg.total_money} 💰 in the bank."
        sleep(2)
        current_game = Game.create(user_id: $user_search.id, character_id: sg.id, health_count: sg.health_count, total_money: sg.total_money)
        scenario(current_game)
    end 

    def character_speed
        speed = $character.speed
    end 

     # scenarios

    def scenario(current_game)
        puts
        random_location = ["Louis Vuitton", "Walmart", "Disney World", "Bank of America", "a friend's house", "Cartier"].sample
        spinner_game
        system("clear")
        puts "You're about to rob #{random_location}.."
        sleep(2)
        puts
        puts "Oh crap. The police are here!!! 👮‍♀️👮‍♀️👮‍♀️👮‍♀️👮‍♀️👮‍♀️"
        puts 
        start_game(current_game)
    end 
    
    ## start_game

    def start_game(current_game)

        move_choices = ["Run 🏃‍♂️", "FIGHT 👊", "Surrender 👐", "Walk-away🚶"]

        selection = @@prompt.select("How would you like to proceed... It's your choice and yours alone.", move_choices)

        case selection
            when "Run 🏃‍♂️"
                spinner_game
                system("clear")
                run(current_game)
            when "FIGHT 👊"
                spinner_game
                system("clear")
                fight(current_game)
            when "Surrender 👐"
                spinner_game
                system("clear")
                surrender(current_game)
            when "Walk-away🚶"
                spinner_game
                system("clear")
                walk_away(current_game)
            end 
    end 

    ## robber methods

    def random_num_generator
        num = rand(1..20)
    end 

    def random_money_generator
        num = rand(1..1000)
    end 

    def game_stats(current_game)
        puts
        system("clear")
        puts "You currently have $#{current_game.total_money} 💰 and your health count is #{current_game.health_count} 💕."
    end

    def check_alive(current_game)

        if current_game.total_money <= 0 || current_game.health_count <= 0
            puts 
            puts "Tough luck trooper. Game over."
            sleep(5)
            system("clear")
            main_menu
        else current_game.health_count > 0
            scenario(current_game)
            start_game(current_game)
        end 
    end

    def run(current_game)
        if random_num_generator > 5 && character_speed == 3
            current_game.total_money += random_money_generator
            puts "You successfully escaped and now have $#{current_game.total_money}. On to the next job. 💰💰"
            sleep(5)
        elsif random_num_generator > 10 && character_speed < 3
            current_game.total_money += random_money_generator
            puts "You successfully escaped and now have $#{current_game.total_money}. On to the next job. 💰💰"
            sleep(5)
        else 
            current_game.total_money -= 500
            current_game.health_count -= 1
            puts "Poor #{$user_search}. You lost $500 💰 and 1 health point. 💕"
        end
        game_stats(current_game)
        sleep(2)
        check_alive(current_game)
    end 

    def fight(current_game)
        if random_num_generator > 15 
            puts
            puts "You were successful in beating the cops, which gives you a $1000 bonus! 💰"
            sleep(5)
            current_game.total_money += 1000
        else 
            puts
            puts "You got away, but you're injured. -3 health points 💔"
            sleep(5)
            current_game.health_count -= 3
        end
        game_stats(current_game)
        sleep(2)
        check_alive(current_game)
    end 

    def surrender(current_game)
        current_game.total_money -= 1000
        current_game.health_count += 2

        puts "You got locked up and you've done your time. +2 health points 💕 and -$1000 💰"

        sleep(5)

        game_stats(current_game)
        sleep(2)
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
        Game.where(user_id: $user_search.id)
    end 

    def game_summary
        game_history.each_with_index {|game, index| puts "Game ##{index + 1}: Money Earned: #{game.total_money} Total Health: #{game.health_count}"}
    end 

    ## high_score

    def high_score
       high_score_game = game_history.max_by { |game| game.total_money}
       puts "Your high score is #{high_score_game.total_money}. You killed it."
    end

    ## delete_user
    def delete_user

        choices = ["Yes", "No"]

        selection = @@prompt.select("Is this your username '#{$user_search.username}' and would you like to proceed?", choices)

        case selection
        when "Yes"
            User.where(username: $user_search.username).destroy_all
            puts "Your username has been deleted!"
            sleep(3)
            system("clear")
            greeting
        when "No"
            main_menu
        end 
    end 


end 