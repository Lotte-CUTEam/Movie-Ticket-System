package dto;


/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]MovieScreenDto.java
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       장혜원         신규생성
 * -----------------------------------------------------------
 */ 

public class MovieScreenDto {

    private MovieDto movieDto;
    private ScreenDto screenDto;

    public MovieScreenDto(MovieDto movieDto, ScreenDto screenDto) {
        this.movieDto = movieDto;
        this.screenDto = screenDto;
    }

    public MovieDto getMovieDto() {
        return movieDto;
    }


    public ScreenDto getScreenDto() {
        return screenDto;
    }



}
