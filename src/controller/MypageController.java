package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ReservationDao;
import dto.ReservationDto;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템 
 * [팀 명]CUTEam 
 * [파일명]MypageController.java
 * -----------------------------------------------------------
 * 수정일자           수정자       수정내용 
 * 2022.07.09       정은우       신규생성
 * -----------------------------------------------------------
 */
@WebServlet("/mypage")
public class MypageController extends HttpServlet {

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

    /***
     * Mypage Controller
     * 
     * @param req
     * @param resp
     * @throws IOException
     * @throws ServletException 
     */
    public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException,
            ServletException {
        req.setCharacterEncoding("utf-8");

        String param = req.getParameter("param");

        if (param.equals("mypage")) {
            resp.sendRedirect(req.getContextPath() + "/mypage/myPageBf.jsp");
        } else if (param.equals("showMypage")) {
            // parameter
            // get memberId
            String memberId = req.getParameter("memberId");
            if (memberId == null || memberId.equals("")) {

                resp.sendRedirect("util/message.jsp?param=mypage&msg=url");
                return;
                //memberId = "hyewon"; //TODO
            }

            ReservationDao resvDao = ReservationDao.getInstance();
            List<ReservationDto> resvList = resvDao.getReservations(memberId);
            req.setAttribute("resvList", resvList);

            forward("mypage/myPage.jsp", req, resp);
        } else if (param.equals("detail")) {
            // parameter
            // get memberId
            String memberId = req.getParameter("memberId");
            if (memberId == null || memberId.equals("")) {

                resp.sendRedirect("util/message.jsp?param=mypage&msg=url");
                return;
                //memberId = "hyewon"; //TODO
            }
            // get resvId
            String sSeq = req.getParameter("resvId");
            int resvId = 0;
            if (sSeq != null && !sSeq.equals("")) {
                resvId = Integer.parseInt(sSeq);
            }

            ReservationDao resvDao = ReservationDao.getInstance();
            ReservationDto resvDto = resvDao.getReservation(resvId);

            req.setAttribute("resvDto", resvDto);

            forward("mypage/reservationDetail.jsp", req, resp);

        } else if (param.equals("deleteResv")) {
            // parameter
            // get memberId
            String memberId = req.getParameter("memberId");
            if (memberId == null || memberId.equals("")) {

                resp.sendRedirect(req.getContextPath()
                        + "/util/message.jsp?param=mypage&msg=url");
                return;
                //memberId = "hyewon"; //TODO
            }
            // get resvId
            String sSeq = req.getParameter("resvId");
            int resvId = 0;
            
            if (sSeq != null && !sSeq.equals("")) {
                resvId = Integer.parseInt(sSeq);
            }

            ReservationDao resvDao = ReservationDao.getInstance();
            int ret = resvDao.deleteReservation(memberId, resvId);
            if (ret > 0) {
                resp.sendRedirect("mypage?param=showMypage&memberId=" + memberId);
            } else {
                resp.sendRedirect("util/message.jsp?param=mypage&msg=deletefail");
            }
            
        } else {

            resp.sendRedirect("util/message.jsp?param=mypage&msg=url");
        }

    }

    public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher dispatch = req.getRequestDispatcher(arg);
        dispatch.forward(req, resp);
    }


}
