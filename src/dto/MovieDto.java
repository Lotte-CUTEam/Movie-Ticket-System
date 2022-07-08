package dto;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀   명]CUTEam
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       권나연         신규생성
 * -----------------------------------------------------------
 */

public class MovieDto {

    private Long movieId; // 아이디 [식별자]

    private String title; // 제목

    private String director; // 감독

    private String actor; // 주연

    private LocalDateTime openingDate; // 개봉일

    private String rating; // 평점

    private Integer runtime; // 러닝타임

    private String imageUrl; // 포스터 이미지 URL

    private String genre; // 장르

    private Integer rated; // 관람 등급

    /* [조회] 영화 데이터 from 데이터베이스  */
    /* [전송] 영화 상세정보 */
    public MovieDto(Long movieId, String title, String director, String actor,
        LocalDateTime openingDate, String rating, Integer runtime, String imageUrl,
        String genre, Integer rated) {
        this.movieId = movieId;
        this.title = title;
        this.director = director;
        this.actor = actor;
        this.openingDate = openingDate;
        this.rating = rating;
        this.runtime = runtime;
        this.imageUrl = imageUrl;
        this.genre = genre;
        this.rated = rated;
    }

    /* [저장] 크롤링 데이터 to 데이터베이스 */
    public MovieDto(String title, String director, String actor, LocalDateTime openingDate,
        String rating, Integer runtime, String imageUrl, String genre, Integer rated) {
        this.title = title;
        this.director = director;
        this.actor = actor;
        this.openingDate = openingDate;
        this.rating = rating;
        this.runtime = runtime;
        this.imageUrl = imageUrl;
        this.genre = genre;
        this.rated = rated;
    }

    /* [전송] 영화 목록 */
    public MovieDto(Long movieId, String title, String rating, String imageUrl, Integer rated) {
        this.movieId = movieId;
        this.title = title;
        this.rating = rating;
        this.imageUrl = imageUrl;
        this.rated = rated;
    }

    @Override
    public String toString() {
        return "MovieDto{" +
            "movieId=" + movieId +
            ", title='" + title + '\'' +
            ", director='" + director + '\'' +
            ", actor='" + actor + '\'' +
            ", openingDate=" + openingDate +
            ", rating='" + rating + '\'' +
            ", runtime=" + runtime +
            ", imageUrl='" + imageUrl + '\'' +
            ", genre='" + genre + '\'' +
            ", rated=" + rated +
            '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MovieDto movieDto = (MovieDto) o;
        return movieId.equals(movieDto.movieId) && title.equals(movieDto.title) && director.equals(
            movieDto.director) && Objects.equals(actor, movieDto.actor)
            && Objects.equals(openingDate, movieDto.openingDate) && Objects.equals(
            rating, movieDto.rating) && Objects.equals(runtime, movieDto.runtime)
            && Objects.equals(imageUrl, movieDto.imageUrl) && Objects.equals(genre,
            movieDto.genre) && rated.equals(movieDto.rated);
    }

    @Override
    public int hashCode() {
        return Objects.hash(movieId, title, director, actor, openingDate, rating, runtime, imageUrl,
            genre, rated);
    }
}

