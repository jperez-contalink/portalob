class UserMailer < ApplicationMailer

  def contacto_email(user, titulo, correo)
    @user = user
    subject = "Comentario de " + @user.nombre + ": " + titulo
    correo = correo + "<br>Puede responder directamente a: " + @user.email
    mail(to: @user.empresa.email, body: correo, subject: subject, content_type: "text/html",)
  end


end