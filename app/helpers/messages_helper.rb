module MessagesHelper
    def random_number
        Number.order('RANDOM()').first
    end

    def random_word
        Word.order('RANDOM()').first
      end

    def help
        "Send a message to #{@phone}. Learn a new word sending 'learn word' or learn a new number sending 'learn number'
        Learn how to use this service writing 'help'. Visit our webpage morning-crag-46272.herokuapp.com/"
    end
end
