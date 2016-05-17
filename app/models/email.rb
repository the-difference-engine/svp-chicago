# class Email

#   # def initialize(loi)
#   #   @email = loi
#   # end

#   def send
#      Mail.defaults do
#       delivery_method :smtp, {
#       :address => 'smtp.gmail.com',
#       :port => '587',
#       :user_name => 'svptesting1871@gmail.com',
#       :password => 'svptesting',
#       :authentication => :plain,
#       :enable_starttls_auto => true
#       }
#     end

#       mail = Mail.new do
#       from     'SVP'
#       #need to insert email that was submitted with form
#       to       @email
#       subject  'Your SVP submission was received!'
#       end

#       mail.deliver!
#   end    

# end
