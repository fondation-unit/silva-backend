class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.postmaster
  layout "mailer"
end
