class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update  ]

  # GET /likes or /likes.json
  # def index
  #   @likes = Like.all
  # end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  # def new
  #   @like = Like.new
  # end

  # GET /likes/1/edit
  # def edit
  # end

  # POST /likes or /likes.json
  def create
    logger.info { "tttttttttttttttttttttttttttttttttt#{params['tweet_id']}" }
    if Like.where(user_id: params['user_id'].to_i, tweet_id: params['tweet_id'].to_i).count > 0
      redirect_to '/like/' + Like.all.where(user_id: params['user_id'].to_i).first[:id].to_s
      return
    end

    @like = Like.new(:user_id => params['user_id'].to_i, :tweet_id => params['tweet_id'].to_i)
    @like[:user_id] = params['user_id'].to_i
    @like[:tweet_id] = params['tweet_id'].to_i

    respond_to do |format|
      if @like.save
        format.html { redirect_to request.referer, notice: "" }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to like_url(@like), notice: "Like was successfully updated." }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :update, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    Like.find(params['id']).destroy

    respond_to do |format|
      format.html { redirect_to request.referer, notice: "" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:tweet_id, :user_id)
    end
end
