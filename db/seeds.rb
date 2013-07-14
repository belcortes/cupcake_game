# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cupcake.delete_all
Cookie.delete_all
Topping.delete_all
Frosting.delete_all
IceCream.delete_all

cc1 = Cupcake.create(name: 'Mint Chocolate Chip', current_score: 0)
cc2 = Cupcake.create(name: 'Salted Caramel', current_score: 1)
cc3 = Cupcake.create(name: 'Bellini', current_score: 2)
cc4 = Cupcake.create(name: 'Arnold Palmer', current_score: 0)

ck1 = Cookie.create(name: 'green tea shortbread', color: 'green')
ck2 = Cookie.create(name: 'graham cracker', color: 'brown')
ck3 = Cookie.create(name: 'chocolate chip cookie', color: 'brown')
ck4 = Cookie.create(name: 'sugar cookie', color: 'beige')

t1 = Topping.create(name: 'strawberry drizzle', color: 'red')
t2 = Topping.create(name: 'chocolate syrup', color: 'brown')
t3 = Topping.create(name: 'peanut butter cups', color: 'brown')
t4 = Topping.create(name: 'chocolate shavings', color: 'brown')

f1 = Frosting.create(name: 'fluff', color: 'white')
f2 = Frosting.create(name: 'mixed berry whipped cream', color: 'purple')
f3 = Frosting.create(name: 'tea whipped cream', color: 'brown')
f4 = Frosting.create(name: 'chocolate whipped cream', color: 'brown')

ic1 = IceCream.create(name: 'raspberry sorbet', color: 'pink')
ic2 = IceCream.create(name: 'coffee', color: 'brown')
ic3 = IceCream.create(name: 'toasted marshmallow', color: 'white')
ic4 = IceCream.create(name: 'chocolate', color: 'brown')

