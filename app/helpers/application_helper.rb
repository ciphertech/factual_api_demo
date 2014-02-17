module ApplicationHelper

  def request_by_search_by_choice(request)
    request == "search_by_choice"
  end

  def categories(factual_data)
    Category.where(:factual_data_id=>factual_data.id)
  end
end
