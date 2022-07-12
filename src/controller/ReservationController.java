package controller;

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
            String member_id = req.getParameter("member_id");
            int people_count = Integer.parseInt(req.getParameter("people_count"));
            long screenId = Long.parseLong(req.getParameter("screen_id"));

            System.out.println("");
            int count = reservationDao.makeReservation(member_id, people_count, screenId);

            if (count > 0) {
                resp.sendRedirect("util/message.jsp?param=reservation&msg=bookingSuccess");
            } else {
                resp.sendRedirect("util/message.jsp?param=reservation&msg=bookingFail");

            }



        }
    }
}
