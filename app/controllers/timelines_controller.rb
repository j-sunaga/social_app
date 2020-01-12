class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit,:update,:destroy]
  # GET /timelines
  # GET /timelines.json
  def index
    @timelines = Timeline.all.order(created_at: "DESC")
    @users = User.all
  end

  # GET /timelines/1
  def show
  end

  # GET /timelines/new
  def new
    if params[:back]
      @timeline = current_user.timelines.build(timeline_params)
    else
      @timeline = Timeline.new
    end
  end

  # GET /timelines/1/edit
  def edit
  end

  # POST /timelines
  def create
    @timeline = current_user.timelines.build(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to @timeline, notice: 'タイムラインの投稿が完了しました。' }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :new }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_to @timeline, notice: 'タイムラインのアップデートが完了しました。' }
        format.json { render :show, status: :ok, location: @timeline }
      else
        format.html { render :edit }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  def destroy
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to timelines_url, notice: 'タイムラインが削除されました。' }
      format.json { head :no_content }
    end
  end

  def confirm
    @timeline = current_user.timelines.build(timeline_params)
    render :new if @timeline.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeline_params
      params.require(:timeline).permit(:title, :content, :image, :user_id,:image_cache)
    end

    #timelineを投稿したユーザとログインユーザが同一でない場合はトップページに戻るTrueを返す
    def user_check
      unless @timeline.user.id == current_user.id then
        flash[:notice] = '編集・削除できません'
        redirect_to timelines_path
      end
    end

end
