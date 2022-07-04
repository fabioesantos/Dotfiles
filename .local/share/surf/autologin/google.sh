#!/bin/sh
read -p "Name: " name
read -p "Password: " pass
echo
curl --cookie ~/.cache/surf/cookies.txt --cookie-jar ~/.cache/surf/cookies.txt \
    -d "session[fabioesantos.bio@gmail.com]=$name" \
    -d "session[password]=$pass" \
    -d "remember_me=1" \
    -d "commit=Sign In" \
    https://youtube.com/ > /dev/null
curl --cookie ~/.cahe/surf/cookies.txt --cookie-jar ~/.cache/surf/cookies.txt \
    https://youtube.com > /dev/null
surf https://youtube.com
