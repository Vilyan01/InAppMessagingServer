module Api
	module V1
		class ConversationController < ApplicationController
			skip_before_filter :verify_authenticity_token
			def show
				render :json => {:conversations => Conversation.findByUserId(params[:id])}
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
		end
	end
end