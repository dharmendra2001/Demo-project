Rails.application.routes.draw do
  root 'home#index'
  get "signup", to: "home#signup" 
  post 'create', to: 'home#create'
  get "log", to: "home#log"
  post "login", to: "home#login"
  get "delete", to: "home#delete"
  get "userdetail" , to: "home#userdetail"
  get "detail/:date", to: "home#detail", as: "detail"
  get "candetail", to: "home#candetail"
  post "drivedata", to: "home#drivedata"
  get "applydrive/:id", to: "home#applydrive", as: "applydrive"
  post "fillform", to: "home#fillform"
  get "show", to: "home#show"
  get "admin/:id", to: "home#admin", as: "admin"
  post "admin2/:id", to: "home#admin2", as: "admin2"
end
