package example;

import java.util.Date;

public class Ex10_Member {
    private String name;
    private String id;
    private String pw;
    private String email;
    private String tel;
    private Date regdate;
    private int point;

    public Ex10_Member() { }
    public Ex10_Member(String name, String id, String pw, String email, String tel, Date regdate, int point) {
        this.name = name; this.id = id; this.pw = pw; this.email = email; this.tel = tel; this.regdate = regdate; this.point = point;
    }
    public String getName() { return name;
    }
    public void setName(String name) { this.name = name;
    }
    public String getId() { return id;
    }
    public void setId(String id) { this.id = id;
    }
    public String getPw() { return pw;
    }
    public void setPw(String pw) { this.pw = pw;
    }
    public String getEmail() { return email;
    }
    public void setEmail(String email) { this.email = email;
    }
    public String getTel() { return tel;
    }
    public void setTel(String tel) { this.tel = tel;
    }
    public Date getRegdate() { return regdate;
    }
    public void setRegdate(Date regdate) { this.regdate = regdate;
    }
    public int getPoint() { return point;
    }
    public void setPoint(int point) { this.point = point;
    }
}
