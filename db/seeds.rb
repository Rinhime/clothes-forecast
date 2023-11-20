# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.new(:email => '111@gmail.com', :password => '1111111')
admin.save!

Tag.create([
  { tag_name: '春' },
  { tag_name: '夏' },
  { tag_name: '秋' },
  { tag_name: '冬' },
  ])