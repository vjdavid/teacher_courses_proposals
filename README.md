# CoursesProposals

Simple API that allow register teachers and their courses proposals, also you can vote for each course and teacher.

## Prerequisites

- Rails 6.0.1
- Ruby 2.6.3
- Postgresql >= 9


## Recommendations

- Faraday (`gem install faraday`)
- Pry

## How to setup

```
git clone https://github.com/vjdavid/teacher_courses_proposals.git

cd teacher_courses_proposals
bundle install
```

Create the `config/secrets.yml` and setup your database credentials with a postgresql user 

`bundle exec rake db:setup`

Run Rails

`rails s`


## Some usage


```ruby
# pry for example

#you might want to set the content type on each request or use some faraday middle ware
require 'faraday'; conn = Faraday.new( url: 'localhost:3000', :ssl => {:verify => false } ) { |f| f.request :url_encoded; f.response :logger;  f.adapter Faraday.default_adapter }
conn.post '/login', { email: 'some@dev.dev', password: 'password' }
conn.post '/proposals/submit', { "description": "the best teacher", "full_name": "Juan Lopez", "email": "juanlopez@sample.com", "courses": [ { "title": "advanced programming", "description": "sample description" }, { "title": "how to cook good salads", "description": "bolis" } ] }
conn.post '/courses/1/votes'
conn.post '/teachers/1/votes'
conn.get '/teachers'
```

## Todos

- Support existing courses
- Finish the requests specs 

