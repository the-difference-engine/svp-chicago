require 'mailgun'

class NotifierMailer < ApplicationMailer
	
	def welcome_email(email)
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

    # Define your message parameters
    message_params =  { from: 'svp.practice.email@gmail.com',
                        to:   email,
                        subject: 'Thanks for submitting your application.',
                        text:    'It is really easy to send a message!'
                      }

    # Send your message through the client
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
	end


end
