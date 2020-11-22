class Student < ApplicationRecord
  	belongs_to :sclass
	validates :no, presence: true, length: { minimum: 1}
	validates :name, presence: true, length: { minimum: 2}
	validates :sclass_id, presence: true
	validates :no, uniqueness: { scope: :sclass_id, message: '该班级已存在此学号' }
end
