class MessagesController < ApplicationController 
  skip_before_action :verify_authenticity_token
  #skip_before_action :authenticate_user!, :only => "reply"

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    random_word
    sms = @client.messages.create(
      from: @phone,
      to: from_number,
      body: "Learn a new Korean word! " + reply_message(message_body)
    )
  end

  private

  def boot_twilio
    @phone = Rails.application.credentials.TWILIO_NUMBER || ENV['TWILIO_NUMBER']  
    account_sid = Rails.application.credentials.TWILIO_SID || ENV['TWILIO_SID']
    auth_token = Rails.application.credentials.TWILIO_TOKEN || ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def learn word_or_number
    return random_number if word_or_number == 'number'

    random_word

  end

  def random_number
    Number.order('RANDOM()').first
  end
  
  def help
    "Send a message to #{@phone}. Learn a new word sending 'learn word' or learn a new number sending 'learn number'
    Learn how to use this service writing 'help'. Visit our webpage morning-crag-46272.herokuapp.com/"
  end

  def reply_message message_body
    instructions = message_body.split(' ')
    if instructions[0].downcase == 'help'
      return help
    elsif instructions[0].downcase == 'learn'
      return learn instructions[1].downcase
    end
  end

  def random_word
    Word.order('RANDOM()').first
  end
end
