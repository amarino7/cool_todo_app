class TasksController < ApplicationController

	def index
		@tasks = Task.all
		render :index
	end

end

