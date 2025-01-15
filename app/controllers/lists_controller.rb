class ListsController < ApplicationController
    def index
      @lists = List.all
      @lists = List.includes(:items)
    end
  
    def show
      @list = List.find(params[:id])
      @item = @list.items.build
    end
  
    def new
      @list = List.new
      @lists = List.all
    end
    
  
    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to @list, notice: 'List created'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      @list = List.find(params[:id])
      @list.destroy
      redirect_to lists_path, notice: 'Lista removida com sucesso.'
    end    
  
    private
  
    def list_params
      params.require(:list).permit(:name)
    end
  end
  