class Task < ActiveRecord::Base
  attr_accessible :user_id, :done, :due_date, :name, :user

  belongs_to :user

  scope :done,   where(:done => true).order('due_date')
  scope :undone, where(:done => false).order('due_date')
end