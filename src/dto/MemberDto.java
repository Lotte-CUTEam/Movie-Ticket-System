package dto;

/**
 * [프로젝트]롯데e커머스_자바전문가과정 
 * [시스템명]영화예매시스템 
 * [팀 명]CUTEam
 * [파일명]MemberDto.java
 * ----------------------------------------------------------- 
 * 수정일자           수정자           수정내용
 * 2022.07.08       이충현           신규생성
 * -----------------------------------------------------------
 */
public class MemberDto {
  private String id;
  private String pwd;
  private String name;
  private String email;

  private String phoneNumber;

  public String getId() {
    return id;
  }

  public String getPwd() {
    return pwd;
  }

  public String getName() {
    return name;
  }

  public String getPhoneNumber() {
    return phoneNumber;
  }


  public String getEmail() {
    return email;
  }

  /**
   * MemberDto
   *
   * @param id
   * @param pwd
   * @param name
   * @param email
   */
  public MemberDto(String id, String pwd, String name, String email, String phoneNumber) {
    this.id = id;
    this.pwd = pwd;
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
  }

  public void setId(String id) {
    this.id = id;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

}
