class HomeController < ApplicationController
  def index
     params[:type] ||= "institution"
     response = RestClient.get "http://minte.staging.wpengine.com/api/get_posts/?post_type=#{params[:type]}&count=100" if params[:search].blank?
     response = RestClient.get "http://minte.staging.wpengine.com/api/get_search_results/?post_type=#{params[:type]}&search=#{params[:search]}" unless params[:search].blank?
     @institutions = JSON.parse(response)["posts"]
     @type = params[:type]
  end
end
