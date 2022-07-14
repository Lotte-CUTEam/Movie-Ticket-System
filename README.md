# README.md

---

# 0. CUTE CINEMA

![01_logo.png](/readme_img/01_logo.png)

롯데 시네마 클론코딩 - JSP를 이용한 영화 예매 기능 프론트엔드&백엔드 클론코딩

# 1. 팀 소개

| 팀원 | 권나연 | 안채영 | 이성은 | 이충현 | 장혜원 | 정은우 |
| --- | --- | --- | --- | --- | --- | --- |
| 맡은 작업 | 영화 목록페이지 기능 구현, RDS 연동 | 영화 상세페이지 기능 구현, 예약완료 페이지 기능 구현, ERD 제작 | 메인페이지, 공통 화면 소스(header, footer, etc), 로고 | 로그인, 회원가입 기능 구현, Slack과 Github 연동, DB관리 | 예약기능 및 페이지 구현및 DB 데이터 관리 | 마이페이지(예약목록, 예약확인, 예약취소)기능 구현 |
| 깃 주소 | [hellonayeon](https://github.com/hellonayeon/movie-ticket) | [hellochaeyoung](https://github.com/hellochaeyoung) | [lse99](https://github.com/lse99) | [chungchung234](https://github.com/chungchung234) | [IMHYEWON](https://github.com/IMHYEWON) | [juneu1509](https://github.com/juneu1509) |

# 2. 팀 협업 방식

## Git & Github

Git을 사용해 프로젝트의 형상을 관리를 하고 Github을 통해 팀원들과 각자의 버전을 공유했습니다.

- Github 주소
    - [https://github.com/Lotte-CUTEam/Movie-Ticket-System](https://github.com/Lotte-CUTEam/Movie-Ticket-System)
- Default 브랜치인 dev 브랜치로부터 각자 브랜치를 생성해 맡은 기능 구현을 진행했습니다.

![02_branch01.png](/readme_img/02_branch01.png)

![03_branch02.png](/readme_img/03_branch02.png)

- Github의 Issue와 Milestone, Project 기능을 사용해 작업 현황을 공유했습니다.

![04_commit.png](/readme_img/04_commit.png)

![05_issue.png](/readme_img/05_issue.png)

![06_git_project.png](/readme_img/06_git_project.png)

## Slack

Slack과 Github을 연동해 원격 브랜치에 업데이트가 발생하면 Slack에서 확인 가능하도록 설정했습니다.

![07_slack_git.png](/readme_img/07_slack_git.png)

## Notion

Notion을 이용해 협업에 필요한 문서들을 공유했습니다.

![07_notion.png](/readme_img/07_notion.png)

# 3. 주요 기능 소개

## 3.1. 사용 툴

- Java : 18
- MySQL : 8.0.29
- Servlet
- Html, CSS, JQuery : 3.6.0.min
- gson : 2.2.2 / json-simple : 1.1.1
- Github, Notion

## 3.2. 화면 구성

### 3.2.1. 메인화면

![08_main01.gif](/readme_img/08_main01.gif)

![09_main02.png](/readme_img/09_main02.png)

### 3.2.2. 회원가입 및 로그인

- 로그인 전 메뉴
    - `회원가입` `로그인` 메뉴 활성화

    ![10_main_menu01.png](/readme_img/10_main_menu01.png)


- 로그인 후 메뉴
    - `마이페이지` `로그아웃` 메뉴 활성화

    ![11_main_menu02.png](/readme_img/11_main_menu02.png)


- 회원가입 화면
각 항목별로 유효성 검사 진행

    ![12_regi01.gif](/readme_img/12_regi01.gif)

    아이디 중복체크

    전체 항목 미기입시 회원가입 불가

    ![13_regi02.png](/readme_img/13_regi02.png)

- 로그인 화면
 쿠키에 아이디 저장

    ![14_login.png](/readme_img/14_login.png)


### 3.2.3. 영화 목록

- 영화 목록 메뉴

    ![15_main_menu03.png](/readme_img/15_main_menu03.png)


- 영화 목록 화면
    - `모든 영화` `평점 TOP5` `최신순 TOP5` 영화 목록

![16_movie_list01.png](/readme_img/16_movie_list01.png)

![17_movie_list02.png](/readme_img/17_movie_list02.png)

- 영화 포스터 하단 `페이지 번호` 로 영화 목록 확인

![18_movie_list03.png](/readme_img/18_movie_list03.png)

![19_movie_list04.png](/readme_img/19_movie_list04.png)

- 영화 검색 화면
    - `제목` `감독` `배우` 로 영화 검색

    ![20_movie_list05.png](/readme_img/20_movie_list05.png)


- 영화 목록 조회 필터
    - `평점순` `최신순` 으로 영화 목록 조회

![21_movie_list06.png](/readme_img/21_movie_list06.png)

### 3.2.4. 영화 소개

- 영화 포스터에서 `상세정보` 클릭 시 영화 소개 페이지로 이동

    ![22_movie_list07.png](/readme_img/22_movie_list07.png)


- 영화 소개 페이지에서 `예매하기` 클릭 시 예매 페이지로 이동

![23_movie_detail.png](/readme_img/23_movie_detail.png)

### 3.2.5. 영화 예매

- `예매` 클릭시 영화 예매 페이지로 이동

![24_reservation01.png](/readme_img/24_reservation01.png)

- `지역`, `영화관`, `영화`, `상영시간` 선택시 인원 선택 화면으로 이동
    - 비동기 통신으로 지역&영화관, 영화 선택에 따른 상영 타임 테이블 정보 조회

![25_reservation02.png](/readme_img/25_reservation02.png)

- 인원 선택 후 결제
    - 인원에 따른 가격 확인 가능

    ![26_reservation03.png](/readme_img/26_reservation03.png)

- 결제 후 예약 완료 페이지 이동
    - 예약된 정보 (영화 , 상영, 인원 수 정보) 확인

    ![27_reservation04.png](/readme_img/27_reservation04.png)


### 3.2.6. 마이페이지

- 마이 페이지 메뉴

    ![28_mypage01.png](/readme_img/28_mypage01.png)


- 마이페이지
    - 예매한 영화 내역 확인 가능(상영일, 결제일 순 정렬)
    - `상세정보보기` 클릭 시 예매, 취소한 상세 내역 확인
    - `예매하기 Quick Bar` 클릭 시 예매 페이지로 이동

        ![29_mypage02.png](/readme_img/29_mypage02.png)

- 예매 상세 내역 페이지
    - `결제내역` 클릭 시 마이페이지로 이동해 모든 예매정보 확인
    - 예매 내역

        ![30_mypage_detail01.png](/readme_img/30_mypage_detail01.png)


    - 취소 내역

        ![31_mypage_detail02.png](/readme_img/31_mypage_detail02.png)


# 4. 제작과정

## 4.1. 제작 스케줄

|  | 2022.07.06 | 2022.07.07 | 2022.07.08 | 2022.07.09 | 2022.07.11 | 2022.07.12 |
| --- | --- | --- | --- | --- | --- | --- |
|   요구사항 정의 |         🙌 |  |  |  |  |  |
|    기획 및 설계 |         🙌 |         🙌 |  |  |  |  |
|  개발 환경 구성 |  |         🙌 |  |  |  |  |
|      기능 구현 |  |  |         🙌 |         🙌 |         🙌 |  |
|        테스트 |  |  |         🙌 |         🙌 |         🙌 |         🙌 |
|      문서 정리 |  |  |  |  |  |         🙌 |

### 2022.07.06

- 요구사항 정의 및 설계 진행
- 회의록 : [https://www.notion.so/jungew1509/20220706-f48a260a5a6b4f4e8541c4d3640ff121](https://www.notion.so/20220706-f48a260a5a6b4f4e8541c4d3640ff121)

### 2022.07.07

- 협업 및 형상 관리를 위한 github organization 및 repository 생성
    - CUTEAM 만의 Github 사용 약속 정하기
        - Pull Request, Commit 컨벤션
        - 기능 별 branch 생성
        - Issue 및 MileStone 생성
        - 다양한 개발 환경(Mac, Windows, Intellij, Eclipse, JAVA 등)에 의한 .gitignore 설정
- ERD 구현
    - Member, Movie, Screen, Reservation
    - 총 4개의 테이블로 ERD를 최종 구성
- 담당 기능 배정
- 회의록 : [https://www.notion.so/jungew1509/20220707-2af94f5e1ed24291a655fd8380d1245e](https://www.notion.so/20220707-2af94f5e1ed24291a655fd8380d1245e)

### 2022.07.08

- 09:00, 19:00 진행 상황 공유를 위한 회의 진행
- 회의록 : [https://www.notion.so/jungew1509/20220708-3d0b6761f43749498f6048226dbea0bf](https://www.notion.so/20220708-3d0b6761f43749498f6048226dbea0bf)

### 2022.07.09

- 09:00, 14:00 : 진행 상황 공유를 위한 회의 진행
- 팀원 각자 담당 기능 자유롭게 구현 작업 진행
- 회의록 : [https://www.notion.so/jungew1509/20220709-b8db7d19989f47b9be6cad00d578af97](https://www.notion.so/20220709-b8db7d19989f47b9be6cad00d578af97)

### 2022.07.11

- 09:00, 19:00 : 진행 상황 공유를 위한 회의 진행
- 담당 기능 구현 마무리 작업 진행
- 프로젝트 완성을 위한 공동 작업 계획 수립 진행
- 회의록 : [https://www.notion.so/jungew1509/20220711-1f1b9c5222bc43cabcc112a3d850dbdd](https://www.notion.so/20220711-1f1b9c5222bc43cabcc112a3d850dbdd)

### 2022.07.12

- 09:00, 17:00 : 진행 상황 공유를 위한 회의 진행
- 담당 기능 구현 마무리 작업 진행
- 회의록 : [https://www.notion.so/jungew1509/20220712-50cc3f57225f409bb73c6815ddac6af4](https://www.notion.so/20220712-50cc3f57225f409bb73c6815ddac6af4)

## 4.2. 설계

### 4.2.1. Github

- Github를 이용하여 Organization을 제작하여 소스를 공유 및 버전관리
    - 주소 : [https://github.com/Lotte-CUTEam/Movie-Ticket-System](https://github.com/Lotte-CUTEam/Movie-Ticket-System)
- 팀 회의를 통해 Github 사용방법을 정의

![32_github.png](/readme_img/32_github.png)

Github Organization의 Repository를 활용한 모습

![33_notion.png](/readme_img/33_notion.png)

협의를 통해 git convention 정의

### 4.2.2. 코드 작성 요령

파일 제작 시 수정사항을 위하여 파일명, 주석, 코드스타일을 정의하고 사용했다.

![34_convention.png](/readme_img/34_convention.png)

### 4.2.3. ****Entity Relationship Diagram****

![35_erd.png](/readme_img/35_erd.png)

## 4.3.디렉토리 구조

프런트엔드 파트의 경우 WebContent를 이용하여 페이지 별로 디렉토리를 구분했다.

메인화면 혹은 공통 부분 화면의 경우 루트에 위치한다.

백엔드 파트의 경우 기능별로 디렉토리를 구분했다.

![36_directory.png](/readme_img/36_directory.png)

# 5. 회고

- 🦁 은우
    - Linked
        - 프로젝트 본격적으로 개발하기 전부터 각자 맡은일을 체계적으로 잘한 것 같다. 깃 사용법을 각자 분업하여 조사해서 알려주고 계획한대로 깃을 잘 사용한 점이 너무 좋았다.
    - learned
        - default branch를 적용의 중요성을 알게되었다. 푸쉬를 하기전 풀먼저 하고 푸쉬를 했어야 했다는 것을 배웠다.
    - Lacked
        - 프런트엔드 동적페이지로 구현하는 것과 sql 작성하는 법을 더 알아야겠다고 생각했다. 동적 페이지 구현이 어려워 많이 적용하지 않았고, 프로젝트기간 마지막에 예매페이지를 구현할때 도와줄 수 없다는 점이 아쉬웠다. SQL을 작성하는데 SQL로 더 쉽게 처리할 수 있는 방법이 많았을 것 같은데 아쉬웠다.
    - longed for
        - 각자 페이지를 분업하여 가져간 후에 더 자세하게 알 수 없었던게 아쉬웠다.
- 🐷 혜원
    - Linked
        원래 프로젝트 주제인 ‘영화 예매 시스템’을 구현하는 것 외에 문서 정리, 깃으로 협업하는 법을 배울 수 있다는 점이 좋았습니다. 깃은 커밋 푸쉬정도 밖에 몰랐는데 다양한 기능을 사용하면서 효율적으로 협업할 수 있도록 도와주셔서 감사합니다 ~😍 
    - learned
        - 백단 데이터 흐름에 대해 작업하면서 배운 것도 있지만, 프론트와 데이터 주고받는 부분에 대해 많이 배우게 되었습니다. 그리고 비동기로 데이터를 받아서 뷰를 만드는 과정에서 document,돔의 실행 순서(?)가 중요하다는 것을 알게 되었습니다.
    - lacked
        - 분업할 때, 서비스별로 하다보니 각자 맡은 부분만 설계하고 관여한 점,
    - longed for
        - 좀 굵직한 로직, 흐름은 함께 이야기 해보면 조금 더 빠르게 방향을 정할 수 있었을 거란 생각이 들어 아쉬웠습니다. 시간이 더 있었다면 제가 맡은 페이지 UX를 더 개선하고 싶습니다
- 🥕 성은
    - Linked
        - 맡은 일만 하지 않고 다들 도와주셔서 넘 감사했습니당
    - learned
        - 문서 정리 — 체계적으로 하는 것도 배우고/ 깃 제대로 관리해볼 수 있어서 많이 배운 것 같습니당
    - Lacked
        - 시간이.. 시간이 너무 부족했따
    - longed for
        - 각자 맡을 부분을 좀 더 세분화 했으면 좋았을듯!!
- ⭐ 나연
    - Linked | 팀원들이랑 해서 좋았던 것
        - 분업이 잘 됐고, 기능이 다르더라도 서로의 문제를 자기 문제처럼 고민하는 모습이 좋았다.
        - 프로젝트 형상관리 (Git, Github)
        - 기능 구현 범위를 3일 기간에 맞게 팀원들이 잘 조정해준 점
    - Learned | 내가 이 프로젝트를 하며 배운점
        - 문서화 작업 !
        - 주기적인 소통
        - 주저하지 않고 시작하면 얻는게 있당 !
        - 처음 버전은 큰 기능들이 합쳐져 돌아갈 수 있게끔 간단하게 만들기
    - Lacked | 아쉬운 점
        - 초기 개발환경 세팅을 확실하게 하지 않은점 (Eclipse, IntelliJ)
        - 빌드 도구 !! (Maven, Gradle)
    - Longed For | 개선했었으면 좋았을 점
        - 내 스케쥴 뿐만 아니라 다른 팀원들의 스케쥴도 계속 확인했으면 좋았을 듯
- 🌊 충현
    - Linked
        - 세분화된 역활분담과 형상관리를 통해 협업을 이끌어낸 점을 통해 많이 배웠다
    - Learned
        - 브런치의 다양한 활용에 대해 배웠다.
    - Lacked
        - 소셜 로그인 기능을 꼭 넣고 싶었는데 도전도 못하고 끝낸것이 아쉬웠다
    - Longed for
        - 소셜 로그인 기능을 넣고 회원 정보에 관한 보안 처리해서 실제 운영중인 로그인 페이지와 비교해도 손색 없는 페이지를 만들어 보고 싶다.
- 🍦 채영
    - Linked
        - 깃에 대해서 잘 알고 있는 팀원들 덕분에 깃을 제대로 써볼 수 있어서 너무 좋았다. 
        - 기록을 잘하는 팀원이 있어서 놓치기 쉽지만 중요할 자료들을 다 모을 수 있어서 좋았다.
        - 모두가 팀 프로젝트 경험이 있어서 한 명도 미숙함 없이 프로젝트가 진행됐던 것 같고 부족한 부분은 서로 도와주고 채워주는 모습이 좋았다.
    - Learned
        - 깃을 제대로 사용해 본 첫 번째 기회였던 것 같다. 많은 것을 배웠다.
            - PR, Issues, convention, commit message 등등
        - JSP를 이제 마스터 한 것 같다…
    - Lacked
        - 리팩토링을 하지 못한 것
        - 테이블 설계가 좀 미숙해서 로직이 좀 꼬였던 것 같다.
        - 깃에 미숙해서 실수 했던 것이 좀 맘에 걸린다.
        - 프론트엔드를 정말 못해서
        - 기능을 공평하게 양을 나눴다고 생각했는데 그게 아니었어서 설계 떄 더 자세하게 기능을 세분화하여 분담해야겠다.
        - 걱정이 너무 많아서 계속 생각하느라 컨디션 조절 실패한 것.
    - Longed for
        - IDE 통일
        - 라이브러리 관리를 위한 빌드 툴 사용..
