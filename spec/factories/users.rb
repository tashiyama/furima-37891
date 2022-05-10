FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'hoge2000' }
    password_confirmation { password }
    last_name             { '山本' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマモト' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1996-10-28' }
  end
end
