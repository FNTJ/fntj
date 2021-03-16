create database jambox;
use jambox;

-- =======================================================================================
-- ====================================== 회원테이블 ========================================
-- =======================================================================================

create table tbl_USER(
	mb varchar(4) not null,
    userNum int(6) unsigned zerofill auto_increment NOT NULL,
    userName varchar(30) not null,
    userID varchar(30) not null,
    userEmail varchar(50) not null,
    userPassword varchar(100) not null,
    userBirthday date,
    regdate DATETIME DEFAULT NOW(),
    enabled tinyint(1) unsigned zerofill default '1',
    keyword1 varchar(10),
    keyword2 varchar(10),
    keyword3 varchar(10),
    keyword4 varchar(10), 
    keyword5 varchar(10),
	primary key (userNum)
);

create table tbl_USER_auth (
    userNum int(6) unsigned zerofill auto_increment NOT NULL,
    userID varchar(30) not null, 
    auth varchar(50) default 'ROLE_USER' not null,
    constraint fk_user_auth foreign key(userNum) references tbl_USER(userNum));
    
CREATE TRIGGER copy_on_upd AFTER UPDATE ON table_original
FOR EACH ROW
  UPDATE table_copy SET other_column = NEW.other_column
  WHERE post_id = NEW.post_id;
  
  
INSERT INTO tbl_USER (mb, userName, userID, userEmail, userPassword, userBirthday, enabled)
VALUES ('FNTJ', 'jambox', 'jam_admin', 'fntjambox@gmail.com', 
'$2a$10$i1GWj3vONgG1hifnfiUudupNDE9r3P.P7Ov08fmyHJKS4AmcI6nwO', '1990-01-01', true);

INSERT INTO tbl_USER_auth (userID,auth)
VALUES ('jam_admin', 'ROLE_ADMIN');

update tbl_USER set enabled=2 where userNum='000001';

commit;

-- =======================================================================================
-- ================================== 공지사항 + 댓글 테이블 ==================================
-- =======================================================================================

create table tbl_notice(
	bno int auto_increment,
    title varchar(100) not null,
    content varchar(3000) not null,
    writer varchar(30) not null,
    date DATETIME DEFAULT NOW(),
    HIT int DEFAULT 0,
    replycnt int default 0,
	primary key (bno)
);

create table tbl_reply (
    bno int not null,
    rno int not null AUTO_INCREMENT,
    content varchar(3000) not null,
    writer varchar(50) not null,
    regdate DATETIME DEFAULT NOW(),
    primary key(rno, bno)
);

-- 댓글 bno + 공지사항 bno 외래키 설정
ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY(bno)
REFERENCES tbl_notice(bno)
ON UPDATE CASCADE ON DELETE CASCADE;

commit;

-- =======================================================================================
-- ================================== 공지사항 + 파일 테이블 ==================================
-- =======================================================================================

create table tbl_file (
    fno int AUTO_INCREMENT,
    bno int not null, -- bno
    org_fname varchar(300) not null,
    fsize int, -- file_size
    regdate DATETIME DEFAULT NOW(),
    primary key(fno)
);

-- =======================================================================================
-- =======================================================================================
-- ===================================== 자유게시판 테이블 ====================================
create table tbl_freeboard(
	bno int auto_increment,
    category varchar(4) not null,
    title varchar(100) not null,
    content varchar(3000) not null,
    writer varchar(30) not null,
    date DATETIME DEFAULT NOW(),
    hit int default 0,
    replycnt int default 0,
	primary key (bno)
);

-- ================================== 자유게시판 댓글테이블 ==================================
create table tbl_fbreply (
    bno int not null,
    rno int not null AUTO_INCREMENT,
    content varchar(3000) not null,
    writer varchar(50) not null,
    regdate DATETIME DEFAULT NOW(),
    primary key(rno, bno)
);

-- 댓글 bno + 공지사항 bno 외래키 설정
ALTER TABLE tbl_fbreply
ADD CONSTRAINT fk_fbreply_bno
FOREIGN KEY(bno)
REFERENCES tbl_freeboard(bno)
ON UPDATE CASCADE ON DELETE CASCADE;

-- ================================== 자유게시판 파일 테이블 ==================================

create table tbl_fbfile (
    fno int AUTO_INCREMENT, -- file_no
    bno int not null, -- bno
    org_fname varchar(300) not null, -- org_file_name
    stored_fname varchar(300) not null, -- stored file_name
    fsize int, -- file_size
    regdate DATETIME DEFAULT NOW(), -- regdate
    -- del char(1) default 'N' not null, -- del_gb
    primary key(fno)
);

-- =======================================================================================
-- ============================= 직업매칭(잼서치) 테이블 =======================================
-- =======================================================================================

create table tbl_match(
	mb varchar(4) not null,
    mk varchar(300) not null, 
	sub varchar(300) not null,
    job varchar(300) not null,
    primary key (mb, mk, sub));
    
    select * from tbl_match;
    
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','경영','공정무역전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','관광','문화교류사업');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','광고','마케팅PR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','교육','입시전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','기술','응급구조사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','미디어','리포터·MC');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','생활','스포츠에이전트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','도전','서비스','정치인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','경영','감정평가사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','관광','관광통역안내');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','광고','홍보컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','교육','교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','기술','항공교통관제사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','미디어','아나운서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','생활','주택관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','안정','서비스','사회복지사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','경영','고위공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','관광','국제회의통역사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','교육','인사관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','기술','변호사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','미디어','방송프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','생활','식품공학전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','지식','서비스','심리상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','경영','마케팅책임자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','관광','컨벤션기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','광고','아트디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','교육','취업컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','기술','도시설계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','미디어','스타일리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','생활','웨딩플래너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFJ','창의','서비스','언어치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','경영','공정무역전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','관광','지역수배전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','광고','마케팅PR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','교육','교육컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','기술','빅데이터전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','미디어','유튜버·연예인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','생활','건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','도전','서비스','사이버수사관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','경영','생활설계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','관광','관광통역안내사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','광고','프레젠테이션컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','교육','초등교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','기술','시스템운영관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','미디어','출판기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','생활','주택관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','안정','서비스','변리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','경영','경영컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','관광','국제회의통역사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','교육','운동생리전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','기술','정보시스템컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','미디어','방송프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','생활','부동산전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','지식','서비스','심리상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','경영','홍보컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','관광','테마파크디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','광고','카피라이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','교육','캐스팅디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','기술','웹퍼블리셔');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','미디어','만화가·작가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','생활','상품기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENFP','창의','서비스','상담가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','경영','헤드헌터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','관광','문화교류사업');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','광고','마케팅PR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','교육','입시전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','기술','반도체공학기술자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','미디어','방송통신심의위원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','생활','건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','도전','서비스','정치인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','경영','인사관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','관광','관광통역안내사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','광고','프레젠테이션컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','교육','노무사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','기술','정보시스템감리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','미디어','출판기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','생활','소믈리에');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','안정','서비스','세무직공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','경영','증권분석가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','관광','국제회의통역사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','교육','경제학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','기술','판사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','미디어','언론방송경영');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','생활','영양사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','지식','서비스','정신과의사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','경영','바이어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','관광','컨벤션기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','광고','광고AE');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','교육','교수·연구직');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','기술','인공지능전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','미디어','방송프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','생활','제품디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTJ','창의','서비스','복지정책전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','경영','투자브로커');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','관광','승무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','교육','입시전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','기술','항공우주엔지니어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','미디어','방송/프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','생활','스포츠에이전트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','도전','서비스','정치인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','경영','기업마케팅');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','관광','국제무역사무');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','광고','홍보컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','교육','강사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','기술','전자공학전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','미디어','뉴스앵커');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','생활','주택관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','안정','서비스','정책담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','경영','전략기획담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','관광','국제회의통역사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','교육','사회학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','기술','변호사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','미디어','칼럼니스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','생활','부동산전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','지식','서비스','정치평론가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','경영','벤처사업가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','관광','여행상품개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','광고','카피라이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','교육','발명가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','기술','콘텐츠개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','미디어','코미디언·MC');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','생활','게임디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ENTP','창의','서비스','심리학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','경영','기업가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','관광','승무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','교육','입학사정관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','기술','빅데이터전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','미디어','스포츠캐스터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','생활','스포츠에이전트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','도전','서비스','사회복지사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','경영','공정무역전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','관광','국제무역사무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','광고','프레젠테이션컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','교육','초등교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','기술','속기사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','미디어','영화배급·유통');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','생활','공인중개사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','안정','서비스','복지공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','경영','경영컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','관광','문화교류사업');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','광고','홍보컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','교육','교수·연구직');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','기술','정보시스템 운영자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','미디어','공연마케터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','생활','다이어트프로그래머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','지식','서비스','언어치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','경영','마케팅매니저');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','관광','여행상품개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','광고','행사기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','교육','취업컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','기술','콘텐츠개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','미디어','코미디언·MC');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','생활','웨딩플래너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFJ','창의','서비스','상담가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','경영','헤드헌터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','관광','컨벤션기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','교육','보육교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','기술','빅데이터전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','미디어','유튜버·연예인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','생활','스포츠에이전트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','도전','서비스','경매사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','경영','토지관리인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','관광','카지노딜러');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','광고','프레젠테이션컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','교육','초등교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','기술','정보시스템운영자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','미디어','아나운서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','생활','공인중개사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','안정','서비스','수의사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','경영','전략기획담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','관광','여행상품개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','교육','운동생리전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','기술','정보시스템컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','미디어','공연마케터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','생활','영양사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','지식','서비스','범죄학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','경영','문화예술마케터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','관광','테마파크디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','광고','행사기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','교육','캐스팅디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','기술','도시설계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','미디어','일러스트레이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','생활','제품디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESFP','창의','서비스','미술치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','경영','신용관련추심원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','관광','항공기조종사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','교육','입학사정관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','기술','보안시스템전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','미디어','연예기획·오디션 담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','생활','스포츠에이전트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','도전','서비스','정치인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','경영','감정평가사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','관광','카지노딜러');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','광고','소셜네트워크관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','교육','교사·교장');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','기술','항공교통관제사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','미디어','영화배급·유통');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','생활','공인중개사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','안정','서비스','공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','경영','외환딜러·선물거래사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','관광','문화관광해설사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','교육','통계학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','기술','데이터베이스전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','미디어','방송프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','생활','식품공학전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','지식','서비스','약사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','경영','보험설계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','관광','전통건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','광고','광고AE');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','교육','제약회사연구원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','기술','서버개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','미디어','영화기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','생활','요리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTJ','창의','서비스','의료시스템개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','경영','기업가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','관광','승무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','교육','입시전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','기술','빅데이터전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','미디어','유튜버·연예인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','생활','건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','도전','서비스','소방관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','경영','금융감독관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','관광','국제무역사무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','광고','프레젠테이션컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','교육','강사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','기술','토목기술자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','미디어','영화배급·유통');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','생활','공인중개사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','안정','서비스','경찰관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','경영','투자분석가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','관광','문화교류사업담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','교육','인사관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','기술','전기기사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','미디어','저널리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','생활','다이어트프로그래머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','지식','서비스','손해사정사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','경영','생활설계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','관광','여행가이드');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','광고','광고AE');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','교육','해양생물학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','기술','게임개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','미디어','코미디언·MC');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','생활','요리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ESTP','창의','서비스','복지정책전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','경영','투자상담가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','관광','승무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','교육','교육컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','기술','프로젝트매니저');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','미디어','리포터·MC');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','생활','리빙코디네이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','도전','서비스','동물사육사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','경영','은행원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','관광','관광통역');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','광고','홍보컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','교육','노무사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','기술','보안시스템 전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','미디어','편집·교열');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','생활','테라피스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','안정','서비스','복지공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','경영','회계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','관광','큐레이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','교육','직업상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','기술','프로그래머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','미디어','저널리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','생활','영양사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','지식','서비스','심리상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','경영','고객관리담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','관광','여행상품개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','광고','아트디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','교육','심리학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','기술','웹퍼블리셔');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','미디어','작가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','생활','상품기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFJ','창의','서비스','언어치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','경영','헤드헌터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','관광','컨벤션기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','광고','마케팅PR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','교육','특수학교교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','기술','항공우주엔지니어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','미디어','방송프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','생활','리빙코디네이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','도전','서비스','종교교육자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','경영','생활설계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','관광','카지노딜러');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','광고','네트워크관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','교육','노무사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','기술','항공교통관제사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','미디어','도서관사서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','생활','조향사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','안정','서비스','변리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','경영','재무관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','관광','큐레이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','교육','철학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','기술','네트워크엔지니어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','미디어','저널리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','생활','영양사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','지식','서비스','물리치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','경영','마케팅전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','관광','여행상품개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','광고','광고디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','교육','심리학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','기술','웹디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','미디어','사진작가·시인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','생활','제품디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INFP','창의','서비스','예술치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','경영','투자상담가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','관광','항공기조종사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','교육','직업능력개발훈련교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','기술','과학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','미디어','번역가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','생활','건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','도전','서비스','변리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','경영','경영분석가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','관광','문화재감정사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','광고','갤러리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','교육','고등교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','기술','정보시스템감리');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','미디어','방송엔지니어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','생활','소믈리에');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','안정','서비스','법원공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','경영','외환딜러·선물거래사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','관광','국제회의통역사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','교육','교수·연구직');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','기술','변호사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','미디어','평론가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','생활','영양사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','지식','서비스','군사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','경영','정보시스템개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','관광','항해사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','광고','아트디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','교육','제약연구원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','기술','프로그래머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','미디어','영상편집');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','생활','전통제과·제빵원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTJ','창의','서비스','심리상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','경영','벤처투자자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','관광','고고학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','광고','마케팅PR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','교육','입시전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','기술','천문학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','미디어','유튜버·연예인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','생활','리빙코디네이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','도전','서비스','경찰관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','경영','계리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','관광','문화재보존가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','광고','광고프로듀서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','교육','교수·연구직');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','기술','보안시스템/보안전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','미디어','영상편집');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','생활','주택관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','안정','서비스','사회복지사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','경영','증권분석가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','관광','큐레이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','광고','광고홍보디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','교육','물리학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','기술','빅데이터전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','미디어','평론가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','생활','부동산전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','지식','서비스','철학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','경영','금융서비스개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','관광','전통건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','광고','카피라이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','교육','발명가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','기술','소프트웨어엔지니어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','미디어','사진작가·극작가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','생활','패턴·컬러리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('INTP','창의','서비스','예술치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','경영','신용관련추심원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','관광','컨벤션기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','교육','입학사정관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','기술','응급구조사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','미디어','캐스팅디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','생활','리빙코디네이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','도전','서비스','사이버수사관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','경영','행정사무직');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','관광','도서관사서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','광고','갤러리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','교육','교육행정공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','기술','간호사·치과위생사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','미디어','시나리오작가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','생활','공인중개사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','안정','서비스','사회복지사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','경영','외환딜러·선물거래사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','관광','문화관광해설사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','교육','인사관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','기술','환경영향평가원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','미디어','저널리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','생활','다이어트프로그래머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','지식','서비스','상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','경영','재무관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','관광','항해사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','광고','행사기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','교육','취업컨설턴트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','기술','웹퍼블리셔');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','미디어','미디어편집자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','생활','인테리어디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFJ','창의','서비스','미술치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','경영','헤드헌터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','관광','항공기조종사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','광고','마케팅PR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','교육','보육교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','기술','유전공학전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','미디어','연예기획·오디션담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','생활','리빙코디네이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','도전','서비스','범죄학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','경영','법률전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','관광','도서관사서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','광고','갤러리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','교육','초등교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','기술','간호사·치과위생사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','미디어','작곡가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','생활','테라피스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','안정','서비스','물리치료사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','경영','전략기획담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','관광','고고학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','교육','사회학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','기술','항공기정비사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','미디어','공연기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','생활','영양사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','지식','서비스','보호관찰관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','경영','문화예술마케터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','관광','전통건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','광고','광고AE');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','교육','발명가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','기술','웹디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','미디어','음향·출판디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','생활','미용사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISFP','창의','서비스','심리상담사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','경영','기업가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','관광','지역수배전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','교육','기상학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','기술','반도체공학기술자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','미디어','스포츠캐스터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','생활','건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','도전','서비스','정보중개인');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','경영','회계사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','관광','도서관사서');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','광고','소셜네트워크관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','교육','교사·교장');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','기술','정보시스템감리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','미디어','정보보호전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','생활','공인중개사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','안정','서비스','공무원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','경영','신용분석가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','관광','문화관광해설사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','교육','통계학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','기술','통계·로그분석');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','미디어','저널리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','생활','프로게이머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','지식','서비스','조세감독관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','경영','펀드매니저');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','관광','전통건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','광고','아트디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','교육','법률연구원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','기술','데이터베이스전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','미디어','미디어편집자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','생활','요리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTJ','창의','서비스','의료시스템개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','경영','기업가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','관광','항공기조종사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','광고','IR전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','교육','운동선수');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','기술','항공우주엔지니어');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','미디어','연예기획·오디션담당자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','생활','리빙코디네이터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','도전','서비스','응급구조원');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','경영','재무관리사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','관광','관광통역안내사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','광고','소셜네트워크관리자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','교육','체육교사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','기술','기계공학전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','미디어','출판기획자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','생활','플로리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','안정','서비스','경찰관');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','경영','증권분석가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','관광','문화관광해설사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','광고','시장조사전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','교육','교수·연구직');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','기술','소프트웨어개발자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','미디어','저널리스트');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','생활','프로게이머');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','지식','서비스','범죄학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','경영','펀드매니저');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','관광','테마파크디자이너');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','광고','아트디렉터');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','교육','해양생물학자');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','기술','건축가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','미디어','특수효과전문가');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','생활','조향사');
insert into `tbl_match` (`mb`, `mk`, `sub`, `job`) values('ISTP','창의','서비스','의료코디네이터');
    
commit; 