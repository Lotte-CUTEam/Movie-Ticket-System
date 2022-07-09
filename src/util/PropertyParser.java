package util;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyParser {

    private static PropertyParser propertyParser = new PropertyParser();

    private PropertyParser() {  }

    public static PropertyParser getInstance() {
        return propertyParser;
    }

    public Properties readProperties(String filename) {
        try (
            InputStream is = PropertyParser.class.getResourceAsStream("/config/db.properties");
        )
        {
            Properties prop = new Properties();
            prop.load(is);

            System.out.println("[PropertyParser] readProperties: success loading.");
            return prop;
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("[PropertyParser] readProperties: fail loading.");
        return null;
    }
}
