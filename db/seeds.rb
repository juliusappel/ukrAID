# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category target_group: 0 = Both, 1 = Ukrainian, 2 = Rest of the world

puts "Start seeding database.."

puts "Creating categories.."
# Using top-level of administrative divisions of Ukraine (Source: https://en.wikipedia.org/wiki/Administrative_divisions_of_Ukraine#First-level_administrative_divisions)
Category.destroy_all
Category.create(name: "Ки́їв", target_group: 1) # Kyiv
Category.create(name: "Севастополь", target_group: 1) # Sevastopol
Category.create(name: "Автономна Республіка Крим", target_group: 1) # Autonomous Republic of Crimea
Category.create(name: "Черка́ська о́бласть", target_group: 1) # Cherkasy Oblast
Category.create(name: "Черні́гівська о́бласть", target_group: 1) # Chernihiv Oblast
Category.create(name: "Черніве́цька о́бласть", target_group: 1) # Chernivtsi Oblast
Category.create(name: "Дніпропетро́вська о́бласть", target_group: 1) # Dnipropetrovsk Oblast
Category.create(name: "Доне́цька о́бласть", target_group: 1) # Donetsk Oblast
Category.create(name: "Іва́но-Франкі́вська о́бласть", target_group: 1) # Ivano-Frankivsk Oblast
Category.create(name: "Харківська́ о́бласть", target_group: 1) # Kharkiv Oblast
Category.create(name: "Херсо́нська о́бласть", target_group: 1) # Kherson Oblast
Category.create(name: "Хмельни́цька о́бласть", target_group: 1) # Khmelnytskyi Oblast
Category.create(name: "Ки́ївська о́бласть", target_group: 1) # Kyiv Oblast
Category.create(name: "Кіровогра́дська о́бласть", target_group: 1) # Kirovohrad Oblast
Category.create(name: "Луга́нська о́бласть", target_group: 1) # Luhansk Oblast
Category.create(name: "Льві́вська о́бласть", target_group: 1) # Lviv Oblast
Category.create(name: "Микола́ївська о́бласть", target_group: 1) # Mykolaiv Oblast
Category.create(name: "Оде́ська о́бласть", target_group: 1) # Odessa Oblast
Category.create(name: "Полта́вська о́бласть", target_group: 1) # Poltava Oblast
Category.create(name: "Рі́вненська о́бласть", target_group: 1) # Rivne Oblast
Category.create(name: "Сумська́ о́бласть", target_group: 1) # Sumy Oblast
Category.create(name: "Тернопі́льська о́бласть", target_group: 1) # Ternopil Oblast
Category.create(name: "Ві́нницька о́бласть", target_group: 1) # Vinnytsia Oblast
Category.create(name: "Воли́нська о́бласть", target_group: 1) # Volyn Oblast
Category.create(name: "Закарпатська область", target_group: 1) # Zakarpattia Oblast
Category.create(name: "Запорізька область", target_group: 1) # Zaporizhzhia Oblast
Category.create(name: "Жито́мирська о́бласть", target_group: 1) # Zhytomyr Oblast


# Aid categories

# "How to help" categories

puts "#{Category.all.length} categories created"

# !!! DELETE FOR PRODUCTION !!!
puts "Creating team account"
User.create(email: "example@gmail.com", password: "123456", username: "ukrAID-team", role: 1)

puts "Seeding done!"
