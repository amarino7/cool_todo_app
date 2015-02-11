class TasksController < ApplicationController
	before_action :get_user

	def index
		@tasks = @user.tasks.all
		# render :index

		respond_to do |format|
			format.html
			format.json { render json: @tasks }
		end
	end

	def new
		@task = Task.new
		render :new
	end

	def create
		new_task = params.require(:task).permit(:content, :complete)
		@task = @user.tasks.create(new_task)
		respond_to do |format|
			format.html { redirect_to "/users/#{@user.id}/tasks/#{task.id}" }
			format.json { render json: @task }
		end
	end

	def show
		task_id = params[:task_id]
		@meow_mix = @user.tasks.find(task_id)
		respond_to do |format|
			format.html
			format.json { render json: @tasks }
		end
	end

	def edit
		task_id = params[:task_id]
		@task = @user.tasks.find(task_id)
		render :edit
	end

	def update
		task_id = params[:task_id]
		task = @user.tasks.find(task_id)
		updated_attrs = params.require(:task).permit(:content, :complete)
		task.update_attributes(updated_attrs)
		# redirect_to task_path

		respond_to do |format|
			format.html
			format.json { render json: @tasks }
		end
	end

	def destroy
		id = params[:task_id]
		task = @user.tasks.find(id)
		task.destroy

		respond_to do |format|
			format.html
			format.json { render json: @tasks }
		end
	end

private
	def get_user
		user_id = params[:user_id]
		@user = User.find(user_id)
	end

end

