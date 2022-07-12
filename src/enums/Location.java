package enums;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]Location.java
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       장혜원         신규생성
 * -----------------------------------------------------------
 */
public enum Location {

    SEOUL("서울"),
    GYEONGGY_INCHEON("경기/인천"),
    CHUNGCHEONG_DAEJEON("충청/대전"),
    JEOLLA_GWANGJU("전라/광주"),
    KYEONGBUK_DAEGU("경북/대구"),
    KYEONGNAM_BUSAN_ULSAN("경남/부산/울산"),
    KANGWON("강원"),
    JEJU("제주");
    
    private String LocationName;
    
    

    Location(String locationName) {
        LocationName = locationName;
    }
    
   

    public String getLocationName() {
        return LocationName;
    }

}
