# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

Agent.create(email: "marvin@marvin.com", password: "test")
Agent.create(email: "barvin@barvin.com", password: "test")
Client.create(first_name: "Michael", last_name: "Jordan", phone_number: "908-555-1212")
Client.create(first_name: "Bob", last_name: "Rabbit", phone_number: "908-555-1313")
Property.create(address: "23 Sand Drive", price: "725,000", bedrooms: 4, bathrooms: 2, agent_id: 1, client_id: 1)
Property.create(address: "125 Shell Lane", price: "700,000", bedrooms: 3, bathrooms: 1, agent_id: 2, client_id: 2)
Property.create(address: "67 Wave Ct", price: "625,000", bedrooms: 3, bathrooms: 2, agent_id: 1, client_id: 1)
Property.create(address: "125 Shell Lane", price: "700,000", bedrooms: 3, bathrooms: 1, agent_id: 2, client_id: 2)
