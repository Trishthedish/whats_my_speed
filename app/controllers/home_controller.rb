class HomeController < ApplicationController
  def index
    @search_results = Broadband_Wrapper.search_broadband(@search_term)
  end

end
