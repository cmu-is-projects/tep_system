# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Schools.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  s = School.new
  s.name = row['Organization Name']
  s.phone = row['Phone']
  s.save
end
puts "There are now #{School.count} rows in the schools table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'Teachers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Teacher.new
  t.first_name = row['First Name']
  t.last_name = row['Last Name']
  t.email = row['Work Email']
  t.phone = row['Work Phone']
  school = School.where(name: row['Primary Affiliation']).first
  if (!school.nil?)
  	t.school_id = School.where(name: row['Primary Affiliation']).first.id
    t.save
  end
end
puts "There are now #{Teacher.count} rows in the teachers table"