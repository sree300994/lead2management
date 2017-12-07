# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: "salesManager")
Role.create(name: "salesAssociate")

User.create(full_name: "admin", email: "admin@gmail.com", password: "123456", password_confirmation: "123456", mobile: "9876543210", role_id: Role.find_by(name: "salesManager").id)


