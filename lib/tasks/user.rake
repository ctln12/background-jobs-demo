namespace :user do
  desc "Enriching all users with Clearbit (async)"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end

  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    # rake task will return when job is _done_
  end

  desc "Reseting all users credit to 10"
  task reset_all: :environment do
    users = User.all
    puts "Enqueuing reseting credit of #{users.size} users..."
    users.each do |user|
      UserCreditResetJob.set(wait: 10.seconds).perform_later(user)
    end
  end
end
