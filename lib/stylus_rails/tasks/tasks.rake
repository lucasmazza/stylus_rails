namespace :stylus do
  desc "Compiles all the .#{Stylus.extension} inside 'public/stylesheets/#{Stylus.directory}' into css files."
  task :compile => :environment do
    Stylus.compile
  end
end