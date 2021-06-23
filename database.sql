grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

DROP DATABASE IF EXISTS `stardb`;

CREATE DATABASE IF NOT EXISTS `stardb` 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE `stardb` ;

CREATE TABLE `Unit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `race` VARCHAR(100) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `ATK` INT(11) NULL,
  `DEF` INT(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `UnitInfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `unit_id` INT NOT NULL,
  `buildings` VARCHAR(255) NULL,
  `supply` INT(11) NULL,
  `buildtime` INT(11) NULL,
  `atkrange` INT(11) NULL,
  `need_mineral` INT(11) NULL,
  `need_gas` INT(11) NULL,
  `unittype` VARCHAR(255) NULL,
  `weapon` VARCHAR(255) NULL,
  `boxart` VARCHAR(2083) NULL,
  PRIMARY KEY (`id`),
  INDEX (`unit_id`),
  FOREIGN KEY (`unit_id`) REFERENCES `Unit` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `unitinfo_id` INT NOT NULL,
  `filename` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX (`unitinfo_id`),
  FOREIGN KEY (`unitinfo_id`) REFERENCES `UnitInfo` (`unit_id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

  CREATE TABLE `skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `skill_id` INT NOT NULL,
  `skillname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX (`skill_id`),
  FOREIGN KEY (`skill_id`) REFERENCES `Unit` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
############################### TERRAN ###############################

INSERT INTO Unit (id, race, name, ATK, DEF) VALUES
  (1, '테란', 'SCV(Space Construction Vehicle)', 5, 0),
  (2, '테란', '마린(Marine)', 6, 0),
  (3, '테란', '불곰(Marauder)',  10, 0),
  (4, '테란', '사신(Reaper)',  8, 0),
  (5, '테란', '유령(Ghost)',  8, 0),
  (6, '테란', '화염차(Hellion)', 8, 0),
  (7, '테란', '땅거미 지뢰(Widow Mine)', 125, 0),
  (8, '테란', '시즈 탱크(Siege Tank)', 15, 1),
  (9, '테란', '토르(Thor)',  60, 1),
  (10, '테란', '바이킹(Viking)',  12, 1),
  (11, '테란', '의료선(Medivac)',  0, 1),
  (12, '테란', '밴시(Banshee)',  24, 0),
  (13, '테란', '밤까마귀(Raven)',  24, 0),
  (14, '테란', '전투순양함(BattleCruiser)',  48, 3);

INSERT INTO UnitInfo (id, unit_id, buildings, supply, buildtime, atkrange, need_mineral, need_gas, unittype, weapon, boxart) VALUES
  (1, 1, '커맨드 센터', 1, 17, 1, 50, 0, '지상', '핵융합 절단기', ''),
  (2, 2, '배럭', 1, 25, 5, 50, 0, '지상', '8mm C-14 가우스 관통 소총', ''),
  (3, 3, '배럭', 2, 10, 6, 100, 25, '지상', '유탄발사기', ''),
  (4, 4, '배럭', 1, 45, 4.5, 50, 50, '지상', 'P-38 사이드 가우스 권총', ''),
  (5, 5, '배럭', 2, 40, 4.5, 100, 200, '지상', '25mm C-10 산탄 소총', ''),
  (6, 6, '군수공장', 2, 30, 5, 100, 0, '지상', '화염포', ''),
  (7, 7, '군수공장', 2, 29, 5, 75, 25, '지상', '감시 미사일', ''),
  (8, 8, '군수공장', 3, 45, 7, 150, 125, '지상', '2연장 90mm 충격포', ''),
  (9, 9, '군수공장', 6, 75, 7, 300, 200, '지상', '재블린 미사일', ''),
  (10, 10, '우주공항', 2, 42, 6, 150, 75, '공중', '랜저 유도탄', ''),
  (11, 11, '우주공항', 2, 42, 0, 100, 100, '공중', '무기 없음', ''),
  (12, 12, '우주공항', 2, 60, 6, 150, 100, '공중', '공대지 반동 로켓포', ''),
  (13, 13, '우주공항', 2, 60, 0, 100, 200, '공중', '무기 없음', ''),
  (14, 14, '우주공항', 6, 90, 6, 400, 300, '공중', '공대공/공대지 레이저 포대', '');
  
INSERT INTO image (id, unitinfo_id, filename, description) VALUES
  (null, 1, 'scv.png', '테란 일꾼'),
  (null, 2, 'marine.png', '테란 기본 보병 유닛이자 팔방미인'),
  (null, 3, 'marauder.png', '자유의날개 시절이 그립다'),
  (null, 4, 'reaper.png', '초반 정찰용 필수 유닛'),
  (null, 5, 'ghost.png', '은폐, 전술핵 공격,EMP 탄환 발사'),
  (null, 6, 'hellion.png', '적 일꾼 긁을때 쾌감'),
  (null, 7, 'widowmine.png', '적 프로브 죽일때 쾌감이 짜릿하다'),
  (null, 8, 'siegetank.png', '이거 때문에 테란함'),
  (null, 9, 'thor.png', '비싸고 쎈데 잘 안씀'),
  (null, 10, 'viking.png', '공중 기본 유닛'),
  (null, 11, 'medivac.png', '군단의심장부터 부스터 장착하고 양심이없어짐'),
  (null, 12, 'banshee.png', '일꾼 두방 클로킹이 짜증남'),
  (null, 13, 'raven.png', '국지방어기 다시 만들어줘'),
  (null, 14, 'battlecruiser.png', '잘 안나옴. 차원이동 굿');

############################### PROTOSS ###############################

INSERT INTO Unit (id, race, name, ATK, DEF) VALUES
  (15, '프로토스', '탐사정(Probe)', 5, 0),
  (16, '프로토스', '광전사(Zealot)', 16, 1),
  (17, '프로토스', '추적자(Stalker)',  10, 1),
  (18, '프로토스', '파수기(Sentry)',  6, 1),
  (19, '프로토스', '사도(Adept)',  10, 1),
  (20, '프로토스', '고위 기사(High Templar)',  6, 0),
  (21, '프로토스', '암흑 기사(Dark Templar)', 45, 1),
  (22, '프로토스', '집정관(Archon)', 25, 0),
  (23, '프로토스', '불멸자(Immortal)', 30, 1),
  (24, '프로토스', '옵저버(Observer)',  0, 0),
  (25, '프로토스', '차원 분광기(Warp Prism)',  0, 0),
  (26, '프로토스', '거신(Colossus)',  30, 1),
  (27, '프로토스', '분열기(Disruptor)',  145, 1),
  (28, '프로토스', '불사조(Pheonix)',  10, 0),
  (29, '프로토스', '우주모함(Carrier)',  80, 2),
  (30, '프로토스', '공허 포격기(Void Ray)',  6, 0),
  (31, '프로토스', '예언자(Oracle)',  15, 0),
  (32, '프로토스', '폭풍함(Tempest)',  30, 2);

INSERT INTO UnitInfo (id, unit_id, buildings, supply, buildtime, atkrange, need_mineral, need_gas, unittype, weapon, boxart) VALUES
  (15, 15, '연결체', 1, 17, 1, 50, 0, '지상', '입자 광선', ''),
  (16, 16, '차원 관문', 1, 42, 1, 100, 0, '지상', '사이오닉 검', ''),
  (17, 17, '차원 관문', 2, 42, 6, 125, 50, '지상', '위상 분열기', ''),
  (18, 18, '차원 관문', 2, 37, 5, 50, 100, '지상', '분열 광선', ''),
  (19, 19, '차원 관문', 2, 37, 5, 50, 100, '지상', '공명포', ''),
  (20, 20, '차원 관문', 2, 55, 5, 50, 200, '지상', '사이오닉 에너지', ''),
  (21, 21, '차원 관문', 2, 55, 1, 125, 125, '지상', '그림자 검', ''),
  (22, 22, '차원 관문', 2, 20, 3, 125, 125, '지상', '사이오닉 충격파', ''),
  (23, 23, '로봇공학 시설', 2, 29, 5, 250, 125, '지상', '2연장 위상 분열기', ''),
  (24, 24, '로봇공학 시설', 3, 45, 0, 25, 75, '공중', NULL, ''),
  (25, 25, '로봇공학 시설', 3, 45, 0, 200, 0, '공중', NULL, ''),
  (26, 26, '로봇공학 시설', 6, 75, 7, 300, 200, '지상', '열 추적 광선', ''),
  (27, 27, '로봇공학 시설', 2, 42, 6, 150, 150, '지상', '정화 폭발', ''),
  (28, 28, '우주관문', 2, 35, 0, 150, 100, '공중', '2연장 이온포', ''),
  (29, 29, '우주관문', 6, 120, 6, 350, 250, '공중', '요격기', ''),
  (30, 30, '우주관문', 4, 60, 0, 250, 150, '공중', '레이저 빔', ''),
  (31, 31, '우주관문', 3, 50, 4, 150, 150, '공중', '펄서 광선', ''),
  (32, 32, '우주관문', 6, 90, 6, 400, 300, '공중', '공진 코일', '');

  INSERT INTO image (id, unitinfo_id, filename, description) VALUES
  (null, 15, 'probe.png', '프로토스 일꾼 , 짜증나는 유닛'),
  (null, 16, 'zealot.png', '방업하면 좀비 안죽음'),
  (null, 17, 'stalker.png', '점멸추적자 너프좀'),
  (null, 18, 'sentry.png', '역장 수호방패 환상 . 역장 잘쓰면 무서움'),
  (null, 19, 'adept.png', '너프를 많이 먹었지만 아직도 초반에 좋다'),
  (null, 20, 'hightemplar.png', '스1보단 약한 스톰'),
  (null, 21, 'darktemplar.png', '암흑성소에서 점멸연구하면 너무 짜증남'),
  (null, 22, 'archon.png', '저그전에서 확실히 좋음'),
  (null, 23, 'immortal.png', '군심시절 사기유닛 지금은 너프먹어도 좋긴함'),
  (null, 24, 'observer.png', '정찰 유닛'),
  (null, 25, 'warpprism.png', '개사기유닛 유닛생성시간 좀 늘려라'),
  (null, 26, 'colossus.png', '공허의유산 오면서 레이저 반토막나서 덜무서움'),
  (null, 27, 'disruptor.png', '살인피구'),
  (null, 28, 'pheonix.png', '뮤탈 담당일진'),
  (null, 29, 'carrier.png', '안쎄보이는데 진짜 쎄다 근데 잘 안나옴'),
  (null, 30, 'void ray.png', '공격력은 쎈데 방어력이 약함'),
  (null, 31, 'oracle.png', '정찰, 디텍팅, 견제, 수비 다되는유닛 사기긴한데 요새 잘 안나옴'),
  (null, 32, 'tempest.png', '초반 폭풍함+실드배터리 올인러시 너무 사기같음');

################## ZERG ###################

INSERT INTO Unit (id, race, name, ATK, DEF) VALUES
  (33, '저그', '일벌레(Drone)', 5, 0),
  (34, '저그', '오버로드(Overload)', 0, 1),
  (35, '저그', '저글링(Zergling)',  5, 0),
  (36, '저그', '맹독충(Baneling)', 80, 0),
  (37, '저그', '여왕(Queen)', 12, 1),
  (38, '저그', '히드라리스크(Hydralisk)', 12, 0),
  (39, '저그', '바퀴(Roach)', 16, 1),
  (40, '저그', '뮤탈리스크(Mutalisk)', 12, 0),
  (41, '저그', '타락귀(Corruptor)', 12, 2),
  (42, '저그', '무리군주(Brood Lord)', 25, 2),
  (43, '저그', '감염충(Infestor)', 0, 0),
  (44, '저그', '울트라리스크(Ultralisk)', 35, 3),
  (45, '저그', '살모사(Viper)', 0, 1);

INSERT INTO UnitInfo (id, unit_id, buildings, supply, buildtime, atkrange, need_mineral, need_gas, unittype, weapon, boxart) VALUES
  (33, 33, '해처리', 1, 17, 1, 50, 0, '지상', '가시뼈', ''),
  (34, 34, '해처리', 1, 25, 0, 100, 0, '공중', NULL, ''),
  (35, 35, '해처리', 0.5, 24, 1, 25, 0, '지상', '발톱', ''),
  (36, 36, '해처리', 1, 10, 2, 25, 25, '지상', '자폭 공격', ''),
  (37, 37, '해처리', 2, 25, 6, 150, 0, '지상', '가시뼈', ''),
  (38, 38, '레어', 1, 33, 5, 100, 50, '지상', '바늘 등뼈', ''),
  (39, 39, '해처리', 1, 27, 4, 75, 25, '지상', '산성 타액', ''),
  (40, 40, '레어', 2, 33, 3, 100, 100, '공중', '쐐기벌레', ''),
  (41, 41, '레어', 2, 34, 4, 150, 100, '공중', '부식성 점액', ''),
  (42, 42, '하이브', 2, 29, 9, 250, 125, '공중', '공생충', ''),
  (43, 43, '레어', 2, 50, 0, 100, 150, '지상', NULL, ''),
  (44, 44, '하이브', 6, 70, 2, 300, 200, '지상', '카이저 칼날', ''),
  (45, 45, '하이브', 3, 29, 0, 100, 200, '공중', NULL, '');

INSERT INTO image (id, unitinfo_id, filename, description) VALUES
  (null, 33, 'drone.png', '저그 일꾼 유닛'),
  (null, 34, 'overlord.png', '정말 느리다'),
  (null, 35, 'zergling.png', '저그의 기본 공격 유닛'),
  (null, 36, 'baneling.png', '잠복맹독충이 진짜 무섭다'),
  (null, 37, 'queen.png', '공중공격 지상공격 다되고 만능유닛'),
  (null, 38, 'hydralisk.png', '공속 버프먹고 좀 쎄다'),
  (null, 39, 'roach.png', '초반에 진짜 안죽는다.'),
  (null, 40, 'mutalisk.png', '역뮤탈이 진짜 무섭다'),
  (null, 41, 'corruptor.png', '타락 스킬이 무섭다'),
  (null, 42, 'brood lord.png', '무리군주 가면 필패'),
  (null, 43, 'infestor.png', '잘 쓰는사람을 못봤다. 잘쓰면 진짜 좋음'),
  (null, 44, 'ultralisk.png', '스플래시 데미지까지 있어서 테란상대로 강하다.'),
  (null, 45, 'viper.png', '테란 메카닉 상대로 좋음.');