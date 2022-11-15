Rails.application.routes.draw do
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  #get "/", to: "pages#home"

  get "/make_a_wish", to: "whish_list#card"
  get "/new_wish", to: "whish_list#new_wish"
  post "/wish_card_list", to: "whish_list#creat_wish"
  get "/wish_card_info/:id", to: "whish_list#show_wish", as: "wish_card_info"


  root "whish_list#card"  #home建議這樣寫


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
