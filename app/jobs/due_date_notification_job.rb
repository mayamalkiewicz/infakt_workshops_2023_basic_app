class DueDateNotificationJob
  include Sidekiq::Job

  def perform
    BookLoan.checked_out.where(due_date: Time.zone.now..Time.zone.now + 2.minutes).each do |book_loan|
      UserMailer.loan_notification_email(book_loan).deliver_now
    end
  end
end