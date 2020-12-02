class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Enriching the user with the Clearbit API..."
    sleep(3)
    puts "Finished enriching the user"
  end
end
