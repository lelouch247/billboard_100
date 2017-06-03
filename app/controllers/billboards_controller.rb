class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]


  def index
    @billboards = Billboard.all
  end

  def new
    @billboard = Billboard.new
    render partial: 'form', locals: { title: 'New' }
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboard_path(@billboard)
    else
      render :new
    end
  end

  def edit
    render partial: 'form', locals: { title: 'Edit' }
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      render :edit
    end
  end


  def show
  end

  private

  def billboard_params
    params.require(:billboard).permit(:title)
  end

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end
end
