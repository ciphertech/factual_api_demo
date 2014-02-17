class SearchesController < ApplicationController

  KEY ="Ghxweml2HGOWSuuuCRl6FYkwvm4J3QTcZBx7Ydvb"
  SECRET= "PUPJLBmCXLPWLl2Gzwpipsd0vr2qdaoNkajMjOUs"


  #--
  # To create comment
  #++
  def create_comment
    factual_data=FactualData.find(params[:id])
    comment =  factual_data.comments.create
    comment.title = factual_data.name
    comment.comment = params[:comment]
    success = comment.save
    flash[:notice]= comment.errors.full_messages.first unless success
    redirect_to :action=>"show_details" , :id=>factual_data.id  
  end

  #--
  # To show business and comments
  #++
  def show_details
    @search_result=FactualData.find(params[:id])
    @comments = @search_result.comments.recent
  end


  #--
  # To show search result
  #++
  def show
    factual = call_factual()
    if params[:search_category].present? &&  params[:search_business].present?
      @search_result= factual.table("places").filters("$and"=>[{"category_labels"=>{"$includes_any"=>[params[:search_category]]}},{"name"=>params[:search_business]},{"locality"=>params[:locality]},{"postcode"=>params[:city]}]).rows
      @id = FactualData.dump_data(@search_result)
      flash[:notice]= ""
    else
      flash[:notice]= "No Result Found"
    end
  end

  #--
  # To display search result
  #++
  def search_by_choice  
    if params[:city].present?
      factual = call_factual()
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
      flash[:notice]= "Please enter city or zip code"
    end
  end

  #--
  # To call factual
  #++

  def call_factual()
    require 'factual'
    return Factual.new(KEY, SECRET)
  end
  
  def search_text
    
  end
end

