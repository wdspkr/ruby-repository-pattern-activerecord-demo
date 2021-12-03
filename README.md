This is a demo repository to show an implementation of the Repository design pattern with Activerecord

To run the specs do the following:

```
$ bundle install
$ bundle exec rspec spec
```

If you are interested in how this can be integrated with Factory Bot check the `spec/interest_factory.rb` file.

To play around with the code just fire up an interactive ruby session like this:

```
$ bundle exec pry
```

and in the pry session and require the app code like this:

```ruby
require_relative 'load_app'
```

Enjoy exploring!
