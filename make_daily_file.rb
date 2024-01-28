require 'net/http'
require 'uri'
require 'json'
require 'date'

# Define the URL and the query
url = URI.parse('https://leetcode.com/graphql')
query = {
  "query" => "\n query questionOfToday {\n activeDailyCodingChallengeQuestion {\n date\n userStatus\n link\n question {\n acRate\n difficulty\n freqBar\n frontendQuestionId: questionFrontendId\n isFavor\n paidOnly: isPaidOnly\n status\n title\n titleSlug\n hasVideoSolution\n hasSolution\n topicTags {\n name\n id\n slug\n }\n }\n }\n}\n ",
  "variables" => {},
  "operationName" => "questionOfToday"
}

# Create the HTTP request
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
request = Net::HTTP::Post.new(url.request_uri)
request.content_type = 'application/json'
request.body = query.to_json

# Send the request and parse the response
response = http.request(request)
result = JSON.parse(response.body)

# Extract and display the daily question name
if result && result["data"] && result["data"]["activeDailyCodingChallengeQuestion"] && result["data"]["activeDailyCodingChallengeQuestion"]["question"]
  daily_question = result["data"]["activeDailyCodingChallengeQuestion"]["question"]["title"]
  id = result["data"]["activeDailyCodingChallengeQuestion"]["question"]["frontendQuestionId"]

  current_date = Date.today.strftime('%d-%m-%Y')

  filename = "#{current_date} #{id}. #{daily_question}.rb"

  puts filename

  File.open(filename, 'w') {}
else
  puts "Unable to retrieve the daily question."
end

