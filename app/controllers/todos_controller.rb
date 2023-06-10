class TodosController < ApplicationController
  # 這個 index() method，就是 GET 127.0.0.1:3000/todos/ 所對應到的動作
  # 我們可以在這裡，把資料庫的資料撈出來，並 response 回給使用者
  def index
    # response with json format
    respond_to do |format|
      format.json { render :json => { status: 'OK', todo_list: Todo.all }, status => 200 }
    end
  end

  # 這個 create() method，就是 POST 127.0.0.1:3000/todos/ 所對應到的動作
  def create
    todo_data = params[:todo]
    @todo = Todo.new(content: todo_data[:content], category: todo_data[:category])
  
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end
end
