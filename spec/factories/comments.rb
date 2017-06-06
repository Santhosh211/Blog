FactoryGirl.define do
  factory :comment do
    user_id 1
    body "MyText"
    post_id 1
  end
end
