class TouristSpotController < ApplicationController
  def index
  end
  
  def show
		httpClient = HTTPClient.new

		@jsonData = nil
		@errorMsg = nil

		begin
			#Basic認証
			httpClient.set_auth("https://kyoto.smartercity.jp/api/v1/places", "akihiro.uesaka", "fZua0q_4K");
			#リクエスト送信
			data = httpClient.get_content("https://kyoto.smartercity.jp/api/v1/places", {
				"rdf_type" => "ugx_ReligiousFacility"
			});
			@jsonData = JSON.parse data

		rescue HTTPClient::BadResponseError => e
		rescue HTTPClient::TimeoutError => e
		end

		render :json => @jsonData
  end
end
