package test.dao;

import java.util.List;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import dao.ReservationDao;
import dto.ReservationDto;

public class ReservationDaoTest {

    ReservationDao rdao = ReservationDao.getInstance();

    @DisplayName("사용자 전체 예매 내역 출력")
    @Test
    void getReservations() {

        // id로 전체조회
        // given
        String id = "hyewon";
        List<ReservationDto> reservations = rdao.getReservations(id);

        ReservationDto dto = reservations.get(0);


        // then
        Assertions.assertEquals(dto.getTitle(), "토르: 러브 앤 썬더");

        Assertions.assertEquals(dto.getCinema(), "서울/건대입구");

        Assertions.assertEquals(6, reservations.size());
    }

    @DisplayName("사용자 예매 취소 내역 출력")
    @Test
    void getCancledReservations() {

        // id로 전체조회
        // given
        String id = "hyewon";

        // 6개월 이내 취소내역 조회
        List<ReservationDto> reservations = rdao.getReservations(id, 6, 0);

        ReservationDto dto = reservations.get(0);

        // then
        Assertions.assertEquals(dto.getTitle(), "토르: 러브 앤 썬더");

        Assertions.assertEquals(dto.getCinema(), "서울/건대입구");

        Assertions.assertEquals(1, reservations.size());

        Assertions.assertEquals(1, dto.getStatus());

    }


    @DisplayName("사용자 예매 상세 내역 출력")
    @Test
    void getCancledReservation() {

        // id로 전체조회
        // given
        String id = "hyewon";
        long reservation_id = 2;

        // 상세내역

        ReservationDto dto = rdao.getReservation(id, reservation_id);

        // then
        Assertions.assertEquals(dto.getTitle(), "토르: 러브 앤 썬더");

        Assertions.assertEquals(dto.getCinema(), "서울/건대입구");


    }
}
