module Api
	module V1
		class ConversationController < ApplicationController
			def index
				render :json => {:test => params[:id]}
			end
		end
	end
end