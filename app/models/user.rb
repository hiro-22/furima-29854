class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      validates :nickname, presence: true

    # validates :email, presence: true, uniqueness: true  (deviseの機能に入っている
    # 下記記述ミスのためかエラーとなる為、14,15行の記述内容に変更。
    # with_options presense: true, format: { with: /\A[a-z0-9]+\z/i } do
    #  validates :password
    # end
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
      validates :password, format: { with: VALID_PASSWORD_REGEX }

    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :first_name 
      validates :last_name
    end
    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
      validates :birth_date, presence: true
    
end
