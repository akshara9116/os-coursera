#!/usr/bin/env bash
# guessinggame.sh
# A guessing game that asks the user to guess the number of files in the current directory.

count_files() {
  # Count non-hidden files/entries in the current directory
  ls -1 | wc -l
}

give_hint() {
  local guess=$1
  local target=$2
  if [[ $guess -lt $target ]]; then
    echo "Too low. Try a bigger number."
  elif [[ $guess -gt $target ]]; then
    echo "Too high. Try a smaller number."
  fi
}

target=$(count_files)

echo "How many files are in the current directory?"

while true; do
  read -p "Enter your guess: " guess

  # Validate input is a non-negative integer
  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a whole number."
    continue
  fi

  if [[ $guess -eq $target ]]; then
    echo "🎉 Congratulations! $guess is correct."
    break
  else
    give_hint "$guess" "$target"
  fi
done
