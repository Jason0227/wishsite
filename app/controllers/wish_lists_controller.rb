class WishListsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_wish_list, only: [:edit, :update, :destroy, :show]

  
    def index
      @wish_lists = current_user.wish_lists
    end
  
    def new
        @wish_list = WishList.new
    end
  
    def create
      #@wish_list = WishList.new(wish_list_params)
      #@wish_list.user_id = current_user.id

      @wish_list = current_user.wish_lists.new(wish_list_params)
      #以使用者的角度新增東西，new跟build效果一樣
  
      if @wish_list.save
        redirect_to root_path, notice: "成功新增許願卡！"
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @wish_list.update(wish_list_params)
        redirect_to root_path, notice: "成功更新許願卡！"
      else
        render :edit
      end
    end
  
    def destroy
      @wish_list.destroy
      redirect_to root_path, notice: "資料已刪除"
    end
  
    private
    def find_wish_list
      @wish_list = current_user.wish_lists.find(params[:id])
    end
  
    def wish_list_params
      params.require(:wish_list).permit(:title, :description)
    end

end