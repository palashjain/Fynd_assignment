## API Automation using the Karate framework

The main motive of this project is to Automate the API's using karate framework. In this Example I have used the mock API's from the http://dummy.restapiexample.com/ and Automated the CRUD operation.

## Installation

Editor:

```sh
Install Eclipse Photon (4.8) - https://www.eclipse.org/downloads/
```
JDK:

```sh
at least version 1.8.0_112
```

Maven dependencies:

```sh
<dependency>
  <groupId>com.intuit.karate</groupId>
  <artifactId>karate-apache</artifactId>
  <version>0.9.4</version>
  <scope>test</scope>
  </dependency>
<dependency>
  <groupId>com.intuit.karate</groupId>
  <artifactId>karate-junit4</artifactId>
  <version>0.9.4</version>
  <scope>test</scope>
</dependency>
```
## Usage example

1. *.feature - All feature files under feature folder contains the different scenarios which user can perform for the particular request. For example, consider the CreateEmpRecord.feature which contains the different scenarios by which we can test the api and all these scenarios can run automatically depending on the call given to them.
2. *.java - All java files under runner folder contain the individual caller for respective feature file. User can call respective feature file by calling it's caller.
3. *.txt & *.json - All *.txt & *.json files contain the data of request or response of the API to manipulate the runtime behavior of the API by comparing it with the exact response which we get from the API after calling it.
4. AllFeatureRunner.java - Used to run all the feature files at once.

## Report Generation

Report for the above execution gets generated in /target/surefire-reports where you can see the web based report of the execution of the feature file.


## Development setup

1. Install the JDK at least version 1.8.0_112.
2. Install eclipse.
3. Add dependencies for karate in the POM.xml.

