class TouristSpotController < ApplicationController
  def index
  end
  
  def show
		httpClient = HTTPClient.new

		@jsonData = nil
		@errorMsg = nil

    #取得するRDFを指定
    rdf_types = [
      "ugx_PrefectureGovernmentOffice",
      "ugx_CityGovernmentOffice",
      "ugx_WardOffice",
      "ugx_BranchGovernmentOffice",
      "ugx_Hotel",
      "ugx_Souvenirs",
      "ugx_Cookshop",
      "ugx_Sightseeing",
      "ugx_ReligiousFacility"
    ]

		begin
			#Basic認証
			httpClient.set_auth("https://kyoto.smartercity.jp/api/v1/places", "username", "password");
			#リクエスト送信
			data = httpClient.get_content("https://kyoto.smartercity.jp/api/v1/places", {
				"rdf_type" => rdf_types.join(",")
			});
			@jsonData = JSON.parse data

		rescue HTTPClient::BadResponseError => e
		rescue HTTPClient::TimeoutError => e
		end

		render :json => @jsonData
  end
end
