FactoryBot.define do

  factory :card do
   
    id  {"1"}
    customer_id {"321"}
    card_id {"123"}
    user

    association :user, factory: :user
    # factory :user_id do
    #   association :user, factory: :id
    # end 
    
    created_at {"2020-11-11"}
    updated_at {"2020-11-11"}
  end

end