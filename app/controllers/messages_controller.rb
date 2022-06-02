class MessagesController < ApplicationController 
  skip_before_action :verify_authenticity_token
  #skip_before_action :authenticate_user!, :only => "reply"

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    sms = @client.messages.create(
      from: @phone,
      to: from_number,
      body: "Learn a new Korean word! " + reply_message(message_body)
    )
  end

  private

  def boot_twilio
    @phone = ENV['TWILIO_NUMBER'] || Rails.application.credentials.TWILIO_NUMBER
    account_sid = ENV['TWILIO_SID'] || Rails.application.credentials.TWILIO_SID
    auth_token = ENV['TWILIO_TOKEN'] || Rails.application.credentials.TWILIO_TOKEN
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def learn(word_or_number = nil)
    return helpers.random_number.message if word_or_number == 'number'

    helpers.random_word.message

  end

  def reply_message message_body
    reply = helpers.random_word.message
    instructions = message_body.to_s.split(' ')
    
    if instructions[0].downcase == 'support'
      reply = helpers.help
    elsif instructions[0].downcase == 'learn'
      reply = learn instructions[1].downcase
    end

    reply
  end
end
