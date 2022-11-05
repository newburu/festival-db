module Api
  module V1
    class ContentsController < ApplicationController
      # GET /contents/searchYouTube
      def searchYouTube
        q = {}
        q[:name_cont] = params[:name]
        q[:detail_cont] = params[:detail]
        q[:kind_eq] = :youtube
        @contents = Content.ransack(q).result(distinct: true).order('created_at DESC')
      end
    end
  end
end
