module ApplicationHelper
  def filter_value(params)
    if params.nil?
      "Filter by"
    elsif params["filter_param"] == ""
      "name"
    else
      params["filter_param"]
    end
  end
end
