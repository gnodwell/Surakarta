## Installation :gear:

### Ruby version :gem:
We use Ruby 2.5.5 for our application.

### System dependencies :hammer:
To install dependencies, simply change the current directory to 'Surakarta' and run:

```
bundle config --local disable_platform_warnings true
bundle install --path vendor/bundle
```

### Configuration :screwdriver:

#### Update Yarn :yarn:
```
yarn add –check-files
```

#### Install webpacker :space_invader:
```
rails webpacker:install
```
This will take a few minutes...

## Running the server :runner:

To run the server, simply run the command:
```
rails server -d -p xxxx -b 0.0.0.0
```

Where "xxxx" is the port number.

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
