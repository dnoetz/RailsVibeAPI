require 'uri'
require 'net/http'

class TravelAdvisor
    def list_nearby
        url = URI("https://travel-advisor.p.rapidapi.com/locations/v2/list-nearby?currency=USD&units=km&lang=en_US")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/json'
        request["X-RapidAPI-Key"] = '5c94a0aed5mshb9d0641c206b6d3p1f20fajsn9f3d24d14963'
        request["X-RapidAPI-Host"] = 'travel-advisor.p.rapidapi.com'
        request.body = "{\n    \"contentId\": \"cc8fc7b8-88ed-47d3-a70e-0de9991f6604\",\n    \"contentType\": \"restaurant\",\n    \"filters\": [\n        {\n            \"id\": \"placetype\",\n            \"value\": [\n                \"hotel\",\n                \"attraction\",\n                \"restaurant\"\n            ]\n        },\n        {\n            \"id\": \"minRating\",\n            \"value\": [\n                \"30\"\n            ]\n        }\n    ],\n    \"boundingBox\": {\n        \"northEastCorner\": {\n            \"latitude\": 12.248278039408776,\n            \"longitude\": 109.1981618106365\n        },\n        \"southWestCorner\": {\n            \"latitude\": 12.243407232845051,\n            \"longitude\": 109.1921640560031\n        }\n    }\n}"

        response = http.request(request)
        #puts response.read_body.force_encoding('UTF-8')

        JSON.parse(response.read_body.force_encoding('UTF-8'))
    end
end
