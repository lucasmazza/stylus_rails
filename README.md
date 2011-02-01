# Stylus for Rails apps

A tiny `Railtie` to parse your style files located at `public/stylesheets/stylus/*.stylus` between HTTP Requests during Rails development.


## Installation

Just add `gem 'stylus_rails'` To your `Gemfile`.

## Partials

`stylus_rails` will skip all files starting with `_`, so you can use this naming convention with your partial styles.

## Folders

By default, `stylus_rails` will compile all files existing at `public/stylesheets/stylus` to the `public/stylesheets` folder. For instance, `public/stylesheets/stylus/application.stylus` would generate `public/stylesheets/application.css`.

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