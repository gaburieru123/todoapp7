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


end
