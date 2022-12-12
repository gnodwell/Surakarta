## Installation :gear:

### Versions :gem:
We use:
- Ruby 2.5.5
- Rails 6.17
- Node 16.17.0

```diff 
- Having these versions installed on your machine is a requirement
```

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

### Creating the Players & Migrate the DB :computer:
First migrate the database with:

```bash
rails db:migrate
```

Then seed the db:

```bash
rails db:seed
```

Two users must be created using the rails console. This can easily be done by using the following commands.

To open the rails console, simply use:

```rails
rails c
```

Then use this to create the players:

```rails
player1 = User.new :name => "Player1"
player2 = User.new :name => "Player2"
player1.save()
player2.save()
```

## Running the server :runner:

To run the server, simply run the command:
```
rails server -d -p xxxx -b 0.0.0.0
```

Where "xxxx" is the port number.

For our port, you can run:

```bash
rails server -d -p 33030 -b 0.0.0.0
```

## Troubleshooting
Remove the 'node_modules' directory and 'yarn.lock' file.
Run ```yarn```

To get out of the ```rails:db``` or ```rails c``` simply use ```command + d``` or ```control + d```

## To test the Board class
Navigate to the app/helpers directory and run
```ruby testRunner.rb``` 
This will demonstrate the functionality of the board class for what could be implemeneted.

## Testing Coin and Game Session classes
From the root of the project and run
```rails test```
This will demonstrate the functionality of the Coin and Game Session that could be implemented

## To test the Piece class
Navigate to the app/helpers directory and run
```ruby piece.rb``` 
This will demonstrate the functionality of the piece class as it initializes a Piece and uses the setCaptured and getColor methods, and prints the state of the piece.

# Demo: Action Cables
- Click on the 'test action cable functionality' button on the main page
- Choose which player you are, and which one you would like to chat with
- Press the chat button
- Send a message to the other player
- In another browser window, repeat these steps but instead of choosing your chosen player (ex: Player1), choose a different one

## What's going on here?

This clearly demonstrates the usuage of the action cable and how messages are communicated over this medium.
In an actual game, players moves would be communicated over the action cable, and the server could process these moves.
