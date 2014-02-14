class SearchesController < ApplicationController

  KEY ="Ghxweml2HGOWSuuuCRl6FYkwvm4J3QTcZBx7Ydvb"
  SECRET= "PUPJLBmCXLPWLl2Gzwpipsd0vr2qdaoNkajMjOUs"
 

  #--
  # To display search result
  #++
  def search_by_choice  
    if params[:city].present?
      require 'factual'
      factual = Factual.new(KEY, SECRET)
      if params[:search_category].present? &&  params[:search_business].present?
        @search_result= factual.table("places").filters("$and"=>[{"category_labels"=>{"$includes_any"=>[params[:search_category]]}},{"name"=>params[:search_business]}],"$or"=>[{"locality"=>params[:city]},{"postcode"=>params[:city]}]).rows
        flash[:notice]= ""
      elsif params[:search_category].present?
        @search_result= factual.table("places").filters("category_labels"=>{"$includes_any"=>[params[:search_category]]},"$or"=>[{"locality"=>params[:city]},{"postcode"=>params[:city]}]).rows
        flash[:notice]= ""
      elsif params[:search_business].present? 
        @search_result= factual.table("places").filters("name"=> params[:search_business],"$or"=>[{"locality"=>params[:city]},{"postcode"=>params[:city]}]).rows
        flash[:notice]= ""
      else
        flash[:notice]= "Please enter Category name or Business name"
      end
    else
      flash[:notice]= "Please enter city"
    end
  end

  def search_text
    
  end
end
