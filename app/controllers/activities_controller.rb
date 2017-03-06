class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activities.new.call(current_user)
  end
end