#!/bin/bash

# Enforce that it be executed with root user privilege



if [[ "${UID}" -ne 0 ]]; then
    echo 'You must execute the command as a root user'
    exit 1
fi

# Provide a usage statement much like you would find in a man page if the user does not supply an accout name.
#on the command line and and return an exit status of 1

# NUMBER_OF_PARAMETERS="${#}"

NUMBER_OF_PARAMETERS="${#}"

echo "You supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line."



if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]];
then
  echo "Usage: ${0} USER_NAME [COMMENT] ..."
  exit 1
fi

#uses the first argument provided the command line as the username for the account. Any remaining arguments on the 
# command line will be treated as the comment for the account.


# First parameter is the username

USER_NAME="${1}"


#The rest of the parameter are for the account comments.
shift

COMMENT="$*"



#Generate a password

PASSWORD=$(date +%s%N | sha256sum | head -c48)








# Create the user with the password

useradd -c "${COMMENT}" -m "${USER_NAME}"



# Inform the user if the account was not able to be created for some reason. If the account is not created, the script
# is to return exit status of 1

if [[ ${?} -ne 0 ]];
then
    echo 'The account creation failed'
    exit 1

fi

echo
# Display the username, password, and host where the account was created. This way the help desk can copy output of
# the script in order to easi;y deliver the information to the new account holder

echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"

if [[ ${?} -ne 0 ]];
then
    echo 'The password for the account could not be set'
    exit 1

fi


# Force password change on first login

passwd --expire "${USER_NAME}"


echo 'username'
echo "${USER_NAME}"
echo

echo 'password'
echo "${PASSWORD}"
echo


echo 'hostname'
echo "${HOSTNAME}"

exit 0