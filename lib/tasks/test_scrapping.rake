namespace :test_scrapping do
  task :test do
    require 'scrapping/les_petites_tables'
    include Scrapping
    les_petites_tables
  end
end