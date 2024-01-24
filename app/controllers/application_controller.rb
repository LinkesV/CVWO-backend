class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    def encode_token(payload)
        JWT.encode(payload,'cvwoassignment2024') 
    end
    
    def decoded_token
        token = cookies.signed[:jwt]
        if token
            begin
                JWT.decode(token,'cvwoassignment2024',true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def successful
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end


    def authenticate_user
        if successful
            render json: {user: successful, status:true}
        else
            render json: {status:false}
        end
    end

end
