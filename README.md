-- Scenarios
- Scenario 1: Sending an e-mail

1) User signs up
2) On the user model, we have this callback:

after_create :send_welcome_email

private
def send_welcome_email
  UserMailer.welcome(self).deliver_now
end

3) After the e-mail is sent, the Rails project will continue
it's flow: it will redirect the user to the homepage and show
a flash message with "Signed in successfully"

- Scenario 2: Posting / Requesting from an API

1) User submits a payment invoice on a form
2) On the Controller, after saving the payment invoice, we
send it to a Bank's API
3) After the Bank's API answered, the Rails project continues it's flow: redirects the user and etc..