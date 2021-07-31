class StaticPagesController < ApplicationController
  def index
    @photos_url = params[:query] ? get_photos(params[:query]) : random_photos
  end

  private

  def random_photos
    begin
      Unsplash::Photo.random(count: 10).map { |photo| photo[:urls][:small] }
    rescue Unsplash::Error
      []
    end
  end

  def get_photos(query)
    begin
      result = Unsplash::Photo.search(query)
      result.map { |photo| photo[:urls][:small] }
    rescue Unsplash::Error => e
      puts e
      []
    end
  end
end
