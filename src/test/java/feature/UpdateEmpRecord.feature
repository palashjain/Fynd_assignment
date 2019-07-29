Feature: Update data of employees

Background:
* url AM_HOST

Scenario: Check behavior when we give negative user id to update request 

Given path 'update',-1
* def RequestData = read('UpdateDetailsRequest.json')
And request {"name":'#(RequestData.name)',"salary" : #(RequestData.salary),"age": #(RequestData.age)}
And header Accept = 'application/json'
When method put
Then status 200

Scenario: Check behavior when we pass the duplicate name in the request

* def GetEmployeeData = call read('GetAllEmpRecords.feature@GetAllEmployeeInfoTag')
* def EmployeeData = GetEmployeeData.response
Given path 'update',EmployeeData[0].id
And request {"name":'#(EmployeeData[1].employee_name)',"salary" : #(EmployeeData[1].employee_salary),"age": #(EmployeeData[1].employee_age)}
When method put
Then status 200
* print response
* print EmployeeData[1].employee_name
And match response != EmployeeData[1]

Scenario: check behavior when we give +ve user id for which employee exist

* def GetEmployeeData = call read('GetAllEmpRecords.feature@GetAllEmployeeInfoTag')
* def EmployeeData = GetEmployeeData.response
Given path 'update',EmployeeData[0].id
* def RequestData = read('UpdateDetailsRequest.json')
And request {"name":'#(RequestData.name)',"salary" : #(RequestData.salary),"age": #(RequestData.age)}
When method put
Then status 200
* print RequestData
* print response
* print RequestData.name
* print response.name
And match response == RequestData

