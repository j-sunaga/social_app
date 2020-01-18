class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:edit, :update, :destroy]
  before_action :user_check, only: [:edit,:update,:destroy]

  def index
    @timelines = Timeline.all.order(created_at: "DESC")
  end

  def show
  end

  def new
    if params[:back]
      @timeline = current_user.timelines.build(timeline_params)
    else
      @timeline = Timeline.new
    end
  end

  def edit
  end

  def create
    @timeline = current_user.timelines.build(timeline_params)
    if @timeline.save
      redirect_to timelines_path, notice: "タイムラインを投稿しました！"
    else
      render action: :new
    end
  end

  def update
    if @timeline.update(timeline_params)
      redirect_to timelines_path, notice: "タイムラインを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @timeline.destroy
    redirect_to timelines_path, notice:"タイムラインを削除しました！"
  end

  def confirm
    @timeline = current_user.timelines.build(timeline_params)
    render :new if @timeline.invalid?
  end

  private

  def set_timeline
    @timeline = Timeline.find(params[:id])
  end

  def timeline_params
    params.require(:timeline).permit(:title, :content, :image,:image_cache)
  end

    #timelineを投稿したユーザとログインユーザが同一でない場合はトップページに戻るTrueを返す
  def user_check
    unless @timeline.user.id == current_user.id
      flash[:notice] = '編集・削除できません'
      redirect_to timelines_path
    end
  end

end
