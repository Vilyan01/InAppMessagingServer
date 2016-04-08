class Conversation < ActiveRecord::Base
	has_many :messages
	attr_accessor :last_message

	def self.findByUserId(user_id)
		tbl = Conversation.arel_table
		Conversation.where(tbl[:lender_id].eq(user_id).or(tbl[:borrower_id].eq(user_id)))
	end

	def self.findWithIds(lender_id,borrower_id)
		tbl = Conversation.arel_table
		con = Conversation.where(tbl[:lender_id].eq(lender_id).and(tbl[:borrower_id].eq(borrower_id))).first
		if !con
			return Conversation.where(tbl[:borrower_id].eq(lender_id).and(tbl[:lender_id].eq(borrower_id))).first
		else
			return con
		end
	end
end
