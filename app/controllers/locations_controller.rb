class LocationsController < ApplicationController
  def index
    @towns = [
      {
        address: "331 Great Road",
        town: "Bedford",
        state: "MA",
        phone: "781-275-1135",
        email: "bedford@bostonwood.com"
      },
      {
        address: "59 Mount Auburn Street",
        town: "Watertown",
        state: "MA",
        phone: "617-924-7412",
        email: "watertown@bostonwood.com"
      }
    ]

    @env = ENV["GOOGLE_API"]
  end
end
