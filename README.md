# README
## Setup
- Go [tokbox.com](http://tokbox.com) and grab the API keys
- Add API keys to config/application.yml:
opentok_api_key: your_api_key
opentok_api_secret: your_api_secret

## Deploy to heroku
- Setup app locally
- $ heroku config:set opentok_api_key=your_api_key opentok_api_secret=your_api_secret
- $ heroku create
- $ git push heroku master
- $ heroku open
