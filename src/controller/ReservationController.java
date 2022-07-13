package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MovieDao;
import dao.ReservationDao;
import dto.MovieDto;
import dto.ReservationDto;
import org.json.simple.JSONObject;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]ReservationController.java
 * -----------------------------------------------------------
 * 수정일자             수정자                 수정내용
 * 2022.07.11         장혜원                  신규생성
 * 2022.07.12         안채영                  기능추가
 * -----------------------------------------------------------
 */
@WebServlet("/reservation")
public class ReservationController extends HttpServlet {

    private ReservationDao reservationDao = ReservationDao.getInstance();
    private MovieDao movieDao = MovieDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doProcess(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doProcess(req, resp);
    }

    //
    public void doProcess(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        req.setCharacterEncoding("utf-8");
        String param = req.getParameter("param");

        if (param.equals("reservation")) {
            resp.sendRedirect(req.getContextPath() + "/reservation/reservation.jsp");

        }
        // 결제하기 버튼을 누르면 예매 완료, reservation 데이터 DB insert
        else if (param.equals("success")) {

            System.out.println("[memberId] : " + req.getParameter("member_id"));
            System.out.println("[screenId] : " + req.getParameter("screen_id"));
            System.out.println("[movieId] : " + req.getParameter("movie_id"));

            String memberId = req.getParameter("member_id");
            Long screenId = Long.parseLong(req.getParameter("screen_id"));
            Long movieId = Long.parseLong(req.getParameter("movie_id"));

            int personCount = Integer.parseInt(req.getParameter("people_count"));

            // 예매 데이터 insert
            int count = reservationDao.makeReservation(memberId, screenId, personCount);

            // 아이디 값 전달을 위한 예매ID 조회
            Long reservationId = reservationDao.getReservationId(memberId, screenId);

            if (count > 0) {
                resp.sendRedirect(
                        "/util/message.jsp?param=reservation&msg=bookingSuccess&reservation_id="
                                + reservationId + "&movie_id=" + movieId);

            } else {
                resp.sendRedirect("/util/message.jsp?param=reservation&msg=bookingFail");
            }
        }

        else if (param.equals("reservationDetail")) {

            Long reservationId = Long.parseLong(req.getParameter("reservation_id"));
            Long movieId = Long.parseLong(req.getParameter("movie_id"));

            ReservationDto dto = reservationDao.getReservation(reservationId);
            MovieDto movieDto = movieDao.getMovie(movieId);

            if (dto == null) {
                String msg = "reservationDetail FAIL";
                resp.sendRedirect("message.jsp?msg=" + msg);
            }

            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");

            req.setAttribute("reservation", dto);
            req.setAttribute("movie", movieDto);
            req.getRequestDispatcher("/reservation/reservationDetail.jsp")
                    .forward(req, resp);

        }


    }
}
