class FakeJob < ApplicationJob
  queue_as :default

  # Sacred method name: it NEEDS to be perform
  def perform
    puts "Starting to do something really complex.."
    sleep(5)
    puts "I'm done"
  end
end
