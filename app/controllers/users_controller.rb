UserDto = Struct.new(:id, :first_name, :last_name, keyword_init: true)

class UsersController < ApplicationController
  def index
    api_host = ENV.fetch('API_HOST')
    response = Net::HTTP.get(api_host, '/api/users', 3001)
    response = JSON.parse(response)

    user_dtos = response.map do |i|
      UserDto.new(
        id: i["id"],
        first_name: i["first_name"],
        last_name: i["last_name"]
      )
    end

    @users = user_dtos
  end
end