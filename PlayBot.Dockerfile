FROM ubuntu:latest

RUN mkdir /var/www/
RUN mkdir /var/www/DiscordSpeechBot
WORKDIR /var/www/DiscordSpeechBot

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y git vim g++ cmake

RUN apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs 

RUN git clone https://github.com/healzer/DiscordSpeechBot.git .
RUN npm install
RUN npm update
RUN npm install pm2@latest -g

# provide API credentials through the settings.json file OR the environment variables: 

# COPY settings.json /var/www/DiscordSpeechBot/settings.json

ENV DISCORD_TOK= MTEzOTIwMzIyMTYxMzcxMTU3Mg.GhWIhi.rih9JB8xfTrLRXubun6YeNMBv2kRiOMRkxzdok
ENV WITAPIKEY= f505a53d92364305a6a7fde3b792546b
ENV SPOTIFY_TOKEN_ID= 11b6decdb9784ffda10454c3af598352
ENV SPOTIFY_TOKEN_SECRET= F26MU3Z4LWUCOLIHPVHJKVEC5ARYGEHC

CMD git pull && npm update && pm2 start ecosystem.config.js
