package dto;

import java.util.List;

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
