package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ReservationDao;

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


            int count = reservationDao.makeReservation(member_id, people_count, screenId);

            if (count > 0) {
                resp.sendRedirect(req.getContextPath() + "/mypage?param=reservation");
            } else {
                resp.sendRedirect(req.getContextPath() + "/reservation/reservationMsg.jsp");
            }


        }
    }
}
