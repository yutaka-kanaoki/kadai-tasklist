class TasksController < ApplicationController

before_action :set_task, only: [:show, :edit, :update, :destroy]
before_action :rquire_user_logged_in
before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @tasks = current_user.tasks.order(id: :desc)
    end
  end
  
  def show
  
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "タスクが正常に追加されました"
      redirect_to @task
    else
      flash.now[:danger] = 'タスクを追加できませんでした'
      render :new
    end
    
  end
  
  def edit

  end
   
  def update
    
    if @task.update(task_params)
      flash[:success] = "タスクが正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = 'タスクを更新できませんでした'
      render :edit
    end
    
      
  end
  
  def destroy

    @task.destroy
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_url
      
  end
    
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  #Strong Parameter
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @tasks = current_user.tasks.find_by(id: params[:id])
    
    unless @tasks
      redirect_to root_url
    end
  end
    
end
