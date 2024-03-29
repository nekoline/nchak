class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @task  = Task.new
    # @tasks = Task.all(:conditions => {:done => false}, :order => 'due_date')
    # @tasks = Task.where(:done => false).order('due_date')
    # @tasks = Task.undone.paginate(:page => params[:page], :per_page => 10)
    @tasks = current_user.tasks.undone.paginate(:page => params[:page], :per_page => 10)
  end

  def done
    @task  = Task.new
    # @tasks = Task.all(:conditions => {:done => true}, :order => 'due_date')
    # @tasks = Task.where(:done => true).order('due_date')
    # @tasks = Task.done.paginate(:page => params[:page], :per_page => 10)
    @tasks = current_user.tasks.done.paginate(:page => params[:page], :per_page => 10)
    render :action => 'index'
  end

  def create
    @task  = Task.new(params[:task])
    @task.user = current_user
    if @task.save
      redirect_to :tasks
    else
      @tasks = current_user.tasks.undone.paginate(:page => params[:page], :per_page => 10)
      render :action => 'index'
    end
  end

  def finish
    @task  = Task.find(params[:id])
    @task.update_attributes(:done => true)
    redirect_to :back
  end

  def unfinish
    @task  = Task.find(params[:id])
    @task.update_attributes(:done => false)
    redirect_to :back
  end
end
