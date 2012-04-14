require "spec_helper"

describe BookingMails do
  describe "booking_request_mail" do
    let(:mail) { BookingMails.booking_request_mail }

    it "renders the headers" do
      mail.subject.should eq("Booking request mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
