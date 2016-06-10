class LandingController < ApplicationController
  def index
    @projects = []
    @past_events = []
    @upcoming_events = []
  end
end
