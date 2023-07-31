package example;

import java.util.Date;

public class Ex13_Notice implements Board {
    @Override
    public void insert(int bno, String title, String content, Date resdate) {
        System.out.println("글번호 : "+bno);
        System.out.println("글제목 : "+title);
        System.out.println("글내용 : "+content);
        System.out.println("작성일 : "+resdate);
    }
    @Override
    public void select(int bno) {
        System.out.println("글번호 "+bno+"가 검색되었습니다.");
    }
    @Override
    public void update(int bno, String title, String content) {
        System.out.println("수정된 글번호 : "+bno); System.out.println("수정된 글제목 : "+title); System.out.println("수정된 글내용 : "+content);
    }
    @Override
    public void delete(int bno) {
        System.out.println("글번호 "+bno+"가 삭제되었습니다.");
    }
}
