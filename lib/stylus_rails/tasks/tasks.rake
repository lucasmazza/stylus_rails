namespace :stylus do
  task :parse => :environment do
    Stylus.parse
  end
end