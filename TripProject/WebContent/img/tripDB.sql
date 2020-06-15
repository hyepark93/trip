CREATE DATABASE tripDB;

USE tripDB;

CREATE TABLE member(
	id VARCHAR(20) PRIMARY KEY,
	pw VARCHAR(20),
	NAME VARCHAR(20),
	sex VARCHAR(10),
	birth VARCHAR(4)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE spot(
	idx VARCHAR(10) PRIMARY KEY,
	region VARCHAR(40),
	grouping VARCHAR(10),
	NAME VARCHAR(20),
	address VARCHAR(30),
	info VARCHAR(30),
	img MEDIUMBLOB
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE plan(
	idx INT AUTO_INCREMENT PRIMARY KEY,
	id VARCHAR(20),
	contents VARCHAR(500),
	img MEDIUMBLOB,
	pin VARCHAR(500),
	FOREIGN KEY(id) REFERENCES member(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE reply(
	idx VARCHAR(10) PRIMARY KEY,
	id VARCHAR(20),
	contents VARCHAR(200),
	FOREIGN KEY(id) REFERENCES member(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM member;
SELECT * FROM spot;
SELECT * FROM plan;
SELECT * FROM reply;

DROP TABLE member;
DROP TABLE spot;
DROP TABLE plan;
DROP TABLE reply;

DELETE FROM spot WHERE idx='051-01';
DELETE FROM plan WHERE idx='1';

INSERT INTO member VALUES('master','1234','master','not','1990');
INSERT INTO member VALUES('guest1','1234','kim','female','1999');
INSERT INTO member VALUES('guest2','1234','lee','male','1995');

INSERT INTO spot VALUES('051-01','부산','restaurant','양산집','부산 중구 중구로47번길 30',
'부산일보 선정 돼지국밥 1위 맛집','051-01_img.png');
INSERT INTO spot VALUES('051-02','부산','restaurant','내호냉면','부산 남구 우암번영로26번길 17',
'부산 최초의 밀면집','051-02_img.jpg');
INSERT INTO spot VALUES('051-03','부산','restaurant','소문난 원조 조방낙지','부산 동래구 명륜로94번길 37',
'부산 낙곱새의 원조집','051-03_img.jpg');
INSERT INTO spot VALUES('051-04','부산','attraction','광안리','부산 수영구 광안해변로 219',
'야경이 멋진 부산의 대표적인 명소','051-04_img.jpg');
INSERT INTO spot VALUES('051-05','부산','attraction','감천문화마을','부산 사하구 감내2로 203 감천문화마을안내센터',
'피난수도 부산의 아픔을 엿볼수 있는 곳','051-05_img.jpg');
INSERT INTO spot VALUES('051-06','부산','attraction','오륙도','부산 남구 용호동 936-941',
'육지에서 보면 1개 바다에서 보면 5개의 섬','051-06_img.jpg');

INSERT INTO spot VALUES('02-01','서울','restaurant','이문설렁탕','서울 종로구 우정국로 38-13',
'서울에서 가장 오래된 가게 중 한 곳','02-01_img.png');
INSERT INTO spot VALUES('02-02','서울','restaurant','우래옥','서울 중구 창경궁로 62-29',
'평양냉면 뿐만 아니라  불고기도 맛있는 곳','02-02_img.jpg');
INSERT INTO spot VALUES('02-03','서울','restaurant','마복림떡볶이','서울 중구 다산로35길 5',
'대한민국 대표 간식 떡볶이의 원조집','02-03_img.jpg');
INSERT INTO spot VALUES('02-04','서울','attraction','경복궁','서울 종로구 사직로 161 경복궁',
'조선왕조의 정궁','02-04_img.jpg');
INSERT INTO spot VALUES('02-05','서울','attraction','롯데월드타워','서울 송파구 올림픽로 300',
'현재 우리나라에서 가장 높은 타워','02-05_img.jpg');
INSERT INTO spot VALUES('02-06','서울','attraction','선릉과정릉','서울 강남구 선릉로100길 1 선릉정릉',
'복잡한 강남 한복판에서 느끼는 여유','02-06_img.jpg');

INSERT INTO spot VALUES('054-01','경주','restaurant','교리김밥','경북 경주시 탑리3길 2',
'계란이 듬뿍 들어간 김밥','054-01_img.png');
INSERT INTO spot VALUES('054-02','경주','restaurant','황남빵','경북 경주시 태종로 783',
'80년 전통의 황남빵 원조집','054-02_img.jpg');
INSERT INTO spot VALUES('054-03','경주','restaurant','명동쫄면','경북 경주시 계림로93번길 3',
'따뜻하고 차가운 육수에 담긴 쫄면을 맛볼수 있는 집','054-03_img.jpg');
INSERT INTO spot VALUES('054-04','경주','attraction','불국사','경북 경주시 불국로 385 불국사',
'유네스코 세계문화유산에 빛나는 사찰','054-04_img.jpg');
INSERT INTO spot VALUES('054-05','경주','attraction','첨성대','경북 경주시 인왕동 839-1',
'고대 신라시대의 조형미를 느낄 수 있는 건축물','054-05_img.jpg');
INSERT INTO spot VALUES('054-06','경주','attraction','동궁과 월지','경북 경주시 원화로 102 안압지',
'신라시대의 풍류를 즐길 수 있는 곳','054-06_img.jpg');

INSERT INTO spot VALUES('064-01','제주','restaurant','돈사돈','제주 제주시 우평로 19',
'제주 흑돼지 구이를 맛볼 수 있는 집','064-01_img.png');
INSERT INTO spot VALUES('064-02','제주','restaurant','올래국수','제주 제주시 귀아랑길 24',
'고기국수가 맛있은 집','064-02_img.jpg');
INSERT INTO spot VALUES('064-03','제주','restaurant','춘심이네','제주 서귀포시 안덕면 창천중앙로24번길 16',
'통갈치구이와 조림이 유명한 집','064-03_img.jpg');
INSERT INTO spot VALUES('064-04','제주','attraction','성산일출봉','제주 서귀포시 성산읍 성산리 1',
'유네스코 세계자연유산으로 등재된 곳','064-04_img.jpg');
INSERT INTO spot VALUES('064-05','제주','attraction','천지연폭포','제주 서귀포시 천지동 667-7',
'폭포뿐만 아니라 주변 자연경관도 멋진 곳','064-05_img.jpg');
INSERT INTO spot VALUES('064-06','제주','attraction','사려니 숲','제주 제주시 봉개동 산64-5',
'제주의 원시 자연림을 느낄수 있는 곳','064-06_img.jpg');

INSERT INTO spot VALUES('061-01','여수','restaurant','황소식당','전남 여수시 봉산남3길 2',
'작지만 단단한 돌게의 매력을 느낄 수 있는 집','061-01_img.png');
INSERT INTO spot VALUES('061-02','여수','restaurant','돌문어상회','전남 여수시 하멜로 78',
'돌문어의 다양한 매력을 느낄 수 있는 집','061-02_img.jpg');
INSERT INTO spot VALUES('061-03','여수','restaurant','돌산해수타워횟집','전남 여수시 돌산읍 우두1길 12-10',
'갯장어(하모)를 샤브샤브로 즐길수 있는 집','061-03_img.jpg');
INSERT INTO spot VALUES('061-04','여수','attraction','여수해상케이블카','전남 여수시 수정동',
'낮에도 밤에도 아름다운 풍경이 펼쳐짐','061-04_img.jpg');
INSERT INTO spot VALUES('061-05','여수','attraction','여수세계박람회','전남 여수시 덕충동 2000-1',
'2012 여수 엑스포의 여운을 느낄 수 있는 곳','061-05_img.jpg');
INSERT INTO spot VALUES('061-06','여수','attraction','돌산대교','전남 여수시 돌산읍 돌산로 3617-7',
'여수 밤바다의 풍광을 한눈에 느낄 수 있는 곳','061-06_img.jpg');

INSERT INTO plan VALUES(null,'master','부산역/양산집/영도대교/감천문화마을/서면롯데호텔/해운대/
센텀시티/부산역','files/051-01_img.png','90-90/80-100/85-110/75-80/
50-50/150-50/140-50/90-90');
INSERT INTO plan VALUES(null,'guest1','수서역/강남역/쉑쉑버거/선릉과정릉/르메르디앙서울/도산공원/
서울고속버스터미널','files/02-01_img.png','90-90/80-100/85-110/75-80/
50-50/150-50/140-50/');
INSERT INTO plan VALUES(null,'guest2','제주국제공항/올래국수/천지연폭포/돈사돈/제주국제공항/
센텀시티/부산역','files/064-01_img.png','90-90/80-100/85-110/75-80/90-90');

INSERT INTO reply VALUES('1-01','guest1','감천문화마을 볼거 없어요');
INSERT INTO reply VALUES('1-02','guest2','양산집 맛있어요');
INSERT INTO reply VALUES('2-01','master','쉑쉑버거 맛있어요');
INSERT INTO reply VALUES('3-01','guest1','당일치기 인가요?');


------------------------------------------------------------------------------------------------
CREATE TABLE spot1(
	idx VARCHAR(10) PRIMARY KEY,
	region VARCHAR(40),
	grouping VARCHAR(10),
	NAME VARCHAR(20),
	address VARCHAR(30),
	info VARCHAR(30),
	img MEDIUMBLOB,
	LEFTx VARCHAR(20),
	topy VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO spot1 VALUES('051-01','부산','restaurant','양산집','부산 중구 중구로47번길 30',
'부산일보 선정 돼지국밥 1위 맛집','051-01_img.png','45%','65%');
INSERT INTO spot1 VALUES('051-02','부산','restaurant','내호냉면','부산 남구 우암번영로26번길 17',
'부산 최초의 밀면집','051-02_img.jpg','51%','60%');
INSERT INTO spot1 VALUES('051-03','부산','restaurant','소문난 원조 조방낙지','부산 동래구 명륜로94번길 37',
'부산 낙곱새의 원조집','051-03_img.jpg','52%','45%');
INSERT INTO spot1 VALUES('051-04','부산','attraction','광안리','부산 수영구 광안해변로 219',
'야경이 멋진 부산의 대표적인 명소','051-04_img.jpg','56%','55%');
INSERT INTO spot1 VALUES('051-05','부산','attraction','감천문화마을','부산 사하구 감내2로 203 감천문화마을안내센터',
'피난수도 부산의 아픔을 엿볼수 있는 곳','051-05_img.jpg','43%','62%');
INSERT INTO spot1 VALUES('051-06','부산','attraction','오륙도','부산 남구 용호동 936-941',
'육지에서 보면 1개 바다에서 보면 5개의 섬','051-06_img.jpg','56%','66%');

SELECT * FROM spot1;
DROP TABLE spot1;
