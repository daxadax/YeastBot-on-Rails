YeastBot::Application.routes.draw do

  root 'pages#home'
  
  get "/search", :to => "pages#search"

end
