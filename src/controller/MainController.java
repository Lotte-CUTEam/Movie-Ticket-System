package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 *
 * [시스템명]영화예매시스템
 *
 * [팀 명]CUTEam
 * 
 * -----------------------------------------------------------
 *
 * 수정일자 수정자 수정내용
 *
 * 2022.07.11 이성은 신규생성
 *
 * -----------------------------------------------------------
 */

@WebServlet("/main")
public class MainController extends HttpServlet {

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

    public void doProcess(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String id = req.getParameter("id");

        if (id == null)
            resp.sendRedirect("main.jsp");
        else
            resp.sendRedirect("main.jsp?id=" + id);
    }
}
