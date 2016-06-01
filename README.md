Codeforbuenosaires
===============

[![Build Status](https://travis-ci.org/codeforbuenosaires/codeforbuenosaires.org.svg?branch=master)](https://travis-ci.org/codeforbuenosaires/codeforbuenosaires.org)

## Running local server

### Git pre push hook

You can modify the [pre-push.sh](script/pre-push.sh) script to run different scripts before you `git push` (e.g Rspec, Linters). Then you need to run the following:

```bash
  chmod +x script/pre-push.sh
  ln -s ../../script/pre-push.sh .git/hooks/pre-push
```

You can skip the hook by adding `--no-verify` to your `git push`.

### 1- Installing Ruby

- Clone the repository by running `git clone git@github.com:Wolox/codeforbuenosaires.git`
- Go to the project root by running `cd codeforbuenosaires`
- Download and install [Rbenv](https://github.com/rbenv/rbenv#basic-github-checkout).
- Download and install [Ruby-Build](https://github.com/rbenv/ruby-build#installing-as-an-rbenv-plugin-recommended).
- Install the appropriate Ruby version by running `rbenv install [version]` where `version` is the one located in [.ruby-version](.ruby-version)

### 2- Installing Rails gems

- Install [Bundler](http://bundler.io/).

```bash
  gem install bundler --no-ri --no-rdoc
  rbenv rehash
```
- Install basic dependencies if you are using Ubuntu:

```bash
  sudo apt-get install build-essential libpq-dev nodejs
```

- Install all the gems included in the project.

```bash
  bundle -j 20
```

### Database Setup

Run in terminal:

```bash
  sudo -u postgres psql
  CREATE ROLE "codeforbuenosaires" LOGIN CREATEDB PASSWORD 'codeforbuenosaires';
```

Log out from postgres and run:

```bash
  bundle exec rake db:create db:migrate
```

Your server is ready to run. You can do this by executing `rails server` and going to [http://localhost:3000](http://localhost:3000). Happy coding!

## Deploy Guide

#### Heroku

If you want to deploy your app using [Heroku](https://www.heroku.com) you need to do the following:

- Add the Heroku Git URL to your remotes
- Push to heroku
- Run migrations

```bash
	git remote add heroku-prod your-git-url
	git push heroku-prod your-branch:master
	heroku run rake db:migrate -a your-app-name
```

# Documentation

You can find more documentation in the [docs](docs) folder

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run rspec tests (`bundle exec rspec spec -fd`)
5. Run scss lint (`bundle exec scss-lint app/assets/stylesheets/`)
6. Run rubocop lint (`bundle exec rubocop app spec -R`)
7. Push your branch (`git push origin my-new-feature`)
8. Create a new Pull Request

## About

This project is maintained by [Esteban Guido Pintos](https://github.com/epintos)

## License

See [LICENSE.md](LICENSE.md)
