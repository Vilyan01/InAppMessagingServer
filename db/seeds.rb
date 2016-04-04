# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# myself and mudbutt
conversation1 = Conversation.create(lender_id: "10101812792890508", borrower_id: "10208822788186393")
# mooch and myself
conversation2 = Conversation.create(lender_id: "124389421243195", borrower_id: "10101812792890508")
# first conversation
msg1 = conversation1.messages.create(sender_id: "10208822788186393", display_name: "Josh", body: "Mmmmmm!!!")
msg2 = conversation1.messages.create(sender_id: "10101812792890508", display_name: "Brian", body: "Yo, whattup dawg?")
# second conversation
msg3 = conversation2.messages.create(sender_id: "10101812792890508", display_name: "Brian", body: "Gimme dat dress!")
