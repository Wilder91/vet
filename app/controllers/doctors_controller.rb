class DoctorsController < ApplicationController
    def new 
        @doctor = Doctor.new
    end

    def create 
        @doctor = Doctor.new
        @doctor.name = params[:name]
        @doctor.password = params[:password]
        @doctor.email = params[:email]
        @doctor.save 
        log_in(@doctor)
        redirect_to doctor_path(@doctor)
    end

    def show 
         
        @doctor = current_doctor
    end

    def doc_log_in 


    end

    def doc_log_out 
        session.delete(:doctor_id)
        current_doctor = nil
         
        redirect_to root_path

    end

    def access 
        @doctor = Doctor.find_by(email: params[:email])
        log_in(@doctor)
        redirect_to doctor_path(@doctor)
    end

end