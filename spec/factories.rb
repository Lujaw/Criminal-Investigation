Factory.define :user do |f|
  f.sequence(:email) { |n| "user#{n}@cloudfactory.com" }
  f.password "sprout"
end