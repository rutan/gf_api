class StaticPagesController < ApplicationController
  def index
    @special_quest_time = SpecialQuestTime.latest
  end
end
