package dto;

public class MemberDto {
    private int id;
    private String pwd;
    private String name;
    private String email;

    public int getId() {
        return id;
    }

    public String getPwd() {
        return pwd;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public MemberDto(int id, String pwd, String name, String email) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
    }
}
