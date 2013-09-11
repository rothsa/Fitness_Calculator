class PeopleController < ApplicationController

	def new
	end

	def create
		render text: params[:people].inspect
	end
end
