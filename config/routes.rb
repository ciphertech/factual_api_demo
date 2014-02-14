FactualApi::Application.routes.draw do
  match "search_by_choice" => "searches#search_by_choice" , :via=>[:post]
  match "/search_text" => "searches#search_text" , :via=>[:get]
  root "searches#search_text"
end
