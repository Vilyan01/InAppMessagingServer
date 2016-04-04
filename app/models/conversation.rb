class Conversation < ActiveRecord::Base
	has_many :messages
	attr_accessor :last_message

	def self.findByUserId(user_id)
		tbl = Conversation.arel_table
		Conversation.where(tbl[:lender_id].eq(user_id).or(tbl[:borrower_id].eq(user_id)))
	end
end
