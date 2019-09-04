# frozen_string_literal: true

# this class sends emails related to teams
class TeamMailer < ApplicationMailer
  def send_welcome_email
    mail(to: 'some_email_address@gmail.com',
         bcc: '',
         subject: 'Welcome!')
  end
end
