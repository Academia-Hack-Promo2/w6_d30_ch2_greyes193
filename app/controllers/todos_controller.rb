class TodosController < ApplicationController
	def index
		render json: Todo.all
	end
	def show
		list = Todo.find(params[:id])
		render json: list
	end
	def create
		list = Todo.new(permit)
		if list.save
			render json: list
		else
			render json: {message: "ValidationsErrors", "errors": list.errors.messages}	
		end
	end
	def update
		list = Todo.update(params[:id], permit)
		render json: list
	end
	def destroy
		list = Todo.find(params[:id])
		list.destroy
		render json: list
	end
	private
		def permit
			params.require(:todo).permit(:text,:done)
		end
end
