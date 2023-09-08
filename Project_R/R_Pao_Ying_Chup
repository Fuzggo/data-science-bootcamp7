play_game <- function() {
  score <- 0
  total_play <- 0
  lose <- 0
cat("Instruction: Welcome to the game! You've entered the Bloody Arena, where you'll face off against a fierce opponent in a battle of strategy and skill.", 
    "There are three weapons at your disposal: the mighty hammer, the versatile paper, and the swift scissor.", 
    "Choose your weapon wisely, as your victory depends on it.",
    "If you fear and want to run for your life you can always choose 'exit' to escape. Good luck, brave fighter!")


  while (TRUE) {
    weapon_options <- c("hammer", "paper", "scissor")
    options_message <- paste("Your weapon options:", paste(weapon_options, collapse = ", "))  # Join elements of weapon_options

    print(options_message)
    print("Or choose 'exit' to escape this game!")

    user_select <- tolower(readline("Choose your weapon: "))
    computer_select <- sample(weapon_options, 1)

    if (user_select == "exit") {
      if (lose >= 1) {
        print(paste("Thank you for playing! You played", total_play, "games and won", score, "times. Your efforts are commendable, but you also had", lose, "losses. Give it another shot next time!"))
      } else if (score >= 1) {
        print(paste("Thank you for playing! You played", total_play, "games and emerged victorious", score, "times. You're the undefeated champion of the arena!"))
      } else {
        print(paste("Thank you for playing! You played", total_play, "games, and though victory hasn't yet been in your favor, remember that each match is a chance to grow. This arena will always welcome challenges, so keep practicing, and return when you feel ready. Stay strong, brave warrior."))
      }
      break
    } else if (user_select %in% weapon_options) {
      total_play <- total_play + 1
      computer_select <- sample(weapon_options, 1)
      cat("Computer chose:", computer_select, "\n")

      if (user_select == computer_select) {
        print("Tie!")
      } else if (
        (user_select == "hammer" && computer_select == "scissor") ||
        (user_select == "scissor" && computer_select == "paper") ||
        (user_select == "paper" && computer_select == "hammer")
      ) {
        print("You Win!")
        score <- score + 1
      } else {
        print("You Lose!")
        lose <- lose + 1
      }
    } else {
      print(paste("Invalid choice. Choose from:", paste(weapon_options, collapse = ", ")))
    }
  }
}

# Start the game
play_game()
