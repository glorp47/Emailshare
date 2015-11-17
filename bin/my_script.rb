require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s

contact = {
  contact: {
    name: 'Harris',
    email: 'email',
    user_id: 7
  }
}

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1'

).to_s

# begin
puts RestClient.get(url, contact)
# rescue RestClient::Exception
#   puts 'Error'
# end
