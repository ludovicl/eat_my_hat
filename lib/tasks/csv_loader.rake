namespace :csv_loader do
  desc "Import a csv to database"
  task :import, [:csv_file] => :environment  do |_, args|
    require 'data_loader/load_csv'
    include DataLoader
    load_csv args[:csv_file]
  end
end