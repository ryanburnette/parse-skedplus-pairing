# SkedplusPairing [![Build Status](https://travis-ci.org/ryanburnette/skedplus_pairing.svg?branch=master)](https://travis-ci.org/ryanburnette/skedplus_pairing)

The goal of this project is to receive a text version of a pairing from
SkedPlus+, parse it, and return a useful array of objects.

## Usage

```
gem install skedplus_pairing
```

```ruby
require "skedplus_pairing"
```

```ruby
pairing = SkedplusPairing.new(File.open("pairing.txt").read)
```

## Contribute

Please contribute via pull request.

## License

Apache2
