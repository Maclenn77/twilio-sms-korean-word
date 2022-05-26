class Word < ApplicationRecord
    validates :korean_word, presence: true, format: {
        with: /[\p{Hangul}]/, message: 'only allows hangul'
    }
    validates :romanja, presence: true
    validates :translation, presence: true

    def message
      "#{self.korean_word} (pronounced #{self.romanja}) means '#{self.translation}'. Visit our webpage morning-crag-46272.herokuapp.com/"
    end
end
