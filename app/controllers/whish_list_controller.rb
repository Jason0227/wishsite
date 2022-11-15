class WhishListController < ApplicationController
    def card
        @wish_lists = WishList.all
    end

    def new_wish
        @wish_list = WishList.new
    end

    def creat_wish
        #寫入資料庫物
        #title = params[:title]
        #content = params[:content]

        #w = WishList.new(title:title, description:content)

        clean_params = params.require(:wish_list).permit(:title, :description)  

        @wish_list = WishList.new(clean_params)  

        if @wish_list.save
            #flash[:notice] = "成功新增許願卡!"
            
            redirect_to make_a_wish_path, notice: "成功新增許願卡!"
        else
            render :new_wish
            #借 new_wish.html.erb 來用
            #redirect_to new_wish_path, notice: "失敗了!"
        end    
    end

    def show_wish
        render html: params
    end


end
