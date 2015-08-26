require "rack"
require 'rack/contrib'

module Schools
  class Data < Grape::API

    # Because we don't want everyone to be able to access tpo the DB 

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authorized!
        error!('Unauthorized', 401) unless headers['Secret-Password'] == 'loutre'
      end
    end

 
    resource :school_data do

      #because we want json answer
      format :json
      use Rack::JSONP

      desc "list"
      params do
        optional :chinese_name, type: String
      end
      get do
        if params
          School.where(params)
        else
          School.all
        end
      end

      desc "Return a specific School."
      params do
        requires :id, type: Integer
        optional :chinese_name, type: String
      end
      route_param :id do
        get do
          authorized!
          School.find(params[:id])
        end
      end
 
      desc "create a new major"
      params do
        requires :english_name, type: String
      end
      post do
        authorized!
        School.create!({
          english_name: params[:english_name],
        })
      end

      desc "delete an major"
      params do
        requires :id, type: String 
      end
      delete ':id' do
        authorized!
        School.find(params[:id]).destroy!
      end

      desc "update an major address"
      params do 
        requires :id, type: String
        requires :address, type:String
      end
      put ':id' do
        authorized!
        School.find(params[:id]).update({
          address:params[:address]
        })
      end
    end
 
  end
end