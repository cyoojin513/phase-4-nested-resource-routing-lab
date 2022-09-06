class ItemsController < ApplicationController

  def index
    if params[:user_id]
      items = find_user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    render json: find_item, include: :user
  end

  def create
    item = find_user.items.create(item_params)
    render json: item, status: :created
  end

  private

  def find_item
    Item.find(params[:id])
  end

  def find_user
    User.find(params[:user_id])
  end

  def item_params
    params.permit(:name, :description, :price)
  end

end
