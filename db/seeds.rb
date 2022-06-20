# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

r1 = Role.create({ name: 'User', description: 'Can read items' })
r2 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ name: 'minh', email: 'minh@gmail.com', password: 'minhminh', password_confirmation: 'minhminh', role_id: r1.id })
u4 = User.create({ name: 'admin', email: 'admin@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin', role_id: r2.id })

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"