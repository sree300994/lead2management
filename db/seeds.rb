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

Stage.create(name: "New Opportunity", description: "This stage is assigned as default when a prospect is created.", interest_level: 1)
Stage.create(name: "Negotiating", description: "This stage is assigned after the prospect responds to a proposal, but requests some changes before committing to a purchase.", interest_level: 2)
Stage.new(name: "Won", description: "This stage is assigned after the prospect makes a purchase. This is when a customer record is created and a prospect record is archived.", interest_level: 3)
Stage.new(name: "Lost", description: "This stage is assigned if a Prospect purchases from a competitor or decides they are no longer interested in your product.", interest_level: 4)

