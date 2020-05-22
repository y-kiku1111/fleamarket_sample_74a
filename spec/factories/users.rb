FactoryBot.define do

  factory :user do
    id                     {"1"}
    nickname               {"taro"}
    email                  {"kkk@gmail.com"}
    password               {"00000000"}
    password_confirmation  {"00000000"}
    first_name             {"綾"}
    first_name_furigana    {"あや"}
    last_name              {"山田"}
    last_name_furigana     {"やまだ"}
    birthday               {"19900925"}
  end
  
end 

