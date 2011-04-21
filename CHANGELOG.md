## Changelog

### 0.1.3 (2011-04-20)
[Compare view](http://github.com/lucasmazza/stylus_rails/compare/v0.1.2...v0.1.3)

* `Stylus` will raise an exception if the compilation fails. You can turn this off with `Stylus.silent = true`.
* Added `Stylus.logger` to handle the output from stylus. On Rails applications this will be the standard Rails logger.

### 0.1.2 (2011-04-10)
[Compare view](http://github.com/lucasmazza/stylus_rails/compare/v0.1.1...v0.1.2)

* Bug fixes on `Stylus::Railtie`.

### 0.1.1 (2011-03-29)
[Compare view](http://github.com/lucasmazza/stylus_rails/compare/v0.1.0...v0.1.1)

* Isolating the `mattr_accessor` core ext to a module, avoiding conflicts with AS code.

### 0.1.0 (2011-03-28)
[Compare view](http://github.com/lucasmazza/stylus_rails/compare/v0.0.3...v0.1.0)

* Sinatra plugin added. Check the docs for usage and configuration;
* The rake task can be used standalone using `load 'stylus_rails/tasks/compile.rake'`;
* Compress flag changed from `-C` to `-c` ([see it here](https://github.com/LearnBoost/stylus/commit/910246859718e1817c9a76683f9a892e4cad4965)). Be sure to have stylus 0.9.0 or higher installed.

### 0.0.3 (2011-03-13)
[Compare view](http://github.com/lucasmazza/stylus_rails/compare/v0.0.2...v0.0.3)

* Added 'compile_directory' option, so you can output the generated .css files on any other folder. (by [sebastiandeutsch](https://github.com/sebastiandeutsch))

### 0.0.2 (2011-02-02)
[Compare view](http://github.com/lucasmazza/stylus_rails/compare/v0.0.1...v0.0.2)

* Support to the `-C` flag. Turned on by default;
* Grouping paths by their output dir, so all the files inside the same folder will be compiled using one single command;
* The output dir will be created if it doesn't exists.

### 0.0.1 (2011-02-01)

* Initial Release.
