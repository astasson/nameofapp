class UserMailer < ApplicationMailer
  default from: "astass3000@live.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: "your-email@example.com",
         subject: "Anew contact form message from #{name}")
  end 
end
