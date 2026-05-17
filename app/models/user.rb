class User < ApplicationRecord
  has_secure_password
  has_many :stocks, dependent: :destroy
  validates :email, presence: { message: "を入力してください" },
                    uniqueness: { message: "はすでに登録されています" }
end