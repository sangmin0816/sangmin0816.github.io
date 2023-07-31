package example;

import java.util.*;

class Board2{
    private String title;
    private String content;

    public Board2(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }
}

public class Ex17_BoardList {

    public static void main(String[] args) {
        List<Board2> list = new ArrayList<>();
        for(int i=0;i<10;i++) {
            Board2 bd = new Board2("제목"+i,"내용"+i);
            list.add(bd);
    }
    }
}
