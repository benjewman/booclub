# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

10.times do
    Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name ) 
end

5.times do
    User.create(username: Faker::Twitter.screen_name, name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
end

20.times do 
    Book.create(author_id: Faker::Number.within(range: 1..10), title: Faker::Book.title, publish_date: Faker::Number.within(range: 1980..2019))
    Summary.create(content: Faker::Books::Lovecraft.paragraphs, title: Faker::Books::CultureSeries.book, user_id: Faker::Number.within(range: 1..5), book_id: Faker::Number.within(range: 1..20))
end

30.times do
    Comment.create(summary_id: Faker::Number.within(range: 1..20), user_id: Faker::Number.within(range: 1..5), content: Faker::Books::Dune.saying)
end






# 10.times do
#     Song.create(name: Faker::Music::GratefulDead.song.downcase, artist_id: rand(1..10), genre_id: rand(1..10))
# end

