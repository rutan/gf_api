class StaticPagesController < ApplicationController
  def index
    api_routes = Rails.application.routes.routes.
      collect { |r| r.path.spec.to_s }.
      select { |n| n.match(/\A\/api\//) }.
      map { |n| n.gsub(/\(\.:format\)\z/, '.json') }.
      map { |n| "#{root_url.remove(/\/\z/)}#{n}" }.
      uniq.
      sort

    render json: {
      meta: { status: '200' },
      result: {
        urls: api_routes,
      }
    }
  end
end
