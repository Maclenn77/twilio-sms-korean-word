class Word < ApplicationRecord
    validates :korean_word, presence: true, format: {
        with: /[\p{Hangul}]/, message: 'only allows hangul'
    }
    validates :romanja, presence: true
    validates :translation, presence: true
end
