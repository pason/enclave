Given a boolean 2D matrix, find the number of islands. A group of connected 1s forms an island. 


* Install Docker and Docker-Compose

Build containers
`cd enclave
docker-compose build
Start web and db containers
docker-compose up -d web`

* Run tests and test DB
  `docker-compose run -e RAILS_ENV=test web bundle exec rake db:create`
  `docker-compose exec web bundle exec rake db:test:load`
  `docker-compose exec web bundle exec rspec`
  
