class StepsController < ApplicationController
  def new
      @steps = Step.geocoded # returns activities with coordinates
      @markers = @steps.map do |step|
        {
          lat: step.latitude,
          lng: step.longitude
        }
      end

    end

    def create
    end

    def edit
    end

    def save
    end

    def update
    end

    def destroy
    end
  end
