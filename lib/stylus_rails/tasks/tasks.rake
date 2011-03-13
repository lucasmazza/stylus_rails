namespace :stylus do
  prereq = defined?(::Rails) ? :environment : []
  path = File.join(Stylus.root, Stylus.directory).gsub(Dir.pwd, ".")

  desc "Compiles all the .#{Stylus.extension} inside '#{path}' into css files."
  task :compile => prereq do
    Stylus.compile
  end
end