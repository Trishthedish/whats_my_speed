require 'httparty'
require 'awesome_print'

# GEOGRAPHY_TYPE: censusplace, msa, usf, county, statesenate, statehouse, congdistrict
#GEORGRAPHY_ID: to search for separated by commas and a maximum of 10 are allowed
# sSPEED_TEST_TYPE: specify the speed test type among any,ookla,mlab with default being any

class Broadband_Wrapper
  BASE_URL = "https://www.broadbandmap.gov/broadbandmap/speedtest"
  GEOGRAPHY_TYPE = "state"
  # temporary thing that you will be able to search for.
  # GEOGRAPHY_IDS = "01,02,03"
  FORMAT = "json"

  def self.search_broadband(search_term)
    url = BASE_URL +  "#{GEOGRAPHY_TYPE}" + "ids" + "#{search_term}?"+ "&format=#{FORMAT}"

    data = HTTParty.get(url)
    search_results = []

    data["hits"].each do |hit|
      result = hit["results"]
      search_results << build_data(result)
    end
    search_results
  end



  def self.build_data(result)
    name = result["geographyName"]
    accessFrom = result["accessFrom"]
    num_of_tests = result["numberOfTests"]
    download = result["medianDownload"]
    upload = result["medianUpload"]

    Result.new(name, accessFrom, num_of_tests, download, upload)
  end

end
