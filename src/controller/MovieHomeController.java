package controller;

import dao.MovieDao;
import dto.MovieDto;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
 * [팀   명]CUTEam -----------------------------------------------------------
 *
 * 수정일자           수정자         수정내용
 *
 * 2022.07.08       권나연         신규생성
 *
 * 2022.07.11       권나연         URL Path 수정 및 요청 처리 방식 변경
 *
 * -----------------------------------------------------------
 */

@WebServlet("/movies")
public class MovieHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
//        req.setCharacterEncoding("utf-8");

        forward("/movie/movieList.jsp", req, resp);
    }

    public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        RequestDispatcher dispatch = req.getRequestDispatcher(arg);
        dispatch.forward(req, resp);
    }
}

