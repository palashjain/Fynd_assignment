Feature: Read data of all employees

Background:
* url AM_HOST

@GetAllEmployeeInfoTag
Scenario: Get all employees

Given path 'employees'
When method get
Then status 200
And response!== null