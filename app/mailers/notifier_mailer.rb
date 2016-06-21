require 'mailgun'

class NotifierMailer < ApplicationMailer
	
	def welcome_email(loi)
    # First, instantiate the Mailgun Client with your API key
    @loi = loi  
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

    # Define your message parameters
    from_email = "spv.practice.email@gmail.com"
    message_params =  {from: from_email,
                        to: @loi.email,
                        subject: 'Thanks for submitting your application.',
                        text: 'It is really easy to send a message!'
                      }
                      
    # mail(to: @loi.email, subject: 'Welcome to My Awesome Site')               
    # Send your message through the client
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
	end


end
