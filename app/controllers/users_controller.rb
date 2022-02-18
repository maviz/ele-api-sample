class UsersController < ApplicationController
	deserializable_resource :user, only: [:create, :update]

  	def create
  		return add_talent if params.has_key?(:course_id)
    	user = User.find_or_create_by(name: create_params[:name])
    	render jsonapi: user,include: [:authored_courses],status: :created
  	end

  	def show
  		user = User.find(params[:id])
  		render jsonapi: user,include: [:authored_courses],status: :found
  	end

  	def add_talent
  		user = User.find_or_create_by(name: create_params[:name])
  		course = Course.find(params[:course_id])
  		render status: :not_found if course.nil?
  		course.talents << user
  		render jsonapi: course,include: [:author, :talents],status: :created
  	end

  	def destroy
  		User.find(params[:id]).destroy
  		render jsonapi: :success,status: :delete
  	rescue
  		render status: :not_found
  	end

  	def update
  		user = User.find_by_id(params[:id])
  		
  		if user.update(create_params)
    		render jsonapi: user,include: [:authored_courses],status: :ok
    	else
    		render status: :not_found
    	end
  	end


  	private

  	def create_params
    	params.require(:user).permit(:name)
  	end
end
