# ********RoostGPT********

# Test generated by RoostGPT for test karateTest22March using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /nobelPrizes_get for http method type GET 
# RoostTestHash=977dd819cb
# 
# 

# ********RoostGPT********
Feature: Nobel Prizes API Endpoint

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authHeader = { Authorization: '#(karate.properties['AUTH_TOKEN'])' }

Scenario Outline: Get Nobel Prizes
  Given path '/2.1/nobelPrizes'
  And params { offset: '<offset>', limit: '<limit>', sort: '<sort>', nobelPrizeYear: '<nobelPrizeYear>', yearTo: '<yearTo>', nobelPrizeCategory: '<nobelPrizeCategory>', format: '<format>', csvLang: '<csvLang>' }
  And headers authHeader
  When method get
  Then status 200
  And match response contains { nobelPrizes: '#present' }
  And match each response.nobelPrizes contains { awardYear: '#number', category: '#object', dateAwarded: '#string', prizeAmount: '#number', prizeAmountAdjusted: '#number', topMotivation: '#object', laureates: '#array' }
  And match each response.nobelPrizes..laureates contains { id: '#number', name: '#object', portion: '#string', sortOrder: '#string', motivation: '#object', links: '#array' }
  And match response..links contains { first: '#string', prev: '#string', self: '#string', next: '#string', last: '#string' }

  Examples:
    | offset | limit | sort  | nobelPrizeYear | yearTo | nobelPrizeCategory | format | csvLang |
    | 1      | 10    | 'asc' | 2000            | 2010   | 'eco'              | 'json' | 'en'    |

Scenario: Bad Request
  Given path '/2.1/nobelPrizes'
  And params { offset: 'string', limit: 'string' }
  And headers authHeader
  When method get
  Then status 400
  And match response contains { code: '#string', message: '#string' }

Scenario: Not Found
  Given path '/2.1/nobelPrizes'
  And params { nobelPrizeYear: 1800 }
  And headers authHeader
  When method get
  Then status 404
  And match response contains { code: '#string', message: '#string' }

Scenario: Unprocessable Entity
  Given path '/2.1/nobelPrizes'
  And params { yearTo: 1899 }
  And headers authHeader
  When method get
  Then status 422
  And match response contains { code: '#string', message: '#string' }
