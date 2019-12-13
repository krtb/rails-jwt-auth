class ApplicationController < ActionController::API
    before_action :authorized
    # will call the authorized method before anything else happens in our app. 
    # This will effectively lock down the entire application. 


    def encode_token(payload)
        # payload => { beef: 'steak' }
        JWT.encode(payload, 'my_s3cr3t')
        # jwt string: "eyJhbGciOiJIUzI1NiJ9.eyJiZWVmIjoic3RlYWsifQ._IBTHTLGX35ZJWTCcY30tLmwU9arwdpNVxtVU0NpAuI"
    end

    def decoded_token
        if auth_header
        token = auth_header.split(' ')[1]
        # headers: { 'Authorization': 'Bearer <token>' }
        begin
            JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
        rescue JWT::DecodeError
            # return nil instead of crashing server
            nil
        end
    end

    def auth_header
        # { 'Authorization': 'Bearer <token>' }
        request.headers['Authorization']
    end

    def current_user
        # Recall that a Ruby object/instance is 'truthy': !!user_instance #=> true and nil is 'falsey': !!nil #=> false

        if decoded_token
        # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
        # or nil if we can't decode the token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        # returns truthy or falsey, dependent on return value of current_user
        !!current_user
    end


    def authorized
        # lock down our application to prevent unauthorized access:
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end