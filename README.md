[![Gem Version](https://badge.fury.io/rb/freight_calc.svg)](https://rubygems.org/gems/freight_calc)

# Freight Calculator

It will help you calculate the distance and cost of cargo delivery. Thanks to simple settings, it can become an indispensable tool for both private couriers and large companies. If you'll needed more sensitive settings look at the source code to make it.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add freight_calc

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install freight_calc

## Usage

Add the gem to your Gemfile:

```ruby
gem "freight_calc"
```

Then you'll need to get API key from https://distancematrix.ai/ and put this API_KEY in your .env file as DISTANCE_API_KEY

Example code to use :

```ruby
...

def calculate_price
    calculator = DistCalculator.new(weight, length, width, height, origin, destination)
    calculator.calculate_price
  end

  def calculate_distance
    dist_calculator = DistCalculator.new(weight, length, width, height, origin, destination)
    dist_calculator.calculate_distance / 1000
  end
...

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/freight_calc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/freight_calc/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FreightCalc project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freight_calc/blob/master/CODE_OF_CONDUCT.md).
