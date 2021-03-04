class UserCreditResetJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Reseting #{user.email}'s credit to 10..."
    user.credit = 10
    user.save
    puts "Done! #{user.email} has now #{user.credit} of credit."
  end
end
