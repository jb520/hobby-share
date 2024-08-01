class HobbyFollowsController < ApplicationController
  before_action :set_hobby_follow, only: %i[ show edit update destroy ]

  # GET /hobby_follows or /hobby_follows.json
  def index
    @hobby_follows = HobbyFollow.all
  end

  # GET /hobby_follows/1 or /hobby_follows/1.json
  def show
  end

  # GET /hobby_follows/new
  def new
    @hobby_follow = HobbyFollow.new
  end

  # GET /hobby_follows/1/edit
  def edit
  end

  # POST /hobby_follows or /hobby_follows.json
  def create
    @hobby_follow = HobbyFollow.new(hobby_follow_params)
    @hobby_follow.user_id = current_user.id

    respond_to do |format|
      if @hobby_follow.save
        format.html { redirect_to hobby_follow_url(@hobby_follow), notice: "Hobby follow was successfully created." }
        format.json { render :show, status: :created, location: @hobby_follow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hobby_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hobby_follows/1 or /hobby_follows/1.json
  def update
    respond_to do |format|
      if @hobby_follow.update(hobby_follow_params)
        format.html { redirect_to hobby_follow_url(@hobby_follow), notice: "Hobby follow was successfully updated." }
        format.json { render :show, status: :ok, location: @hobby_follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hobby_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hobby_follows/1 or /hobby_follows/1.json
  def destroy
    @hobby_follow.destroy!

    respond_to do |format|
      format.html { redirect_to hobby_follows_url, notice: "Hobby follow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hobby_follow
      @hobby_follow = HobbyFollow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hobby_follow_params
      params.require(:hobby_follow).permit(:hobby_id, :user_id)
    end
end
