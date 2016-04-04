module Api
	module V1
		class ConversationController < ApplicationController
			skip_before_filter :verify_authenticity_token
			def show
				render :json =>  get_conversation(params[:id]), :include => :last_message, :status => 200
			end

			def create
				con = Conversation.new
				con.borrower_id = params[:borrower_id]
				con.lender_id = params[:lender_id]
				if con.save
					render :json => con, :status => 201
				else
					render :json => {:error => "Unable to create"}, :status => 400
				end
			end

			def messages
				con = Conversation.find(params[:conversation_id])
				render :json => con.messages, :status => 200
			end

			private
			# Get conversations and last message
			def get_conversation(id)
				convs = Conversation.findByUserId(params[:id])
				r = Array.new
				convs.each do |conv|
					conv.last_message = conv.messages.last!
					r << conv
				end
				return r
			end
		end
	end
end