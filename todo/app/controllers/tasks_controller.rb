class TasksController < ApplicationController

	def index
		@tasks = Task.all
		render :index
	end

	def new
		@task = Task.new
		render :new
	end

	def create
		new_task = params.require(:task).permit(:content, :complete)
		task = Task.create(new_task)
		redirect_to "/tasks/#{task.id}"
	end

	def show
		task_id = params[:id]
		@meow_mix = Task.find(task_id)
		render :show
	end

	def edit
		task_id = params[:id]
		@task = Task.find(task_id)
		render :edit
	end

	def update
		task_id = params[:id]
		task = Task.find(task_id)
		updated_attrs = params.require(:task).permit(:content, :complete)
		task.update_attributes(updated_attrs)
		redirect_to task_path
	end

	def destroy
		id = params[:id]
		task = Task.find(id)
		task.destroy
		redirect_to "/tasks"
	end


end

