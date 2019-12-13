class User < ApplicationRecord
    # https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
    # comes from ActiveModel and adds methods to set and authenticate against a BCrypt password
    has_secure_password

    # add validations for User class
    validates :username, uniqueness: { case_sensitive: false }
end
