class ItemsController < ApplicationController
    before_action :set_list
  
    def create
      @item = @list.items.build(item_params)
      if @item.save
        redirect_to @list, notice: 'Item added'
      else
        redirect_to @list, alert: 'Item not added'
      end
    end
  
    def update
      @item = @list.items.find(params[:id])
      @item.update(completed: !@item.completed)
      redirect_to @list
    end
  
    def destroy
      @item = @list.items.find(params[:id])
      @item.destroy
      redirect_to @list, notice: 'Item removed'
    end
  
    private
  
    def set_list
      @list = List.find(params[:list_id])
    end
  
    def item_params
      params.require(:item).permit(:content, :completed)
    end
  end
  