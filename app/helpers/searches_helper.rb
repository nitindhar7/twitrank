module SearchesHelper
  def autocomplete_search_queries( ac_results = @ac_results )
    result = ac_results.map do |ac_result|
      "#{ac_result}"
    end
    result.join("\n")
  end  
end
