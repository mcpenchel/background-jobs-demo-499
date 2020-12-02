class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # After the DB commits the transaction (INSERT/UPDATE/DELETE)
  after_commit :enrich_user

  private
  def enrich_user
    UpdateUserJob.perform_later(self)
  end
end
