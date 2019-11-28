class TripRequest < ApplicationRecord
  belongs_to :trip
  belongs_to :winch
  after_create :send_sms

  def send_sms
    @winch = self.winch
    # @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    # message = @client.messages.create(
    #                          body: 'Hi there!',
    #                          from: '+14433032789',
    #                          to: '+5511996125717'
                           # )
    # puts message.sid
  end
end
