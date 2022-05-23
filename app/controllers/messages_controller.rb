class MessagesController < ApplicationController 
  skip_before_action :verify_authenticity_token
  #skip_before_action :authenticate_user!, :only => "reply"

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    phone = ENV['TWILIO_NUMBER']
    boot_twilio
    random_word
    sms = @client.messages.create(
      from: phone,
      to: from_number,
      body: "Learn a new Korean word! #{@word.korean_word} (pronounced #{@word.romanja}) means #{@word.translation}"
    )
    render xml: sms
  end

  private

  def boot_twilio
    account_sid = Rails.application.credentials.twilio_sid
    auth_token = Rails.application.credentials.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def reply_message
    
  end

  def random_word
    @word = Word.order('RANDOM()').first
  end
end
