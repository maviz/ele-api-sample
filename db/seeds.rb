# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(name: 'test1')
User.create(name: 'test2')
User.create(name: 'test3')

Course.create(name: 'course1', author_id: 1)
Course.create(name: 'course2', author_id: 1)
Course.create(name: 'course3', author_id: 2)

c = Course.find(1)
c.talents << User.find_by_id(3)
c.talents << User.find_by_id(2)



