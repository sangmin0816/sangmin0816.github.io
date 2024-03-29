<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.grownjoy.db.*" %>
<%@ page import="com.grownjoy.dto.*" %>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%@ include file="/encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    //3. DB연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. sql 실행 및 실행결과 받기
    String sql = "SELECT * FROM qna WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    //5. 실행결과(ResultSet) 인 해당 Qna 1건 qna(질문및답변) 객체에 넣기
    rs = pstmt.executeQuery();
    Qna qna = new Qna();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setSecret(rs.getBoolean("secret"));
    }

    String sel = "";
    if(qna.getLev()==0){
        sel = "질문";
    } else {
        sel = "답변";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::관리자페이지-<%=sel %> 수정</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="/admin/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2><%=sel %> 글 수정보기</h2>
        <form action="<%=headPath%>/admin/qnaUpdatePro.jsp" method="post">
            <table class="table tb2" id="myTable">
                <tbody>
                <!-- 6. 해당 글번호에 대한 글 상세내용 출력 -->
                <tr>
                    <th>유형</th>
                    <td>
                        <% if(qna.getLev()==0) { %>
                        <span>질문</span>
                        <% } else { %>
                        <span>답변</span>
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <th>글 제목</th>
                    <td>
                        <input type="text" name="title" id="title" class="inData" maxlength="98" value="<%=qna.getTitle() %>" required>
                        <input type="hidden" name="author" id="author" value="<%=qna.getAuthor() %>">
                        <input type="hidden" name="qno" id="qno" value="<%=qna.getQno() %>">
                    </td>
                </tr>
                <tr>
                    <th>글 내용</th>
                    <td><textarea cols="80" rows="10" name="content" id="content" class="indata2" maxlength="990"><%=qna.getContent() %></textarea></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>
                        <span><%=qna.getAuthor() %></span>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn_group">
                <a href="<%=headPath%>/admin/qnaList.jsp" class="inBtn inBtn1">목록</a>
                <input type="submit" class="inBtn inBtn2" value="<%=sel %> 수정하기">
            </div>
        </form>
    </div>
</div>
</body>
</html>