# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: 'foodlab@gmail') do |admin|
  admin.password = "foodlab1321"
end

Genre.find_or_create_by!(name: '朝食')

Genre.find_or_create_by!(name: '昼食')

Genre.find_or_create_by!(name: '夕食')

Genre.find_or_create_by!(name: '間食')

Genre.find_or_create_by!(name: 'お弁当')

Genre.find_or_create_by!(name: 'デザート')

Genre.find_or_create_by!(name: 'おやつ')
