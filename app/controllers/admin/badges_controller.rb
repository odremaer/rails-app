class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!

  before_action :find_badge, only: %i[show edit destroy update ]

  def index
    @badges = Badge.all
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: "Badge created succesfully"
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_title, :rule)
  end
end
