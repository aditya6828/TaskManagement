class Manager < ApplicationRecord
    has_secure_password
    has_many :tasks
end
