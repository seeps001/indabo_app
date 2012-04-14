class BookingMails < ActionMailer::Base
  default from: "noreply@indabo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mails.booking_request_mail.subject
  #
  def booking_request_mail(venue_name, start_date, start_time, booking_url)
    @venue_name = venue_name
    @start_date = start_date
    @start_time = start_time
    @booking_url = booking_url
    mail(:to => "raoul@world-wize.com", :subject => "[Indabo] - A booking request has been made for one of your venues.")
  end

end
