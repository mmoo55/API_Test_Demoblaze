import com.intuit.karate.junit5.Karate;

public class KarateRunner {
    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:Features/signup.feature",
                "classpath:Features/login.feature").relativeTo(getClass());
    }
}
