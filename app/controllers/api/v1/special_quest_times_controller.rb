class Api::V1::SpecialQuestTimesController < ApiController
  def show
    render json: SpecialQuestTime.latest, meta: { status: '200' }, root: 'result'
  end
end
