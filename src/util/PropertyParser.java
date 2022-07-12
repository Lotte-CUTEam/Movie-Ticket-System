package util;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]PropertyParser.java
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.09       장혜원         신규생성
 * -----------------------------------------------------------
 */
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
