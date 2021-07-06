class WelcomeController < ApplicationController
    def root 
        @pets = Pet.all 
    end
end