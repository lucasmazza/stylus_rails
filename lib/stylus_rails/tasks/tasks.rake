namespace :stylus do
  desc "Parses all the .#{Stylus.extension} inside '#{Stylus.folder}'"
  task :parse => :environment do
    Stylus.parse
  end
end