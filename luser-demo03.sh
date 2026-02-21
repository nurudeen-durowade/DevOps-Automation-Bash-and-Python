#!/bin/bash


# Display the UID and username of the user executing this script.

# Display if the user is the vagrant user or NOT

# Display the UID

echo "Your UID is ${UID}"




# Only display if the UID does not match 1000.
UID_TO_TEST_FOR='1000'

#if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]];
if (( UID != UID_TO_TEST_FOR ))
then
  echo "Your UID does not match ${UID_TO_TEST_FOR}"
  #exit 1
fi

# functions in bash

# check_uid() {

# (( UID == UID_TO_TEST_FOR))

# }


# Test is the command succeeded.

# ${?} saves the last exit status of the most recent command

#if [[ "${?}" -ne 0 ]];




# You can use a string test conditional

# Display the USER_NAME

USER_NAME=$(id -un)

USER_NAME_TO_TEST_FOR='vagrant'



if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]];
then
  echo "Your username matches ${USER_NAME_TO_TEST_FOR}"
else
  echo "Your username doesn't match ${USER_NAME_TO_TEST_FOR}"
  exit 1
fi

exit 0

# Test for != (notequal) for the string

# if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]];
# then
#   echo "Your username doesn't match ${USER_NAME_TO_TEST_FOR}"
#   exit 1
# fi

# exit 0
