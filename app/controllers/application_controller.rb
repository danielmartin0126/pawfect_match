class ApplicationController < ActionController::Base

    def m_f
        if :gender == true
            "Female"
        else
            "Male"
        end
    end
end
