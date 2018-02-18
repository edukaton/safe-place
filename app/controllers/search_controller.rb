class SearchController < ApplicationController
  def index
    @query = params[:q].to_s
    query_tokens = @query.split(" ").map(&:downcase)
    query_matches = ["kino", "laguna"] - query_tokens == []
    @results = if @query.present? && query_matches
      Search::Result.random
    else
      []
    end
  end
end
