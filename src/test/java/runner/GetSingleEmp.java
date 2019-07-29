package runner;

import com.intuit.karate.junit4.Karate;

import cucumber.api.CucumberOptions;

import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(features = "src/test/java/com/api/feature/GetSingleEmpRecord.feature")

public class GetSingleEmp {

}
