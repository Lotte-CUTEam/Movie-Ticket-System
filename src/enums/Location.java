package enums;

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
