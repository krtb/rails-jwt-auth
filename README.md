# rails-jwt-auth
A small rails API with JWT authorization implemented 


# Notes
* Serializers
  * ActiveModel::Serializer
    * provides a way of creating custom JSON by representing each resource as a class that inherits from ActiveModel::Serializer
    * last commit to repo was in 2018, alternatives to for later change below in links
* BCRYPT
  * gives capability to [salt](https://en.wikipedia.org/wiki/Salt_(cryptography)) Users
  * runs plain text through [hashing function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
    * one way function
  * store `digested` passwords in DB
* JSON Web Tokens (JWT)
  * Token-based authentication is stateless.
  *  We are not storing any information about a logged in user on the server (which also means we don't need a model or table for our user sessions).
  *   No stored information means our application can scale and add more machines as necessary without worrying about where a user is logged in. 
  *   Instead, the client (browser) stores a token and sends that token along with every authenticated request.
  *   Instead of storing a plaintext username, or user_id, we can encode user data with JSON Web Tokens (JWT) and store that encoded token client-side.


# External Research Resources
* [(Sitepoint): Active Model Serializers, Rails, and JSON](https://www.sitepoint.com/active-model-serializers-rails-and-json-oh-my/)
* [(Github): Active Model Serializer API status](https://github.com/rails-api/active_model_serializers#status-of-ams)
* [(Blog Post): Migrating ActiveModel Serializer to JSerializer](https://stevenyue.com/blogs/migrating-active-model-serializers-to-jserializer)
* [(Ruby Libhunt): ActiveModel::Serializers alternatives and similar gems](https://ruby.libhunt.com/active_model_serializers-alternatives)
* [(Github): Grape, for REST-like APIs](https://github.com/ruby-grape/grape)
* [(Github): Fast JSON API, from Netflix](https://github.com/Netflix/fast_jsonapi)
* [(GraphQL API Docs): GraphQL for Rails](https://graphql-ruby.org/development#setup)
* [(Rails 6 API Docs): as_json/from_json methods](https://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html)
* [(StackOverflow): How can I “pretty” format my JSON output in Ruby on Rails?](https://stackoverflow.com/questions/86653/how-can-i-pretty-format-my-json-output-in-ruby-on-rails?noredirect=1)
* [(StackOverflow): sending nested json object using postman](https://stackoverflow.com/questions/26705782/sending-nested-json-object-using-postman#26919793)
* [(Github): rails http status codes](https://gist.github.com/mlanett/a31c340b132ddefa9cca)