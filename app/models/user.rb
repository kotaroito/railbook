class User < ActiveRecord::Base
    validates :agreement,
        acceptance: { on: :create }
    validates :email,
        confirmation: true,
        presence: { unless: 'dm.blank?' }
    has_one :author
end
