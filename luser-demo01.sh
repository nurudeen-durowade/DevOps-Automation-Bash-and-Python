#!/bin/bash



# This script displays various information to the screen

# Display the text 'Hello'

echo 'Hello'

#Assign a value to a variable

WORD='script'




# Display that value using the variable

echo "$WORD"

# Demonstrate that single quotes cause variables to NOT get expanded

echo "$WORD"


# combine the variable with hard-coded text.

# echo "This is a shell $WORD"

# Display the contents of the variable using an alternative syntax

echo "This is a shell ${WORD}"

# Append text the variable

echo "${WORD}ing is fun"

#Create a new variables
ENDING='ed'

#combine the two variables

echo "This is ${WORD}${ENDING}."

#Change the value stored in the ending variables

ENDING='ing'

echo "${WORD}${ENDING} is fun"

#Reassing value to ENDING

ENDING='s'

echo "You are going to write many ${WORD}${ENDING} in the class!"
