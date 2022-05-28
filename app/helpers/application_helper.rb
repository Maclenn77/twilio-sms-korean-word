module ApplicationHelper
  def phone_number
    phone_number = ENV['TWILIO_NUMBER'] || Rails.application.credentials.TWILIO_NUMBER
  end
end
