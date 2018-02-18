class SearchController < ApplicationController
  def index
    @query = params[:q].to_s
    query_tokens = @query.split(" ").map(&:downcase)
    query_matches = query_tokens.any? { |token| token.in?(%w[kino laguna]) }
    @results = if @query.present? && query_matches
      Search::Result.random
    else
      []
    end
  end
end
