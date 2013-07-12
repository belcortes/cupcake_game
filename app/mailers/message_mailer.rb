class MessageMailer < ActionMailer::Base
  default from: "belcortes@gmail.com"
  # default to: "belcortes@gmail.com"

  def receive(email)
    page = Page.find_by_address(email.to.default)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )
 
    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end

  def warning_email(user)
    @user = user
    @url = 'http://heroku.com'
    # image_url = Rails.root + 'public/how-about-no-bear.jpg'
    # attachments.inline['01-how-about-no-bear.jpg'] = File.read(image_url)
    mail(to: @user.email, subject: 'Your pusher account has reached its limit')
  end
end
