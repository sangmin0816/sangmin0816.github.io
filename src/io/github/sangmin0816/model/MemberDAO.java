package io.github.sangmin0816.model;

import io.github.sangmin0816.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public MemberDAO() {
  }

  public List<Member> getMemberList(){
    conn = db.connect();
    List<Member> memberList = new ArrayList<>();
    String sql = "select * from member";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){

      }

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return memberList;
  }

  public Member getMember(String id){
    conn = db.connect();
    Member member = new Member();

    String sql = "select * from notice where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      rs = pstmt.executeQuery();

      if(rs.next()){
        
      }

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return member;
  }

  public int addMember(Member member){
    int cnt = 0;

    conn = db.connect();
    String sql = "insert into ";

    try {
      pstmt = conn.prepareStatement(sql);



      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }


}
