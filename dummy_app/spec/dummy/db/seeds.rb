p 'seed start'

3.times do |n|
  DummyApp::User.find_or_create_by!(name: "jean-#{n}", age: n, city: "paris-#{n}")
end

10.times do |n|
  DummyApp::Article.find_or_create_by!(title: "title-#{n}", dummy_app_user_id: DummyApp::User.all.sample.id, body: "bodu-#{n}")
end

p 'seed finish'
