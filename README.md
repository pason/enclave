# README


* Install Docker and Docker-Compose
Build containers
  cd advanon/
  docker-compose build
Start web and db containers
  docker-compose up -d web

* Run tests and test DB
  docker-compose run -e RAILS_ENV=test web bundle exec rake db:create
  docker-compose exec web bundle exec rake db:test:load
  docker-compose exec web bundle exec rspec

