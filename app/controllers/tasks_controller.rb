class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  # ログインしていない場合、ログイン画面に移動する
  before_action :correct_task,only: [:show, :edit, :update]
  # # URLに直打ちした時にトップページやログイン画面へ移動する。
  
  def index
    @tasks = Task.where(user_id: current_user.id)
    # トップページに表示するタスクを自分のタスクのみに設定
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(title: params[:title], detail: params[:detail])
    @task.user_id = current_user.id
      if @task.save
        flash[:notice] = "タスク作成に成功しました"
        redirect_to "/"
      else
        flash[:error] = @task.errors.full_messages
        render :new, status: :unprocessable_entity
        #HTTPのレスポンスステータスコードを422（Unprocessable Entity）に設定するオプションです。
        #これは、リクエストがバリデーションエラーやクライアント側の問題などの理由で処理できない場合を示します。
      end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end


  def update
    @task = Task.find_by(id: params[:id])
    @task.title = params[:title]
    @task.detail = params[:detail]

    if @task.save
      flash[:notice] = "タスク更新に成功しました"
      redirect_to "/"
    else
      flash[:error] = @task.errors.full_messages
      redirect_to "/tasks/edit/#{@task.id}"
      #画面遷移した時に初期値（前の入力内容）を入れておきたいので、redirect_toで画面遷移している。
    end    
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:notice] = "タスク削除に成功しました"
    redirect_to "/"
  end


  private

  def correct_task
    @task = Task.find_by(id:params[:id])
    if @task.user_id != current_user.id
      redirect_to new_user_session_path
      # @taskとログインユーザーidが異なっていたら、ログイン画面へ移動
    end
  end


end
