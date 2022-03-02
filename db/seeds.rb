# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Danger Zones", target: 0)
Category.create(name: "Medical Assistance", target: 0)
Category.create(name: "Shelters", target: 0)
User.create!(username: 'moritz', email: 'moritz@quast.co', password: '123456', role: 1)
Post.create(title: "WTF", content: "skjhaksjdhkajshkjajshdkjhasd", user_id: 1)
