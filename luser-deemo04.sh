#!/bin/bash

# This script creates an account on the local system.


#You willl be prompted for the account name and password.


# Ask for the user name.

read -rp 'Enter the username to create: ' USER_NAME




# Ask for the real name.

read -rp 'Enter the name of the person who this account is for: ' COMMENT




# Ask for the password

read -rsp 'Enter the password to use for the account: ' PASSWORD

read -rsp 'Enter the password to use for the account: ' CONFIRM_PASSWORD


if (( PASSWORD != CONFIRM_PASSWORD)); then
    echo " Your passwords are not the same please check again"
    exit 1
fi


# Create the user.

# -c for comment used for the user's fullname

# -m used to force create a home directory for the user..

useradd -c "${COMMENT}" -m "${USER_NAME}"


# Set the password for the user.

echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"

# Force change password on the first login.

passwd --expire "${USER_NAME}"
