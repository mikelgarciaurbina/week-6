# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


t1 = Tournament.create( name: 'BasketBall' )
p1 = Player.create( name: 'Alex' )
p2 = Player.create( name: 'Mikel' )
p3 = Player.create( name: 'Victor' )
t1.players.push(p1)
t1.players.push(p2)
t1.players.push(p3)

t2 = Tournament.create( name: 'Futball' )
p4 = Player.create( name: 'Rixi' )
t2.players.push(p1)
t2.players.push(p3)
t2.players.push(p4)

puts "Tournaments created"