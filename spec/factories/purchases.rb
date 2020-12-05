FactoryBot.define do
  factory :purchase do
    postal_code {'111-2222'}
    prefecture_id {2}
    city {'東京都'}
    city2 {'1-1'}
    phone_num{'09011110000'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
