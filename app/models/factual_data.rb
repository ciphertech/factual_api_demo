class FactualData < ActiveRecord::Base
  acts_as_commentable
  
  def self.dump_data(search_result)
    search_result = search_result.first
    factual_data =FactualData.where(
      :name=>search_result["name"],
      :address=>search_result["address"],
      :locality=>search_result["locality"],
      :country=>search_result["country"],
      :website=>search_result["website"],
      :postal_code=>search_result["postcode"]
    ).first_or_initialize
    factual_data.save
    search_result["category_labels"].flatten.each do |category|
      category= Category.where(
        :category_labels=>category,
        :factual_data_id=>factual_data.id
      ).first_or_initialize
      category.save
    end
    factual_data.id
  end
  
end
