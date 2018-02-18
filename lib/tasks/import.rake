desc "Imports movies from TMDB"
task import: :environment do
  ActiveRecord::Base.transaction do
    Cinema::PosterConfig.delete_all
    Cinema::PosterConfig.import_tmdb
    Cinema::Movie.delete_all
    Cinema::Movie.import_tmdb
  end
end
