module Api
	module V1
		class MessageController < ApplicationController
			skip_before_filter :verify_authenticity_token
			def show
				if msg = Message.find(params[:id])
					render :json => msg, status: 200
				else
					render :json => {:error => "Could not find message"}, status: 404
				end
			end

			def create
				msg = Message.new
				msg.sender_id = params[:sender_id]
				msg.display_name = params[:display_name]
				msg.body = params[:body]
				msg.conversation_id = params[:conversation_id]
				if msg.save
					render :json => msg, status: 201
				else
					render :json => {:error => "Could not create message"}, status: 400
				end
			end
		end
	end
end