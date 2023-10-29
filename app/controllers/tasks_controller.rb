class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(title: params[:title], detail: params[:detail])
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


end
