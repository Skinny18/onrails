require 'rest-client'
require 'json'



class SteamController < ApplicationController
  def index
    api = RestClient.get("http://api.steampowered.com/ISteamApps/GetAppList/v0002/")
    @response = JSON.parse(api.body)

  end
end
