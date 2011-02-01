namespace :stylus do
  desc "Compiles all the .#{Stylus.extension} inside '#{Stylus.folder}'"
  task :compile => :environment do
    Stylus.compile
  end
end