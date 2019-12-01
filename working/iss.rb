require 'net/http'
require 'open-uri'
require 'json'

def call_api(endpoint)
  response = Net::HTTP.get(URI("http://api.open-notify.org" + endpoint))
  JSON.parse(response)
end

def show_roster
  result = call_api('/astros.json')
  puts "There are #{result['number']} people in space"
  (0..result['number']).each {|i| puts result['people'][i]['name']}
end

# might have to format datetime
def show_next_pass(latitude, longitude)
  result = call_api("/iss-pass.json?lat=#{latitude}&long=#{longitude}")
  puts("The next ISS pass for #{result['request']['latitude']} #{result['request']['longitude']} is #{result['response'][0]['risetime']} for #{result['response'][0]['duration']} seconds")
end

def main
  show_roster
  print "\n"
  show_next_pass("41.4", "-81.6")
end


