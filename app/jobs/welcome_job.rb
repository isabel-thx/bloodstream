class WelcomeJob < ApplicationJob
  queue_as :default

  def perform(user_email)
     WelcomeMailer.welcome_email(user_email).deliver_now
  end

end
