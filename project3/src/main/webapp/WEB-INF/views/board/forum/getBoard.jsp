<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.grownjoy.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.grownjoy.vo.*" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    String writer = (String) session.getAttribute("id");

    int cnt = 0;
    String sql = "";
    Board bd = new Board();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {

        // 공지사항 글 가져오는 쿼리문
        sql = "select * from boardList where bno = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            bd.setTitle(rs.getString("title"));
            bd.setContent(rs.getString("content"));
            bd.setAuthor(rs.getString("author"));
            bd.setName(rs.getString("name"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
        }

        rs.close();
        pstmt.close();

        if(!bd.getAuthor().equals(writer)) {
            // 조회수 증가 쿼리
            sql = "update board set cnt = cnt + 1 where bno = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            cnt = pstmt.executeUpdate();
            if (cnt > 0) {
                System.out.println("조회수 증가 성공");
            } else {
                System.out.println("조회수 증가 실패");
            }
            pstmt.close();
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        //conn.close();
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::자유게시판-상세보기</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>자유게시판</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="<%=headerPath%>/board/listNotice.jsp"> 커뮤니티 </a> &gt; <span> 자유게시판 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">자유게시판 상세보기</h2>
                <div class="board_detail">
                    <div class="board_detail_top">
                        <div class="detail_top1">
                            <h5 class="board_title">[자유게시판 제목]&emsp;<%=bd.getTitle() %></h5>
                            <p class="cnt">[조회수] <%=bd.getCnt() %></p>
                        </div>
                        <div>
                            <p class="writer"><%=bd.getName() %></p>
                            <p class="date"><%=bd.getResdate() %></p>
                        </div>
                    </div>
                    <div class="board_detail_con">
                        <%=bd.getContent() %>
                    </div>
                </div>
                <div class="btn_group">
                    <% if(sid != null && (sid.equals("admin") || sid.equals(bd.getAuthor()))) { %>
                    <a href="<%=headerPath%>/board/modifyBoard.jsp?bno=<%=bno %>" class="inBtn inBtn1">자유게시판 수정</a>
                    <a href="<%=headerPath%>/board/removeBoardPro.jsp?bno=<%=bno %>&author=<%=bd.getAuthor() %>&type=2" class="inBtn inBtn2">자유게시판 삭제</a>
                    <% } %>
                    <a href="<%=headerPath%>/board/listBoard.jsp" class="inBtn inBtn1">자유게시판 목록</a>
                </div>
                <%@include file="../dat/datList.jsp"%>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>