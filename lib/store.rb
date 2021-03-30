class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3}, presence: true
  validates :annual_revenue, numericality: { only_integer: true, minimum: 0 }
  validates_associated :employees
end
