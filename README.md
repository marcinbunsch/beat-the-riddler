# Welcome to Hackstrap

Hackstrap is a basic Rails 4 app with Github and Twitter login. I use it as a base for apps supporting events.

### Development

You can run Hackstrap in development without Twitter or Github setup.

To access as a player, run:

```bash
MOCK_USER=true bundle exec rails s
```

To access as staff, run:

```bash
MOCK_USER=staff bundle exec rails s
```

### Testing

Tests are in rspec, the whole app is not covered, but there's enough for you to check out how you can test additions.

### Setting up on heroku

First, get the Heroku Toolbelt. Then:

```bash
heroku apps:create [NAME]
heroku config:set SECRET_KEY_BASE=[secret key]
heroku run rake db:migrate --app [NAME]
```

Afterwards, set up a GitHub app with `callback_url` set to https://[NAME].herokuapp.com/oauth/github/callback.
Then, set up a Twitter app with `callback_url` set to https://[NAME].herokuapp.com/oauth/twitter/callback.

When you have tokens for both apps, run:

```bash
heroku config:set GITHUB_APP_ID=[github client id] GITHUB_SECRET=[github client secret]
heroku config:set TWITTER_TOKEN=[github client id] TWITTER_SECRET=[github client secret]
```

And then go to https://[NAME].herokuapp.com.

### License

License is MIT. See LICENSE for details.

