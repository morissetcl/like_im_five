p 'seed start'

3.times do |n|
  DummyApp::User.create!(name: "jean-#{n}", age: n, city: "paris-#{n}")
end

p 'seed finish'
