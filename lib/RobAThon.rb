require_relative '../config/environment'

@@prompt = TTY::Prompt.new

class RobAThon

    def greeting
        puts "Welcome to Rob-a-thon!"
        sleep (0.75)

        choices = ["Yes", "No"]

        selection = @@prompt.select("Are you a new robber?", choices)

        case selection
        when "Yes"
            system("clear")
            create_new_user
        when "No"
            system("clear")
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
        sign_in_response = gets.chomp
        if User.find_by(username: sign_in_response)
            puts "Hello #{sign_in_response}."
            main_menu
        else
            puts "Sorry we could not find your account. Please try again."
            sleep(1)
            system("clear")
            sign_in 
        end 
    end 

    ## main menu 

    def main_menu 
        choices = ["Make some $$$", "Game History", "High Score", "Delete Account"]

        selection = @@prompt.select("Main Menu", choices)

        case selection
        when "Make some $$$"
            system("clear")
            select_character
        when "Game History"
            system("clear")
            game_history
        when "High Score"
            system("clear")
            history_score
        when "Delete Account"
            system("clear")
            delete_user
        end 
    end 

    ## select_character

    ## how do I shorten this code
    ## how do I let the app know which character I am?

    def select_character
        character_choices = ["Speedy Gonzalez", "James Bond", "Cat Woman", "Super Woman", "Spongebob Squarepants"]

        selection = @@prompt.select("Character selection:", character_choices)

        case selection
        when "Speedy Gonzalez"
            sg = Character.all.select{ |character| character.name == "Speedy Gonzalez"}
            puts "Your health count is #{sg[0].health_count} and you have $#{sg[0].total_money} in the bank."
            sleep(1)
        when "James Bond"
            jb = Character.all.select{ |character| character.name == "James Bond"}
            puts "Your health count is #{jb[0].health_count} and you have $#{jb[0].total_money} in the bank."
            sleep(1)
        when "Cat Woman"
            cw = Character.all.select{ |character| character.name == "Cat Woman"}
            puts "Your health count is #{cw[0].health_count} and you have $#{cw[0].total_money} in the bank."
            sleep(1)
        when "Super Woman"
            sw = Character.all.select{ |character| character.name == "Super Woman"}
            puts "Your health count is #{sw[0].health_count} and you have $#{sw[0].total_money} in the bank."
            sleep(1)
        when "Spongebob Squarepants"
            ss = Character.all.select{ |character| character.name == "Spongebob Squarepants"}
            puts "Your health count is #{ss[0].health_count} and you have $#{ss[0].total_money} in the bank."
            sleep(1)
        end 
        scenario
    end 

     # scenarios

    def scenario
        puts 
        random_location = ["Louis Vuitton", "Walmart", "Disney World", "Bank of America", "your friend's house", "Cartier"].sample
        puts "I'll take you to #{random_location}.."
        sleep(1)
        puts 
        start_game
    end 
    
    ## start_game

    def start_game

        move_choices = ["Run", "FIGHT", "Surrender", "Walk-away"]

        selection = @@prompt.select("How would you like to proceed... It's your choice and yours alone.", move_choices)

        case selection
            when "Run"
                run
            when "FIGHT"
                fight
            when "Surrender"
                surrender
            when "Walk-away"
                walk_away
            end 
    end 

    ## robber methods

    def random_num_generator
        num = rand(1..10)
        num
    end 

    def run 
        if random_num_generator > 5 
            self.total_money += 500
        else 
            self.total_money -= 500
        end
    end 

    def fight 
        if random_num_generator > 5 
            self.health_count += 1
        else 
            self.health_count -= 1
        end
    end 

    def surrender 
        if random_num_generator > 5 
            self.health_count += 2
        else 
            self.total_money -= rand(1..500)
        end
    end 

    def walk_away
    end 

    ## game_history

    def game_history
    end 

    ## high_score

    def high_score
    end

end 