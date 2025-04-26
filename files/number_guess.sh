#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:";
read USERNAME

USER_ID="$($PSQL "select user_id from users where username='$USERNAME'")"

if [[ -z $USER_ID ]]
then 
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT="$($PSQL "insert into users (username,games_played,best_guess) values ('$USERNAME',0,0)")"
  USER_ID="$($PSQL "select user_id from users where username='$USERNAME'")"
else
  GAMES_PLAYED="$($PSQL "select games_played from users where username='$USERNAME'")"
  BEST_GUESS="$($PSQL "select best_guess from users where username='$USERNAME'")"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
fi
echo -e "\nGuess the secret number between 1 and 1000:"

COMP_GUESS=$(( $RANDOM % 1000 + 1))

GUESSES=0

AGAIN(){
  read USER_GUESS
  GUESSES=$(( $GUESSES + 1 ))
}

AGAIN

while [[ ! $USER_GUESS == $COMP_GUESS ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    AGAIN
  elif [[ $USER_GUESS -gt $COMP_GUESS ]]
  then
    echo "It's lower than that, guess again:"
    AGAIN
  else
    echo "It's higher than that, guess again:"
    AGAIN
  fi
done

if [[ $BEST_GUESS -lt 1 ]]
then
  INIT=$($PSQL "update users set best_guess='$GUESSES' where username='$USERNAME'")
else
  if [[ $BEST_GUESS -gt $GUESSES ]]
  then
    INIT=$($PSQL "update users set best_guess='$GUESSES' where username='$USERNAME'")
  fi
fi

NEW_GAME=$(( $GAMES_PLAYED + 1 ))
INIT=$($PSQL "update users set games_played='$NEW_GAME' where username='$USERNAME'")

echo "You guessed it in $GUESSES tries. The secret number was $COMP_GUESS. Nice job!"
