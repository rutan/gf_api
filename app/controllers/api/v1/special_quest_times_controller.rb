class Api::V1::SpecialQuestTimesController < ApiController
  def show
    @special_quest_time =
      SpecialQuestTime.find_by(date: Time.zone.now.strftime('%Y%m%d')) ||
      SpecialQuestTime.create_now
    render json: @special_quest_time, meta: { status: '200' }, root: 'result'
  end
end
