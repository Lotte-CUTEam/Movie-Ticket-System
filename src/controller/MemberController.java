package controller;

import dao.MemberDao;
import dto.MemberDto;
import net.sf.json.JSONObject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * [프로젝트]롯데e커머스_자바전문가과정 
 * [시스템명]영화예매시스템 
 * [팀 명]CUTEam
 * ----------------------------------------------------------- 
 * 수정일자 수정자 수정내용 2022.07.08 이충현 신규생성
 * -----------------------------------------------------------
 */
public class MemberController extends HttpServlet {


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
   * Contriller
   * 
   * @param req
   * @param resp
   * @throws IOException
   */
  public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    req.setCharacterEncoding("utf-8");

    String param = req.getParameter("param");

    if (param.equals("login")) {
      resp.sendRedirect("member/login.jsp");
    } else if (param.equals("regi")) {
      resp.sendRedirect("member/regi.jsp");
    } else if (param.equals("idcheck")) {
      String id = req.getParameter("id");
      System.out.println("id:" + id);

      MemberDao dao = MemberDao.getInstance();
      boolean b = dao.getId(id);

      String str = "NO";
      if (b == false) {
        str = "YES";
      }


      JSONObject obj = new JSONObject();
      obj.put("msg", str); // 짐싸!

      resp.setContentType("application/x-json; charset=utf-8");
      resp.getWriter().print(obj);
    } else if (param.equals("regiAf")) {

      String id = req.getParameter("id");
      String pwd = req.getParameter("pwd");
      String name = req.getParameter("name");
      String email = req.getParameter("email");
      String phoneNumber = req.getParameter("phoneNumber");
      MemberDao dao = MemberDao.getInstance();
      boolean b = dao.addMember(new MemberDto(id, pwd, name, email, phoneNumber));

      String msg = "OK";
      if (b == false) {
        msg = "NO";
      }

      resp.sendRedirect("message.jsp?msg=" + msg);
    } else if (param.equals("loginAf")) {

      String id = req.getParameter("id");
      String pwd = req.getParameter("pwd");

      MemberDao dao = MemberDao.getInstance();
      MemberDto dto = dao.login(new MemberDto(id, pwd, null, null, null));

      if (dto != null) {
        req.getSession().setAttribute("login", dto);
        /*********
         *
         *
         * 수! 정! 필! 요!
         *
         *
         *
         */
        resp.sendRedirect("bbs?param=bbslist");
      }
    }
  }
}


