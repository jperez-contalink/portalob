class UserMailer < ApplicationMailer

  def contacto_email(user, correo)
    @user = user
    @url  = 'http://example.com/login'
    subject = "Comentario de " + @user.nombre
    #mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    #mail(to: 'jperez.fcfm@gmail.com', subject: 'Welcome to My Awesome Site')
    mail(to: @user.empresa.email, body: correo, subject: subject, content_type: "text/html",)
  end


end