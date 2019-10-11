# frozen_string_literal: true

# require 'rubygems'
require 'bundler/setup'
require 'json'

@base_url = 'http://challenge.teespring.com/v1/'

@question_url = @base_url + 'question'
@eval_url = @question_url + 'evaluate'
@practice_url = @question_url + 'practice_url'
@inks_url = @base_url + 'inks'
@content_type = 'Content-Type: application/json'
@auth = 'Auth-Token: 0665f59d-944c-45eb-8998-fe5cde640ea5'

@client = Faraday.new(
  url: @base_url,
  headers: { 'Content-Type' => 'application/json',
             'Auth-Token' => '0665f59d-944c-45eb-8998-fe5cde640ea5' }
)

def euclidean_distance(p1, p2)
  sum_of_squares = 0
  p1.each_with_index do |p1_coord, index|
    sum_of_squares += (p1_coord - p2[index])**2
  end
  Math.sqrt(sum_of_squares)
 end

def hexToRBG(hex)
    rbg = hex.scan(/…/).map {|color| color.to_i(16)}
    {r: rbg[0], g: rbg[1], b rbg[2]}
end

def colorDistance(color1, color2)
    #format {r: 0.0, g: 0.0, b: 0.0}
    Colourdistance.ciede2000(color1,color2)
def inks
     @inks ||= JSON.parse(@client.get('inks').body) #Assuming stable data
end
def answer_practice(scenario_id, answers)
end

#toDo apply color comparison to ink list, write out response, remove extra comments and terminal test code 

point_a = colorToArr('#34A071')
point_b = colorToArr('#19BB27')
puts euclidean_distance(point_a, point_b)


response = @client.get('question/practice')
body =  JSON.parse(response.body)
scenario_id = body["scenario_id"]
questions = body["questions"]
puts scenario_id
puts body
puts questions

