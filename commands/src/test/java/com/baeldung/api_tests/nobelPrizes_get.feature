# ********RoostGPT********

# Test generated by RoostGPT for test karateTest22March using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /nobelPrizes_get for http method type GET 
# RoostTestHash=977dd819cb
# 
# 

# ********RoostGPT********
Feature: Nobel Prizes API Test

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase

Scenario Outline: Validate successful Nobel Prizes API call

  Given path '/2.1/nobelPrizes'
  And params {offset: '#(offset)', limit: '#(limit)', sort: '#(sort)', nobelPrizeYear: '#(nobelPrizeYear)', yearTo: '#(yearTo)', nobelPrizeCategory: '#(nobelPrizeCategory)', format: '#(format)', csvLang: '#(csvLang)'}
  When method get
  Then status 200
  And match response == {nobelPrizes: '#(nobelPrizes)', meta: '#(meta)', links: '#(links)'}

  Examples:
  | offset | limit | sort | nobelPrizeYear | yearTo | nobelPrizeCategory | format | csvLang | nobelPrizes | meta | links |
  | 1      | 1     | 'asc' | 2000           | 2005   | 'eco'              | 'json' | 'en'    | '@array'    | '@object' | '@array' |

Scenario Outline: Validate error responses for Nobel Prizes API call

  Given path '/2.1/nobelPrizes'
  And params {offset: '#(offset)', limit: '#(limit)', sort: '#(sort)', nobelPrizeYear: '#(nobelPrizeYear)', yearTo: '#(yearTo)', nobelPrizeCategory: '#(nobelPrizeCategory)', format: '#(format)', csvLang: '#(csvLang)'}
  When method get
  Then status '#(status)'
  And match response == {code: '#(code)', message: '#(message)'}

  Examples:
  | offset | limit | sort | nobelPrizeYear | yearTo | nobelPrizeCategory | format | csvLang | status | code | message |
  | 1      | 1     | 'asc' | 2000           | 2005   | 'eco'              | 'json' | 'en'    | 400    | '404' | 'There is not Laureate born that date' |
  | 1      | 1     | 'asc' | 2000           | 2005   | 'eco'              | 'json' | 'en'    | 404    | '404' | 'There is not Laureate born that date' |
  | 1      | 1     | 'asc' | 2000           | 2005   | 'eco'              | 'json' | 'en'    | 422    | '404' | 'There is not Laureate born that date' |
