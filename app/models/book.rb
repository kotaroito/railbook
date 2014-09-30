class Book < ActiveRecord::Base
    validates :isbn,
        presence: true,
        uniqueness: true
    validates :title,
        presence: true,
        length: { minimum: 1, maximum: 100 },
        uniqueness: { scope: :publish }
    validates :price,
        numericality: { only_integer: true, less_than: 10000 }
    validates :publish,
        inclusion: { in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム'] }

    has_many :reviews
    has_and_belongs_to_many :authors
    has_many :users, through: :reviews

    scope :publisher, ->(pub) {
        where(publish: pub).order(published: :desc).limit(10)
    }
    after_destroy BookCallbacks.new
end
