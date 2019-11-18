class TestmapController < ApplicationController
class FlatsController < ApplicationController
  def index
    @testmaps = Testmap.geocoded #returns flats with coordinates

    @markers = @testmaps.map do |testmap|
      {
        lat: testmap.latitude,
        lng: testmap.longitude
      }
    end
  end
end
end