package dto;

import java.util.List;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 *
 * [시스템명]영화예매시스템
 *
 * [팀   명]CUTEam -----------------------------------------------------------
 *
 * 수정일자           수정자         수정내용
 *
 * 2022.07.11       권나연         신규생성
 *
 * -----------------------------------------------------------
 */
public class AllMovieDto {

    private String searchCategory;

    private String search;

    private int pageCnt;

    private int pageNo;

    private List<MovieDto> movies;

    public AllMovieDto(String searchCategory, String search, int pageCnt, int pageNo,
        List<MovieDto> movies) {
        this.searchCategory = searchCategory;
        this.search = search;
        this.pageCnt = pageCnt;
        this.pageNo = pageNo;
        this.movies = movies;
    }
}
