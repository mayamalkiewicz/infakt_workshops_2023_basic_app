class UserMailer < ApplicationMailer
  def loan_created_email(book_loan)
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    @user_email = book_loan.user.email

    mail(to: @user_email, subject: 'You have just loaned book #{@title} successfully.')
  end
end