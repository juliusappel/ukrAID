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
Category.create(name: "Kyiv", target_group: 1) # Kyiv - Ки́їв
Category.create(name: "Sevastopol", target_group: 1) # Sevastopol - Севастополь
Category.create(name: "Autonomous Republic of Crimea", target_group: 1) # Autonomous Republic of Crimea - Автономна Республіка Крим
Category.create(name: "Cherkasy Oblast", target_group: 1) # Cherkasy Oblast - Черка́ська о́бласть
Category.create(name: "Chernihiv Oblast", target_group: 1) # Chernihiv Oblast - Черні́гівська о́бласть
Category.create(name: "Chernivtsi Oblast", target_group: 1) # Chernivtsi Oblast - Черніве́цька о́бласть
Category.create(name: "Dnipropetrovsk Oblast", target_group: 1) # Dnipropetrovsk Oblast - Дніпропетро́вська о́бласть
Category.create(name: "Donetsk Oblast", target_group: 1) # Donetsk Oblast - Доне́цька о́бласть
Category.create(name: "Ivano-Frankivsk Oblast", target_group: 1) # Ivano-Frankivsk Oblast - Іва́но-Франкі́вська о́бласть
Category.create(name: "Kharkiv Oblast", target_group: 1) # Kharkiv Oblast - Харківська́ о́бласть
Category.create(name: "Kherson Oblast", target_group: 1) # Kherson Oblast - Херсо́нська о́бласть
Category.create(name: "Khmelnytskyi Oblast", target_group: 1) # Khmelnytskyi Oblast - Хмельни́цька о́бласть
Category.create(name: "Kyiv Oblast", target_group: 1) # Kyiv Oblast - Ки́ївська о́бласть
Category.create(name: "Kirovohrad Oblast", target_group: 1) # Kirovohrad Oblast - Кіровогра́дська о́бласть
Category.create(name: "Luhansk Oblast", target_group: 1) # Luhansk Oblast - Луга́нська о́бласть
Category.create(name: "Lviv Oblast", target_group: 1) # Lviv Oblast - Льві́вська о́бласть
Category.create(name: "Mykolaiv Oblast", target_group: 1) # Mykolaiv Oblast - Микола́ївська о́бласть
Category.create(name: "Odessa Oblast", target_group: 1) # Odessa Oblast - Оде́ська о́бласть
Category.create(name: "Poltava Oblast", target_group: 1) # Poltava Oblast - Полта́вська о́бласть
Category.create(name: "Rivne Oblast", target_group: 1) # Rivne Oblast - Рі́вненська о́бласть
Category.create(name: "Sumy Oblast", target_group: 1) # Sumy Oblast - Сумська́ о́бласть
Category.create(name: "Ternopil Oblast", target_group: 1) # Ternopil Oblast - Тернопі́льська о́бласть
Category.create(name: "Vinnytsia Oblast", target_group: 1) # Vinnytsia Oblast - Ві́нницька о́бласть
Category.create(name: "Volyn Oblast", target_group: 1) # Volyn Oblast - Воли́нська о́бласть
Category.create(name: "Zakarpattia Oblast", target_group: 1) # Zakarpattia Oblast - Закарпатська область
Category.create(name: "Zaporizhzhia Oblast", target_group: 1) # Zaporizhzhia Oblast - Запорізька область
Category.create(name: "Zhytomyr Oblast", target_group: 1) # Zhytomyr Oblast - Жито́мирська о́бласть

# Aid categories
Category.create(name: "Accommodation Offers", target_group: 0)
Category.create(name: "Governmental Support", target_group: 0)
Category.create(name: "Relief supplies", target_group: 0)
Category.create(name: "Psychological help", target_group: 0)
Category.create(name: "Bureaucratic assistance", target_group: 0)
Category.create(name: "Support for chilldren", target_group: 0)

# "How to help" categories
Category.create(name: "Donations", target_group: 2)
Category.create(name: "Shelter", target_group: 0)
Category.create(name: "Charities", target_group: 0)

# Miscellaneous
Category.create(name: "Light in the dark", target_group: 0)
Category.create(name: "Jobs for Ukrainian in Europe", target_group: 0)
Category.create(name: "Voluntary sanctions", target_group: 0)
Category.create(name: "Recent news", target_group: 0)
Category.create(name: "Russian government", target_group: 0)
Category.create(name: "Ukrainian government", target_group: 0)


puts "#{Category.all.length} categories created"

puts "Seeding done!"
