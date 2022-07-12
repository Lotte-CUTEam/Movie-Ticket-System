package controller;

import dao.MovieDao;
import dto.MovieDto;
import dto.ReservationDto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ReservationDao;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]ReservationController.java
 * -----------------------------------------------------------
 * 수정일자           수정자       수정내용
 * 2022.07.11       장혜원       신규생성
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
            // 영화 리스트
            /*String member_id = req.getParameter("member_id");
            int people_count = Integer.parseInt(req.getParameter("people_count"));
            Long screenId = Long.parseLong(req.getParameter("screen_id"));

            System.out.println("");
            int count = reservationDao.makeReservation(member_id, screenId, people_count);

            if (count > 0) {
                resp.sendRedirect("util/message.jsp?param=reservation&msg=bookingSuccess");
            } else {
                resp.sendRedirect("util/message.jsp?param=reservation&msg=bookingFail");

            }*/

            resp.sendRedirect(req.getContextPath() + "/reservation/reservation.jsp");

        }
        // 결제하기 버튼을 누르면 예매 완료, reservation 데이터 DB insert
        else if(param.equals("success")) {

            String memberId = req.getParameter("member_id");
            Long screenId = Long.parseLong(req.getParameter("screen_id"));
            Long movieId = Long.parseLong(req.getParameter("movie_id"));

            int personCount = Integer.parseInt(req.getParameter("people_count"));
            //int price = Integer.parseInt(req.getParameter("price"));

            // 예매 데이터 insert
            int count = reservationDao.makeReservation(memberId, screenId, personCount);

            System.out.println(count + "!!!!!!!!!!!!!!!!!!!!!!1");
            // 아이디 값 전달을 위한 예매ID 조회
            Long insertDataId = reservationDao.getReservationId(memberId, screenId);

            System.out.println(insertDataId + " #########################");

            if (count > 0) {
                resp.sendRedirect("util/message.jsp?param=reservation&msg=bookingSuccess&reservation_id=" + insertDataId + "&movie_id=" + movieId);
            } else {
                resp.sendRedirect("util/message.jsp?param=reservation&msg=bookingFail");
            }
        }

        else if(param.equals("reservationDetail")) {

            Long reservationId = Long.parseLong(req.getParameter("reservation_id"));
            Long movieId = Long.parseLong(req.getParameter("movie_id"));

            ReservationDto dto = reservationDao.getReservation(reservationId);
            MovieDto movieDto = movieDao.getMovie(movieId);

            if(dto == null) {
                String msg = "reservationDetail FAIL";
                resp.sendRedirect("message.jsp?msg=" + msg);
            }

            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");

            req.setAttribute("reservation", dto);
            req.setAttribute("movie", movieDto);
            req.getRequestDispatcher(req.getContextPath() + "/reservation/reservationDetail.jsp").forward(req, resp);

        }


    }
}
