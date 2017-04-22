namespace :test_scrapping do
  desc 'Import a csv to database'
  task test: :environment do
    require 'scrapping/les_petites_tables'
    include Scrapping
    les_petites_tables
  end
end
