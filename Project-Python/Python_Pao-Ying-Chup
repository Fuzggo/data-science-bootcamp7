import random

choices = ["rock", "paper", "scissors"]

def determine_winner(player_choice, computer_choice):
    if player_choice == computer_choice:
        return "It's a tie!"
    elif (
        (player_choice == "rock" and computer_choice == "scissors")
        or (player_choice == "scissors" and computer_choice == "paper")
        or (player_choice == "paper" and computer_choice == "rock")
    ):
        return "You win!"
    else:
        return "Computer wins!"

while True:
    print("\nRock, Paper, Scissors Game")
    print("Welcome to Pao-Ying-Chup Game! Choose your move: rock, paper, or scissors. If you want to quit, type 'exit'.")
    player_choice = input("Your choice: ").lower()

    if player_choice == "exit":
        print("Thanks for playing!")
        break

    if player_choice not in choices:
        print("Invalid choice. Please choose rock, paper, or scissors.")
        continue

    computer_choice = random.choice(choices)
    print(f"Computer's choice: {computer_choice}")

    result = determine_winner(player_choice, computer_choice)
    print(result)
