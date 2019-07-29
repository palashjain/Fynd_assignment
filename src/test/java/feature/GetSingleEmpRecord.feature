Feature: Read data of single employees

Background:
* url AM_HOST

Scenario: Check behavior when we give negative user id 

Given path 'employee',-1
When method get
Then match response == 'false'
And status 200

@EmployeeExistsTag
Scenario: Check behavior when we give +ve user id which we know for which the employee exists

Given path 'employees'
When method get
Then status 200

* def first = response[0]

Given path 'employee', first.id
When method get
Then status 200
And match response.id == first.id

Scenario: check behavior when we give +ve user id for which employee doesn't exist

Given path 'employee',10000000
When method get
Then match response == 'false'
And status 200

Scenario: Check behavior when we give 0 as user id

Given path 'employee',0
When method get
Then status 200
And match response == read('GetResponseFor_IDZero.txt')

Scenario: Check when we won't pass the parameter

Given path 'employee'
When method get
Then status 404
