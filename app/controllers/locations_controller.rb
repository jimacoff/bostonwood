class LocationsController < ApplicationController
  def index
    @towns = [
      {
        google_link: "Bostonwood+331+Great+Road,Watertown+MA",
        address: "331 Great Road",
        town: "Bedford",
        state: "MA",
        phone: "781-275-1135",
        email: "bedford@bostonwood.com"
      },
      {
        google_link: "Bostonwood+55+Mount+Auburn+Street,Watertown+MA",
        address: "55 Mount Auburn Street",
        town: "Watertown",
        state: "MA",
        phone: "617-924-7412",
        email: "watertown@bostonwood.com"
      }
    ]

    @env = ENV["GOOGLE_API"]
  end
end
