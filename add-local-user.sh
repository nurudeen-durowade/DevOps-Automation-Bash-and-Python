#!/bin/bash

# This script create a new user on the local syste,


# You will be prompted to enter the username (login), the person name, and a password.

# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.

if (( "$UID" != 0)); then
    echo 'You must execute the script as a root user '
    exit 1
fi


# Get the username (login).
read -rp 'Enter the username to create: ' USER_NAME


# Get the user real name.

read -rp 'Enter the full name of the person or application that will be using this account: ' COMMENT


# Get the password.


read -rsp 'Enter the password to use for the account: ' PASSWORD


read -rp 'confirm your password: ' CONFIRM_PASSWORD


if (( PASSWORD != CONFIRM_PASSWORD)); then
    echo 'Your passwords are not the same please check again'
    exit 1
fi

#Create the account

useradd -c "${COMMENT}" -m "${USER_NAME}"

# Function to check if user was added successfully

check_useradded() {

    if id "${USER_NAME}" &>/dev/null; then
        echo "User ${USER_NAME} was created successfully"
        return 0
    else
        echo "Failed to create user '$USER_NAME' ❌"
        return 1
    fi
    


}

# check to see if the user add command succeeded

# We don't want to tell the user that an account was created when it hasn't been.


#if [[ "${?}" -ne 0 ]]; then
if ! check_useradded; then
    echo 'The account could not be created.'
    exit 1
fi


# Set the password

echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"

if [[ "${?}" -ne 0 ]]; then
    echo 'The password for the account could not be set'
    exit 1
fi

# Force Password change on first login

passwd -e "${USER_NAME}"

# Display the username, password, and the host in which it was created.

echo 

echo 'username:'
echo "${USER_NAME}"

echo

echo 'password:'
echo "${PASSWORD}"

echo

echo 'host:'
echo "${HOSTNAME}"
exit 0




