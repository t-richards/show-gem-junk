# show-gem-junk

This tool helps you show junk contained in your gems.

## Installation

Install manually:

```bash
$ gem install show-gem-junk
```

## Usage

Display a compact table of gems by junk size:

```bash
$ show-gem-junk

Gem Name                Version       Size       Junk     % Junk
crass                     1.0.4     636 KB     556 KB      87.45
tzinfo                    1.2.5     891 KB     613 KB      68.74
```

Display each gem separately, with a table of junk files by size:

```bash
$ show-gem-junk -v

Gem Name: crass
Version:  1.0.4
Path:     /home/tom/.gem/ruby/2.6.0/gems/crass-1.0.4
Size:     636 KB
Junk:     556 KB
% Junk:   87.45

Junk File                                                          Size
crass-1.0.4/test/css-parsing-tests/color3_hsl.json               199 KB
crass-1.0.4/test/support/serialization/bootstrap.css             117 KB
crass-1.0.4/test/support/serialization/animate.css              71.2 KB
crass-1.0.4/test/support/serialization/pure.css                 34.8 KB
crass-1.0.4/test/css-parsing-tests/color3_keywords.json         22.8 KB
crass-1.0.4/test/shared/parse_rules.rb                          17.1 KB
crass-1.0.4/test/support/serialization/bootstrap-theme.css      16.4 KB
crass-1.0.4/test/css-parsing-tests/component_value_list.json      14 KB
crass-1.0.4/test/test_parse_properties.rb                       12.1 KB
crass-1.0.4/test/css-parsing-tests/README.rst                   9.15 KB
crass-1.0.4/test/css-parsing-tests/make_color3_keywords.py      6.73 KB
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bin/rake install`. To release a new version, update the version number in `version.rb`, and then run `bin/rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/t-richards/show-gem-junk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
