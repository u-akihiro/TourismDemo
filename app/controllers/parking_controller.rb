class ParkingController < ApplicationController
  def index
  end
  
  def  show
    httpClient = HTTPClient.new
    
    @jsonData = nil
    @errorMsg = nil
    
    begin
      httpClient.set_auth("https://kyoto.smartercity.jp/api/v1/places?rdf_type=ugx_Parking&ugx_targetTransportation=ugx_Cycle", "username", "password")
      data = httpClient.get_content("https://kyoto.smartercity.jp/api/v1/places?rdf_type=ugx_Parking&ugx_targetTransportation=ugx_Cycle")
      @jsonData = JSON.parse data
      #p @jsonData
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
    
    render :json => @jsonData
  end
end
