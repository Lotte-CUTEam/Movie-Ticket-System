package dto;

import java.time.LocalDateTime;


/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]ScreenDto.java
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       장혜원         신규생성
 * -----------------------------------------------------------
 */

public class ScreenDto {

    private long screenId; // 상영 ID

    private long id; // 영화 ID

    private LocalDateTime screenAt; // 영화 시작

    private String cinema; // 극장

    public ScreenDto() {}

    public ScreenDto(long screenId, long id, LocalDateTime screenAt, String cinema) {
        this.screenId = screenId;
        this.id = id;
        this.screenAt = screenAt;
        this.cinema = cinema;
    }

    public long getScreenId() {
        return screenId;
    }

    public long getId() {
        return id;
    }

    public LocalDateTime getScreenAt() {
        return screenAt;
    }

    public String getCinema() {
        return cinema;
    }


    @Override
    public String toString() {
        return "ScreenDto [screenId=" + screenId + ", id=" + id + ", screenAt=" + screenAt
                + ", cinema=" + cinema + "]";
    }



}
