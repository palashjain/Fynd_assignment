Feature: Create Employee Record

Background:
* url AM_HOST

Scenario: Check Post Request Documentation for incomplete Request Data

Given path 'create'
And request '{}'
And header Accept = 'application/json'
When method post
Then status 200
And match response.error == { "text": "SQLSTATE[23000]: Integrity constraint violation: 1048 Column 'employee_name' cannot be null"}

Given path 'create'
And request '{"name":"test341"}'
And header Accept = 'application/json'
When method post
Then status 200
And match response.error == { "text": "SQLSTATE[23000]: Integrity constraint violation: 1048 Column 'employee_salary' cannot be null"}

Given path 'create'
And request {"name":"test3131","salary":"123"}
And header Accept = 'application/json'
When method post
Then status 200
And match response.error == { "text": "SQLSTATE[23000]: Integrity constraint violation: 1048 Column 'employee_age' cannot be null"}
				
Scenario: Pass the duplicate request data 

* def GetEmployeeData = call read('GetSingleEmployeeRecord.feature@EmployeeExistsTag')
* def EmployeeData = GetEmployeeData.response

* string name = EmployeeData.employee_name
* string salary = EmployeeData.employee_salary
* string age = EmployeeData.employee_age

* print name
* print salary
* print age

Given path 'create'
And request {"name" :'#(EmployeeData.employee_name)' , "salary" : #(EmployeeData.employee_salary) ,"age" : #(EmployeeData.employee_age)}
And header Accept = 'application/json'
When method post
Then status 200
And match response.error != {}


Scenario: pass Correct request data to the request

Given path 'create'
* def RequestData = read('PostRequestValidData.json')
And request {"name":'#(RequestData.name)',"salary" : #(RequestData.salary),"age": #(RequestData.age)}
And header Accept = 'application/json'
When method post
Then status 201
* print RequestData.name
And match response.name == RequestData.name


Scenario: pass the string value for key who accept the int value and vice versa

Given path 'create'
* def RequestData = read('PostInvalidRequestData.json')
And request {"name":'#(RequestData.name)',"salary" : #(RequestData.salary),"age": #(RequestData.age)}
And header Accept = 'application/json'
When method post
Then status 400
