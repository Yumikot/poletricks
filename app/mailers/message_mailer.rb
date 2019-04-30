class MessageMailer < ApplicationMailer
  default to: 'ytezuka5@gmail.com'
 
  def received_email(message)
    @message = message
    mail(subject: 'webサイトよりメッセージが届きました') do |format|
      format.text
    end
  end
 
end