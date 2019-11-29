class TripRequest < ApplicationRecord
  belongs_to :trip
  belongs_to :winch
  after_create :send_sms

  def send_sms
    @winch = self.winch
    # @client = Twilio::REST::Client.new(ENV.fetch('TWILIO_ACCOUNT_SID'), ENV.fecth('TWILIO_AUTH_TOKEN'))
    # message = @client.messages.create(
    #                          body: "Você tem uma nova solicitação de serviço! Para ver as informações e aceitá-la, entre em www.savecar.com/requests/#{@id}",
    #                          from: '+14433032789',
    #                          to: @winch.phone
    #                        )
    # puts message.sid
  end
end
