namespace :user do
  desc "Update all the users by enriching them with Clearbit API"
  task update_all: :environment do
    User.all.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end

  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    # args is similar to params, you read from it as a hash!
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    # rake task will return when job is _done_
  end

end
