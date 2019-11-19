class TestmapController < ApplicationController
  def index
    @testmaps = Testmap.geocoded #returns activities with coordinates

    @markers = @testmaps.map do |testmap|
      {
        lat: testmap.latitude,
        lng: testmap.longitude
      }
    end
  end
end
