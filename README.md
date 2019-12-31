# LikeImFive

Have you ever wasted time to set up testing context rather to be focus on the code ?
Have you ever had pain to write a long context because of unknow associations ?

 Like Im Five generate a file with factories you need to test a specific object. It use you DB development to retrieve the object you want and all associations you will have need to setup the test.

Create a complex testing context in a few second.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'like_im_five'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install like_im_five

## Usage

Just open you terminal, go in your project and type:

`like_im_five id_of_object table_of_object`

*(if you are facing somme issue try to prepend bundle exec before the commands above)*

It take two parameters.

`id_of_object` => The gem use your development database so you have to indicate of which one object you would like create context.
`table_of_object` => Then you have to specify what is the table of the `id` you just typed above.

An example is better than 1000 words so let's taking the example below:

In your DB development you have these objects:

```ruby
=> #<DummyApp::User id: 12 name: "Jean", city: "London", age: 20, created_at: "2019-12-30 22:45:33", updated_at: "2019-12-30 22:45:33">
```
```ruby
=> #<DummyApp::Article id: 1, title: "Subway Art 25th", body: "Anniversary Edition", dummy_app_user_id: 2, created_at: "2019-12-30 22:45:33", updated_at: "2019-12-30 22:45:33", dummy_app_category_id: 1>
```
```ruby
=> #<DummyApp::Category id: 1, label: "Graffiti", created_at: "2019-12-30 22:45:33", updated_at: "2019-12-30 22:45:33", dummy_app_topic_id: 3>
```
```ruby
=> #<DummyApp::Topic id: 3, title: "Culture", description: "Culture is beautiful", created_at: "2019-12-30 22:45:33", updated_at: "2019-12-30 22:45:33">
```

You want to test your `article`, in your terminal you have to type the following command:

`like_im_five 1 dummy_app_articles`

and it will generate a new file in your spec folder named: `data.txt` containing factories:

```ruby
let(:dummy_app_category) { create :dummy_app_category, id: 1, label: "Graffiti", dummy_app_topic_id: 3 }
let(:dummy_app_topic) { create :dummy_app_topic, id: 3, title: "Culture", description: "Culture is beautiful" }
let(:dummy_app_user) { create :dummy_app_user, id: 2, name: "Jean", city: "London", age: 20 }
```

That's it, just copy/paste it in your concerned spec.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/like_im_five. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/like_im_five/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LikeImFive project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/like_im_five/blob/master/CODE_OF_CONDUCT.md).
