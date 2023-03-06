namespace :slurp do
  desc "TODO"
  task cities: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "US_Cities.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      new_city = City.new
      new_city.id = row["id"]
      new_city.city_name = row["city_name"]
      new_city.city_state = row["city_state"]
      new_city.save
    end
    puts "There are now #{City.count} rows in the cities table"

  end

end
