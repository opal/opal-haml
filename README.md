# opal-haml

Haml templates for opal

## Usage

Add opal-haml to your `Gemfile`:

```ruby
gem 'opal-haml', :github => 'opal/opal-haml'
```

Create a haml file in the opal load path (e.g. `app/user_template.haml`):

```haml
.row
  .col-md-6
    = self.name
  .col-md-6
    = self.age
```

Render the haml template:

```ruby
# app/application.rb
require 'opal-haml'
require 'user_template'

class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name, @age = name, age
  end
end

user = User.new('Ford Perfect', 42)
html = Template['user_template'].render(user)
puts html
# => <div class="row">...</div>
```

## Running tests

Get dependencies:

```
$ bundle install
```

Run tests using opal-rspec:

```
$ bundle exec rake
```

## License

(The MIT License)

Copyright (C) 2013 by Adam Beynon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
