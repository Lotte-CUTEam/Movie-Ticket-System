package dto;

import java.time.LocalDateTime;


/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀   명]CUTEam
 * 
 * 영화 예매 기능 개발
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.09       장혜원         신규생성
 * -----------------------------------------------------------
 */ 

public class ReservationDto {

    private long reservationId; // 예약 ID

    private String memberId; // 예약자 ID

    private long screenId; // 상영 ID

    private long movieId; // 영화 ID

    private LocalDateTime screenAt; // 상영시작시간

    private int people_count; // 예매인원수

    private String cinema; // 극장

    private String title; // 제목

    private int runtime; // 러닝타임

    private LocalDateTime createdAt; // 예매 생성 시간

    private LocalDateTime deleteddAt; // 예매 취소시간

    private int status; // 관람 등급

    public ReservationDto() {
        // TODO Auto-generated constructor stub
    }

    public ReservationDto(long reservationId, String memberId, long screenId, long movieId,
            LocalDateTime screenAt, int people_count, String cinema, String title, int runtime,
            LocalDateTime createdAt, LocalDateTime deleteddAt, int status) {
        this.reservationId = reservationId;
        this.memberId = memberId;
        this.screenId = screenId;
        this.movieId = movieId;
        this.screenAt = screenAt;
        this.people_count = people_count;
        this.cinema = cinema;
        this.title = title;
        this.runtime = runtime;
        this.createdAt = createdAt;
        this.deleteddAt = deleteddAt;
        this.status = status;
    }



    public long getReservationId() {
        return reservationId;
    }



    public String getMemberId() {
        return memberId;
    }



    public long getScreenId() {
        return screenId;
    }



    public long getMovieId() {
        return movieId;
    }



    public LocalDateTime getScreenAt() {
        return screenAt;
    }



    public int getPeople_count() {
        return people_count;
    }



    public String getCinema() {
        return cinema;
    }



    public String getTitle() {
        return title;
    }



    public int getRuntime() {
        return runtime;
    }



    public LocalDateTime getCreatedAt() {
        return createdAt;
    }



    public LocalDateTime getDeleteddAt() {
        return deleteddAt;
    }



    public int getStatus() {
        return status;
    }



    @Override
    public String toString() {
        return "ReservationDto [reservationId=" + reservationId + ", memberId=" + memberId
                + ", screenId=" + screenId + ", movieId=" + movieId + ", screenAt=" + screenAt
                + ", people_count=" + people_count + ", cinema=" + cinema + ", title=" + title
                + ", runtime=" + runtime + ", createdAt=" + createdAt + ", deleteddAt=" + deleteddAt
                + ", status=" + status + "]";
    }



}
