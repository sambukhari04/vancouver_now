class DiscountsController < ApplicationController
  before_action :find_discount, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:index, :show, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]


  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new discount_params
    @discount.user = current_user
    # byebug
    if @discount.save
      redirect_to discount_path(@discount)
    else
      render :new
    end
  end

  def show
  #@discount = Discount.find params[:id]
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @discount }
    end
  end

  def edit
    # @discount = Discount.find params[:id]
  end

  def update
    if @discount.update discount_params
      redirect_to @discount
    else
      render :edit
    end
  end

  def destroy
    @discount.destroy
    redirect_to discounts_path
  end

  def index
    @discounts = Discount.order(created_at: :desc)
  end

  private

  def discount_params
    params.require(:discount).permit(:name, :description, :discount, :start_date, :end_date, :location, :image)
  end

  def find_discount
    @discount = Discount.find params[:id]
  end

  def authorize_user!
    unless can?(:manage, @discount)
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end
end
