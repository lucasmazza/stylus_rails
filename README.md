# Stylus for Rails apps

A gem to compile your [Stylus](https://github.com/LearnBoost/stylus) stylesheets in your ruby apps.

## Installation

Just add `gem 'stylus_rails'` To your `Gemfile`. Rails will load the Stylus Railtie on your app on the development environment, and classic Sinatra applications will have an extension registered on your current application. On any other cenario you can run `Stylus.compile` inside your ruby code.

## Folders

By default, `stylus_rails` will compile all files at `public/stylesheets/stylus` to the `public/stylesheets` folder. For instance, `public/stylesheets/stylus/application.styl` would generate `public/stylesheets/application.css`.

To change this behavior, on Rails apps, you can drop some configurations in an initializer to override the default paths.

    Stylus.root = File.join(Rails.root, 'app')
    Stylus.directory = 'stylus'
    Stylus.compile_directory = File.join(Rails.root, 'public', 'stylesheets')

## Sinatra

We all love [Sinatra](http://www.sinatrarb.com/), so we have a extension to your Sinatra applications.
When using classic applications, just requiring `stylus_rails` will load the extension inside the Sinatra stack. When going modular, you will need to register it yourself.

    require 'sinatra'
    require 'stylus_rails'

    class MyApp < Sinatra::Base
      register Stylus::Sinatra

      get '/' do
        'oh hai'
      end
    end

You can also customize the `root` and `compile_directory` options using the Sinatra settings:

    # storing your .styl files in ./styl ...
    set :stylus_root, File.dirname(__FILE__)
    # and compiling to ./public/stylesheets
    set :stylus_directory, File.join(setting.public, 'stylesheets')


## Rake task

`stylus_rails` bundles a rake task `stylus:compile` to recompile your `.styl` files whenever necessary. Just add the following to your Rakefile:

    require 'stylus_rails'
    load 'stylus_rails/tasks/compile.rake'

**NOTE** - *This task is included automatically on Rails apps, so you don't need to do this.*

## Partials

`stylus_rails` will skip all files starting with `_`, so you can use this naming convention on your partial files and import them on other files.

So, let's say that you have the following `_vendor.styl`:

    border-radius()
      -webkit-border-radius arguments
      -moz-border-radius arguments
      border-radius arguments

And a `application.styl`

    @import '_mixins'
    .button
      border-radius 5px

Stylus will compile your `application.styl` into a `application.css` and your `_vendor.styl` will be ignored.

## Changelog
[here.](https://github.com/lucasmazza/stylus_rails/blob/master/CHANGELOG.md)

## License

(The MIT License)

Copyright (c) 2011 Lucas Mazza &lt;luc4smazza@gmail.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.