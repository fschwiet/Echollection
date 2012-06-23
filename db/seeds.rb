# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Note.delete_all

Note.create(title: 'First note',
	content: 'This is the first note to be created.');
Note.create(title: 'Second note',
	content: 'This is the second note to be created.');