class HomeController < ApplicationController
    def index
        @hello_message = { message: 'Hello, API World!' }

        render json: @hello_message
    end
end
