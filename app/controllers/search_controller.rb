class SearchController < ApplicationController
  def index
    @query = params[:q]
    @results = if @query.present?
      Search::Result.random
    else
      []
    end
  end
end
