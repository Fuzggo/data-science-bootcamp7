import time
def Order_pizza():
    print("Welcome to my pizza store, what do you want to order?")
    time.sleep(1)
    print("Here are your options:")
    time.sleep(1)
    print("1. Margherita")
    time.sleep(1)
    print("2. Pepperoni")
    time.sleep(1)
    print("3. Vegetarian")
    time.sleep(1)

    choice = input ("Please enter the number of the pizza you'd like to order: ")

    if choice == '1' or '1. Margherita':
        print("You've ordered a Margherita pizza! Our kitchen is now working its magic to prepare your meal. Please wait a moment")
    elif choice == '2' or '2. Pepperoni':
        print("You've ordered a Pepperoni pizza! Our kitchen is now working its magic to prepare your meal. Please wait a moment")
    elif choice == '3' or '3. Vegetarian':
        print("You've ordered a Vegetarian pizza! Our kitchen is now working its magic to prepare your meal. Please wait a moment")
    else:
        print("Sorry, we don't have that option.")

    while True:
        user_input = input("Your order has been received. Would you like to order another pizza? (yes/no): ").lower()
    
        if user_input == "yes":
            Order_pizza()
        elif user_input == "no":
            print("It's been a pleasure serving you. Take care, and see you on your next visit!")
        break
    else:
        print("I'm sorry, I didn't understand that. Please answer with 'yes' or 'no'.")
