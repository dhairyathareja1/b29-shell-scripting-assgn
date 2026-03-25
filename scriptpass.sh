#!/bin/bash

read -s -p "Enter your password: " password
echo ""

if [ -z "$password" ]; then
    echo "Weak"
    exit
fi

length_check=0
digit_check=0
special_check=0
upper_check=0
lower_check=0

len=$(echo "$password" | wc -c)
if [ $len -ge 9 ]; then
    length_check=1
fi

echo "$password" | grep -q "[0-9]"
if [ $? -eq 0 ]; then
    digit_check=1
fi

echo "$password" | grep -q "[!@#$%^&*]"
if [ $? -eq 0 ]; then
    special_check=1
fi

echo "$password" | grep -q "[A-Z]"
if [ $? -eq 0 ]; then
    upper_check=1
fi

echo "$password" | grep -q "[a-z]"
if [ $? -eq 0 ]; then
    lower_check=1
fi

score=$((length_check + digit_check + special_check + upper_check + lower_check))

if [ $score -le 2 ]; then
    echo "Weak"
elif [ $score -le 4 ]; then
    echo "Medium"
else
    echo "Strong"
fi
