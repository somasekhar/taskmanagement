class UserMailer < ActionMailer::Base
  default from: "itssomu@example.com"


  def welcome_email(user)

    @user = user
    @url = "http://example.com/login"
    #attachments['terms.pdf'] = File.read('/path/terms.pdf')
    mail(:to => user.email, :subject => "Welcome to My Awesome Site") do |format|
      format.html
    end
  end
  def creation(task)

    @task = task
    mail(:to => task.user.email, :subject => "Thanks for creating the Task")

  end

  def completion(task)

    @task = task
    mail(:to => task.user.email, :subject => "Thanks for completing the Task")

  end

  def deletion(task)

    @task = task
    mail(:to => task.user.email, :subject => "Thanks for deleting the Task")

  end
end
