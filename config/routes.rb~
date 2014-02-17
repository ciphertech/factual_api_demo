FactualApi::Application.routes.draw do

  match "/show_details/:id"=>"searches#show_details" , :via=>[:get]
  match "/create_comment"=>"searches#create_comment" , :via=>[:post]
  match "/show/:search_category/:search_business/:city/:locality" => "searches#show" , :via=>[:get,:post]
  match "search_by_choice" => "searches#search_by_choice" , :via=>[:post]
  match "/search_text" => "searches#search_text" , :via=>[:get]
  root "searches#search_text"
end

