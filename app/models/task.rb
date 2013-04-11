class Task < ActiveRecord::Base
  attr_accessible :done, :due_date, :name

  scope :done,   where(:done => true).order('due_date')
  scope :undone, where(:done => false).order('due_date')
end