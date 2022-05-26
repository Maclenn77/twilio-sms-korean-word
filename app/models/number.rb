class Number < Word
    validates :variant, presence: true

    def message
        "'#{self.korean_word}' (pronounced #{self.romanja}) is the #{self.variant} number for #{self.translation}. Visit our webpage morning-crag-46272.herokuapp.com/"
    end
end