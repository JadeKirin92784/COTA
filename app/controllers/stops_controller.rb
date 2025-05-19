class StopsController < ApplicationController
    def index
        @stops = Stops.all
    end
end
