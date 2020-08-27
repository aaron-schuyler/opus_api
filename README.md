# Opus API

This is the backend ruby on rails API for the opus frontend writing app which can be found here: [Opus](https://github.com/aaron-schuyler/opus.git)

## Installation

* clone this repo
* run `bundle install`
* run `rails db:migrate`
* create a .ENV file
* add a key to .ENV called `JWT_SECRET`, give it any secure value you feel like
* add a key to .ENV called `CLIENT_URL` with a value of your client domain

To run locally, set `CLIENT_URL` to `http://localhost:8000` and use static-server or another local static server to serve the frontend at localhost on port 8000.

## Usage

Simply run `rails s` to start the server on port 3000

## License
[MIT](https://choosealicense.com/licenses/mit/)
