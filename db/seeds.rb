# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require './config/environment'
require 'csv'


CSV.foreach("./db/gi_values.tsv", :headers => true, :header_converters => :symbol, :col_sep => "\t") do |row|
    p "row: #{row}"
    Food.create!(row.to_hash)
end
