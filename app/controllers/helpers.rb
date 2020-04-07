require_all 'app'

class Helpers

    def self.current_user(session)
      User.find(session[:user_id])
    end
  
    def self.logged_in?(session)
      !!session[:user_id]
    end

    def self.destination_exist?(city_name)
      @name=city_name.downcase
      !!Destination.find_by(city_name: @name)
    end

    def self.find_or_create_destination(city_name)
      @name=city_name.downcase
      if self.destination_exist?(city_name)
        Destination.find_by(city_name: @name)
      else
        Destination.create(city_name: @name)
      end
    end

    def self.find_destination(id)
      Destination.find_by(id: id).city_name
    end

  end