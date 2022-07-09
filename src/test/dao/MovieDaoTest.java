package test.dao;

import dao.MovieDao;
import dto.MovieDto;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀   명]CUTEam
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       권나연         신규생성
 * -----------------------------------------------------------
 */

public class MovieDaoTest {

    MovieDao movieDao = MovieDao.getInstance();

    String pattern = "yyyy-MM-dd HH:mm:ss";
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);

    @DisplayName("영화 목록 조회 - 리스트 널 체크")
    @Test
    void getMovies() {
        // given

        // when
        List<MovieDto> movies = movieDao.getMovies();

        // then
        Assertions.assertNotNull(movies);
        movies.forEach(System.out::println);
    }

    @DisplayName("아이디 기반 영화 조회")
    @Test
    void getMovie() {
        // given
        Long movieId = 1L;

        MovieDto movieDto = new MovieDto(movieId, "토르-러브 앤 썬더", "타이카 와이티티", "크리스 헴스워스, "
            + "나탈리 포트만, 테사 톰슨, 크리스찬 베일, 타이카 와이티티", LocalDateTime.parse("2022-07-06 00:00:00", formatter),
            "7.8", 119,
            "https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202207/18748_103_1.jpg",
            "호러", 15);

        // when
        MovieDto findMovieDto = movieDao.getMovie(movieId);

        // then
        Assertions.assertEquals(movieDto, findMovieDto);
    }

    @DisplayName("영화 이름 목록 조회")
    @Test
    void getMovieNames() {
        // given

        // when
        List<MovieDto> movieNames = movieDao.getMovieNames();

        // then
        Assertions.assertNotNull(movieNames);
        movieNames.forEach(System.out::println);
    }

    @DisplayName("영화 평점 TOP5 조회")
    @Test
    void getMoviesScreeningRatingTop5() {
        // given

        // when
        List<MovieDto> movies = movieDao.getMoviesScreeningRatingTop5();

        // then
        Assertions.assertNotNull(movies);
        movies.forEach(System.out::println);
    }

    @DisplayName("영화 최신작 TOP5 조회")
    @Test
    void getMoviesLatestScreeningTop5() {
        // given

        // when
        List<MovieDto> movies = movieDao.getMoviesLatestScreeningTop5();

        // then
        Assertions.assertNotNull(movies);
        movies.forEach(System.out::println);
    }
}
