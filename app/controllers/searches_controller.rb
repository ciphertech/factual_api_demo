class SearchesController < ApplicationController

  KEY ="Ghxweml2HGOWSuuuCRl6FYkwvm4J3QTcZBx7Ydvb"
  SECRET= "PUPJLBmCXLPWLl2Gzwpipsd0vr2qdaoNkajMjOUs"
 

  #--
  # To display search result
  #++
  def search_by_choice
    if params[:search_category].present? && params[:search_business].present?
      require 'factual'
      factual = Factual.new(KEY, SECRET)
      @search_result= factual.table("places").filters("category_labels"=>{"$includes_any"=>[params[:search_category]]},"name"=> params[:search_business]).rows
      flash[:notice]= ""
    else
      flash[:notice]= "Please enter both Category name and Business name"
    end
  end

  def search_text
    
  end
end
