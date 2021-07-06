require 'factory_bot_rails'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
User.destroy_all
joey = User.create!(user_name: "Joeyh92989")
val = User.create!(user_name: "Val1234")
charlie = User.create!(user_name: "Charlie1234")
kalyn = User.create!(user_name: "Kalyn1234")
spencer = User.create!(user_name: "Post1234")
francy = User.create!(user_name: "Francy1234")

Message.create!( user_id: joey.id, sender_id: val.id, message: "test")
Message.create!(user_id: charlie.id, sender_id: val.id, message: "test")
Message.create!(user_id: spencer.id, sender_id: val.id, message: "test")
Message.create!(user_id: spencer.id, sender_id: kalyn.id, message: "test")
Message.create!(user_id: francy.id, sender_id: joey.id, message: "test")