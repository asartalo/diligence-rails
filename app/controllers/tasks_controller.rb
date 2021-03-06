class TasksController < BaseApiController

  before_filter :find_task, only: [:show, :update, :destroy, :append]
  before_filter :set_task_params, only: [:create, :update]
  # skip_before_action :verify_authenticity_token

  def index
    render json: user.tasks
  end

  def show
    render json: task
  end

  def create
    task = task_update(task_params)
    if task.save
      render json: task
    else
      bad_request
    end
  end

  def update
    create
  end

  def destroy
    if task.destroy
      no_content
    else
      bad_request
    end
  end

  def append
    new_task = user.tasks.create(name: "New Task")
    task.append_sibling(new_task)
    render json: user.tasks
  end

  private

  def task_update(the_params)
    task.assign_attributes(the_params)
    if done_param.present? and done_param[:done] == true
      task.mark_as_done
    else
      task.mark_as_not_done
    end
    task
  end

  def find_task
    @task = user.tasks.find_by(id: params[:id])
    not_found unless @task.present?
  end

  def task
    @task ||= user.tasks.new
  end

  def set_task_params
    handle_params do
      @task_params = json_params.permit(:name, :done, :archived)
      @done_param = @task_params.extract!(:done)
    end
  end

  def task_params
    @task_params
  end

  def done_param
    @done_param
  end

end

