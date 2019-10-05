class HealthController < ApplicationController
    
    #Method to check run ok
    def health
        render json: {api: 'OK'}, status: :ok
    end

end