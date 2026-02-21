#!/bin/bash


# Enforces that it be executed with superuser (root) privileges.



# if the script is not executed with superuser privileges it will not attempt to create a User and returns and exit status of 1

SUPERUSER_ID=0


if [[ "${UID}" -ne "${SUPERUSER_ID}" ]];
then
  echo "You are not a rootuser, please login as root"
  exit 1
fi


# Prompts the person who executed the script to enter the Username (login)

read -p "Enter your Username: " USER_NAME


# The name of person who will be using the account

read -p 'Enter the name associated with the account: ' COMMENT

# The initial password for the account

read -p 'Enter the password to use for the account: ' PASSWORD



# Creates a new user on the local system with input provided the user.
useradd -c "${COMMENT}" -m ${USER_NAME}


# informs user if the account was not able to be created for some reason
if [[ "${?}" != 0 ]];
then
  echo "Account was NOT created successfully"
  exit 1
fi



# Set the password
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}


if [[ "${?}" -ne 0 ]];
then
  echo 'The password for the account could not be set'
  exit 1
fi


# Force change password on first login
passwd --expire ${USER_NAME}



echo "Account created successfully"

# Displays the username, password, and host where the account was created. This way the help desk can copy the output of
# the script in order to easily deliver the information to the new account holder

echo

echo "UserName: "
echo "${USER_NAME}"

echo

echo "RealName: "
echo "${COMMENT}"

echo

echo "Password: "
echo "${PASSWORD}"

echo

echo "Hostname: "
echo "${HOSTNAME}"

exit 0
