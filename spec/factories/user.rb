FactoryBot.define do
  factory :user do
    nickname              {"nickname"}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6,max_length:12)}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_date            {"2020-01-01"}
  end
end