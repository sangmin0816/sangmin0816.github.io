package example;

import java.util.Date;

public interface Board {
    public void insert(int bno, String title, String content, Date resdate);
    public void select(int bno);
    public void update(int bno, String title, String content);
    public void delete(int bno);
}
