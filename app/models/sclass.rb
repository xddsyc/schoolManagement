class Sclass < ApplicationRecord
	has_many :students, dependent: :destroy
	validates :grade_name, presence: true, length: { minimum: 2}
	validates :class_name, presence: true, length: { minimum: 2}
	validates :class_name, uniqueness: { scope: :grade_name, message: '此班级已存在' }
end
