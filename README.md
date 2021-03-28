# Advent of Code - Ruby

This repository serves as a template for the Advent of Code challenge, using Ruby as the language for solving the daily problems. This application includes:

* A CLI interface for executing the challenge code directly
* An RSpec collection for refactoring

## Structure

For each challenge day, there is an entry file located at `dayX/main.rb`, with three methods:

1. An `initialize`, which takes in the puzzle input as an argument
1. `part1`, which returns the result for Part 1
1. `part2`, which returns the result for Part 2

When you receive your problem input, you can paste it into `dayX/input.txt`, and it will be automatically read in with the CLI input and RSpec tests.

In the root folder is a `main.rb`, which can be executed via CLI, and serves as an entry for all of the daily challenge classes.

There is also a `spec/` folder with RSpec tests for each day. There is a `dayX_spec.rb` for each day, which contains a test block for each part.

# Setup

1. Run `gem install bundler` if you do not have Bundler installed
1. Run `bundle install` to setup Rubocop and RSpec
2. 

## Using the CLI

1. Run `ruby main.rb` from your CLI
1. When prompted, enter the day for which you want to output your solution.

## Using RSpec Tests

1. After solving a problem, paste your solution into the appropriate test block as `:expected`
1. Run the test via CLI using `rspec spec/dayX_spec.rb`, or from within RubyMine

## Using RuboCop

You can run `rubocop` to analyze your code quality. You can also autofix some minor infractions with `rubocop -a`.

# License

Advent of Code - Ruby is released under the [MIT License](https://opensource.org/licenses/MIT).