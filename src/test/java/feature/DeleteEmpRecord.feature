Feature: Delete the Employee Record

Background:
* url AM_HOST

Scenario: Pass -ve id and check api behavior

Given path 'delete',-1
When method delete
Then status 200

Scenario: Delete specific record

* def GetEmployeeData = call read('GetAllEmpRecords.feature@GetAllEmployeeInfoTag')
* def EmployeeData = GetEmployeeData.response

Given path 'delete', EmployeeData[0].id
When method delete
Then status 200
And match response == {"success":{"text":"successfully! deleted Records"}}
* print EmployeeData[0].id
Given path 'employee', EmployeeData[0].id
When method get
Then status 200
* print response
And match response == "false"