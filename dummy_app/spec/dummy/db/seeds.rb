p 'seed start'

3.times do |n|
  DummyApp::User.find_or_create_by!(name: "jean-#{n}", age: n, city: "paris-#{n}")
end

DummyApp::Category.find_or_create_by!(label: "label")

10.times do |n|
  DummyApp::Article.find_or_create_by!(title: "title-#{n}", dummy_app_user_id: DummyApp::User.all.sample.id, body: "bodu-#{n}", dummy_app_category_id: DummyApp::Category.first.id)
end

p 'seed finish'
