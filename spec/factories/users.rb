FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    last_name_kanji       { '安倍' }
    first_name_kanji      { '晋三' }
    last_name_katakana    { 'アベ' }
    first_name_katakana   { 'シンゾウ' }
    birth_date            { '1954-09-21' }
  end
end