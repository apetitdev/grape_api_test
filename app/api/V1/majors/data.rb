module Majors
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

    resource :major_data do

      #because we want json answer
      format :json

      desc "list"
      get do
        Major.all
      end

      desc "Return a specific major."
      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          #authorized!
          Major.find(params[:id])
        end
      end
 
      desc "create a new major"
      params do
        requires :name, type: String
      end
      post do
        authorized!
        Major.create!({
          name: params[:name],
        })
      end

      desc "delete an major"
      params do
        requires :id, type: String 
      end
      delete ':id' do
        authorized!
        Major.find(params[:id]).destroy!
      end

      desc "update an major address"
      params do 
        requires :id, type: String
        requires :address, type:String
      end
      put ':id' do
        authorized!
        Major.find(params[:id]).update({
          address:params[:address]
        })
      end
    end

  end

end