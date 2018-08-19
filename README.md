# Script2md

It is a Simple Ruby gem.

Convert script file ( e.g `.sh` `.rb` ) to Markdown file.

It just only replace script comment line with markdown plain text, and script command line with markdown (fenced) codeblock.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'script2md'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install script2md

## Usage

### Command 

```
sc2md spec/fixtures/example.sh
```

or

```
sc2md https://raw.githubusercontent.com/YumaInaura/script2md/master/spec/fixtures/example.sh
```

### IN FILE

```sh
#!/bin/bash -eu

# # Header1
# 
# This is example script for
# convert to markdown style

# ## Header2

echo ok
echo ok # line end code comment

# This is comment line
# This is comment line

echo some command
echo "i wanna conver to markdown this file"
```

### OUT FILE

    ```
    # Header1
    
    This is example script for
    convert to markdown style
    
    ## Header2
    
    ```sh
    echo ok
    echo ok # line end code comment
    ```
    
    This is comment line
    This is comment line
    
    ```sh
    echo some command
    echo "i wanna conver to markdown this file"
    ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/script2md. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Script2md project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/YumaInaura/script2md/blob/master/CODE_OF_CONDUCT.md).
