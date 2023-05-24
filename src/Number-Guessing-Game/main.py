#Kaitlyn Cao | Feb 1 2023 | Computer Programming 1 Python | Number Guessing Game
#include an import statement for random
#set guess to something not possibly equal to x and attempts/counter as 0
import random
guess = 0
counter = 0
play = "yes"
#print a welcome to the user and invite them to supply a number between 1-100
print("Welcome to Number Guessing Game \n Please guess a number between 1-100")
#repeat
while play == "yes":
#create a random and set it as a variable called x
  x = random.randint(1,100)
#create a integer for the users guess
  while guess != x:
    guess = int(input("Please enter an integer: "))
    counter += 1
#give clues to whether guess was too high or low 
    if guess < x:
     print("You guessed " + str(guess) + ". Your guess was too low.")
    elif guess > x:
      print("You guessed " + str(guess) + ". You guess was too high.")
    else:
      print("You guessed " + str(guess) + ". Correct! You guessed the number in " + str(counter) + " attempts.")

#ask if user wants to play again
  play = input("Do you want to play again? yes/no")

if play == "no":
  print("Play again next time. bye")

