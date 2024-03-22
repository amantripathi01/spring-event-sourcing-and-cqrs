# ********RoostGPT********

# Test generated by RoostGPT for test karateTest22March using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /laureate/{laureateID}_get for http method type GET 
# RoostTestHash=100d61e03c
# 
# 

# ********RoostGPT********
Feature: Laureate API

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase

Scenario Outline: Test GET /2.1/laureate/{laureateID} endpoint
  Given path '2.1/laureate', <laureateID>
  When method get
  Then match responseStatus == <statusCode>
  And match responseHeaders == <responseHeaders>
  
  Examples:
    | laureateID | statusCode | responseHeaders |
    | 1          | 200        | 'No response headers' |
    | 0          | 400        | 'No response headers' |
    | null       | 404        | 'No response headers' |
    | 'invalid'  | 422        | 'No response headers' |
