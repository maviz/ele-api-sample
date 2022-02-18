class CoursesController < ApplicationController
	deserializable_resource :course, only: [:create, :update]

  	def create
    	course = Course.create(create_params)
    	render jsonapi: course,include: [:author, :talents],status: :created
  	end

  	def show
  		course = Course.find(params[:id])
  		render jsonapi: course,include: [:author, :talents],status: :found
  	end

  	def update
  		course = Course.find_by_id(params[:id])
  		
  		if course.update(create_params)
    		render jsonapi: course,include: [:author, :talents],status: :ok
    	else
    		render status: :not_found
    	end
  	end

  	private

  	def create_params
    	params.require(:course).permit(:name, :author_id)
  	end
end
