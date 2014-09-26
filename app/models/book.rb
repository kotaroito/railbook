class Book < ActiveRecord::Base
    scope :publisher, ->(pub) {
        where(publish: pub).order(published: :desc).limit(10)
    }
end
