class Student < ApplicationRecord
  validates :name, presence: true, length:{ maximum: 50, uniqueness: true,
                    too_long: "は最大%{count}文字まで使用できます"}

  has_many :conditions
end
