/* kmarket 데이터베이스/테이블 생성*/


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Kmarket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Kmarket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Kmarket` DEFAULT CHARACTER SET utf8 ;
USE `Kmarket` ;

-- -----------------------------------------------------
-- Table `Kmarket`.`km_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_member` (
  `uid` VARCHAR(20) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `gender` TINYINT NOT NULL,
  `hp` CHAR(13) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `type` TINYINT NOT NULL,
  `point` INT NULL DEFAULT 0,
  `level` TINYINT NULL DEFAULT 1,
  `zip` VARCHAR(10) NULL,
  `addr1` VARCHAR(255) NULL,
  `addr2` VARCHAR(255) NULL,
  `company` VARCHAR(20) NULL,
  `ceo` VARCHAR(20) NULL,
  `bizRegNum` CHAR(12) NULL,
  `comRegNum` VARCHAR(100) NULL,
  `tel` VARCHAR(20) NULL,
  `manager` VARCHAR(20) NULL,
  `managerHp` CHAR(13) NULL,
  `fax` VARCHAR(20) NULL,
  `regip` VARCHAR(100) NOT NULL,
  `wdate` DATETIME NULL,
  `rdate` DATETIME NOT NULL,
  `etc1` INT NULL,
  `etc2` INT NULL,
  `etc3` VARCHAR(10) NULL,
  `etc4` VARCHAR(20) NULL,
  `etc5` VARCHAR(30) NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_member_terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_member_terms` (
  `terms` TEXT NOT NULL,
  `privacy` TEXT NOT NULL,
  `location` TEXT NOT NULL,
  `finance` TEXT NOT NULL,
  `tax` TEXT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_order` (
  `ordNo` INT NOT NULL AUTO_INCREMENT,
  `ordUid` VARCHAR(20) NOT NULL,
  `ordCount` INT NULL DEFAULT 0,
  `ordPrice` INT NULL DEFAULT 0,
  `ordDiscount` INT NULL DEFAULT 0,
  `ordDelivery` INT NULL DEFAULT 0,
  `savePoint` INT NULL DEFAULT 0,
  `usedPoint` INT NULL DEFAULT 0,
  `ordTotPrice` INT NULL DEFAULT 0,
  `recipName` VARCHAR(20) NOT NULL,
  `recipHp` CHAR(13) NOT NULL,
  `recipZip` CHAR(5) NOT NULL,
  `recipAddr1` VARCHAR(255) NOT NULL,
  `recipAddr2` VARCHAR(255) NOT NULL,
  `ordPayment` TINYINT NOT NULL,
  `ordComplete` TINYINT NOT NULL,
  `ordDate` DATETIME NOT NULL,
  PRIMARY KEY (`ordNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_member_point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_member_point` (
  `pointNo` INT NOT NULL,
  `uid` VARCHAR(20) NOT NULL,
  `ordNo` INT NOT NULL,
  `point` INT NOT NULL,
  `pointDate` DATETIME NOT NULL,
  PRIMARY KEY (`pointNo`),
  INDEX `fk_km_member_point_km_member_idx` (`uid` ASC) VISIBLE,
  INDEX `fk_km_member_point_km_product_order1_idx` (`ordNo` ASC) VISIBLE,
  CONSTRAINT `fk_km_member_point_km_member`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_member_point_km_product_order1`
    FOREIGN KEY (`ordNo`)
    REFERENCES `Kmarket`.`km_product_order` (`ordNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product` (
  `prodNo` INT(10) NOT NULL AUTO_INCREMENT,
  `prodCate1` TINYINT NOT NULL,
  `prodCate2` TINYINT NOT NULL,
  `prodName` VARCHAR(100) NOT NULL,
  `descript` VARCHAR(100) NOT NULL,
  `company` VARCHAR(100) NOT NULL,
  `seller` VARCHAR(20) NOT NULL,
  `price` INT NOT NULL,
  `discount` TINYINT NULL DEFAULT 0,
  `point` INT NULL DEFAULT 0,
  `stock` INT NULL DEFAULT 0,
  `sold` INT NULL DEFAULT 0,
  `delivery` INT NULL DEFAULT 0,
  `hit` INT NULL DEFAULT 0,
  `score` TINYINT NULL DEFAULT 0,
  `review` INT NULL DEFAULT 0,
  `thumb1` VARCHAR(255) NOT NULL,
  `thumb2` VARCHAR(255) NOT NULL,
  `thumb3` VARCHAR(255) NOT NULL,
  `detail` VARCHAR(255) NOT NULL,
  `status` VARCHAR(20) NULL DEFAULT '새상품',
  `duty` VARCHAR(20) NULL DEFAULT '과세상품',
  `receipt` VARCHAR(50) NULL DEFAULT '발행가능- 신용카드 전표, 온라인 현금영수증',
  `bizType` VARCHAR(20) NULL DEFAULT '사업자 판매자',
  `origin` VARCHAR(20) NULL DEFAULT '상세설명참고',
  `ip` VARCHAR(20) NOT NULL,
  `rdate` DATETIME NOT NULL,
  `etc1` INT NULL,
  `etc2` INT NULL,
  `etc3` VARCHAR(10) NULL,
  `etc4` VARCHAR(20) NULL,
  `etc5` VARCHAR(30) NULL,
  PRIMARY KEY (`prodNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_cate1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_cate1` (
  `cate1` TINYINT(2) NOT NULL,
  `c1Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cate1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_cate2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_cate2` (
  `cate1` TINYINT(2) NOT NULL,
  `cate2` INT(2) NOT NULL,
  `c2Name` VARCHAR(20) NOT NULL,
  INDEX `fk_km_product_cate2_km_product_cate11_idx` (`cate1` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_cate2_km_product_cate11`
    FOREIGN KEY (`cate1`)
    REFERENCES `Kmarket`.`km_product_cate1` (`cate1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_cart` (
  `cartNo` INT NOT NULL AUTO_INCREMENT,
  `uid` VARCHAR(20) NOT NULL,
  `prodNo` INT(10) NOT NULL,
  `count` INT NOT NULL,
  `price` INT NOT NULL,
  `discount` INT NOT NULL,
  `point` INT NOT NULL,
  `delivery` INT NOT NULL,
  `total` INT NOT NULL,
  `rdate` DATETIME NOT NULL,
  PRIMARY KEY (`cartNo`),
  INDEX `fk_km_product_cart_km_member1_idx` (`uid` ASC) VISIBLE,
  INDEX `fk_km_product_cart_km_product1_idx` (`prodNo` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_cart_km_member1`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_cart_km_product1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `Kmarket`.`km_product` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_order_item` (
  `ordNo` INT NOT NULL,
  `prodNo` INT(10) NOT NULL,
  `count` INT NOT NULL,
  `price` INT NOT NULL,
  `discount` TINYINT NOT NULL,
  `point` INT NOT NULL,
  `delivery` INT NOT NULL,
  `total` INT NOT NULL,
  INDEX `fk_km_product_order_item_km_product1_idx` (`prodNo` ASC) VISIBLE,
  INDEX `fk_km_product_order_item_km_product_order1_idx` (`ordNo` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_order_item_km_product1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `Kmarket`.`km_product` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_order_item_km_product_order1`
    FOREIGN KEY (`ordNo`)
    REFERENCES `Kmarket`.`km_product_order` (`ordNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_review` (
  `revNo` INT NOT NULL AUTO_INCREMENT,
  `prodNo` INT(10) NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `uid` VARCHAR(20) NOT NULL,
  `rating` TINYINT NOT NULL,
  `regip` VARCHAR(100) NOT NULL,
  `rdate` DATETIME NOT NULL,
  PRIMARY KEY (`revNo`),
  INDEX `fk_km_product_review_km_product1_idx` (`prodNo` ASC) VISIBLE,
  INDEX `fk_km_product_review_km_member1_idx` (`uid` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_review_km_product1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `Kmarket`.`km_product` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_review_km_member1`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/* kmarket 데이터베이스/테이블 생성 끝 */









/* cate1 insert문*/



INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (10, '브랜드패션');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (11, '패션의류/잡화/뷰티');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (12, '유아동');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (13, '식품/생필품');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (14, '홈데코/취미/반려');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (15, '컴퓨터/디지털/가전');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (16, '스포츠/건강/렌탈');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (17, '자동차/공구');
INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES (18, '여행/도서/티켓/쿠폰');

/* cate2 insert문*/

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (10, 10, '브랜드 여성의류');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (10, 11, '브랜드 남성의류');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (10, 12, '브랜드 진/캐쥬얼');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (10, 13, '브랜드 신발/가방');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (10, 14, '브랜드 쥬얼리/시계');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (10, 15, '브랜드 아웃도어');


INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 10, '여성의류');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 11, '남성의류');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 12, '언더웨어');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 13, '신발');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 14, '가방/잡화');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 15, '쥬얼리/시계');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 16, '화장품/향수');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (11, 17, '바디/헤어');

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (12, 10, '출산/육아');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (12, 11, '장난감/완구');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (12, 12, '유아동 의류');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (12, 13, '유아동 신발/잡화');


INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (13, 10, '신선식품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (13, 11, '가공식품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (13, 12, '건강식품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (13, 13, '커피/음료');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (13, 14, '생필품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (13, 15, '바디/헤어');


INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 10, '가구/DIY');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 11, '침구/커튼');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 12, '조명/인테리어');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 13, '생활용품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 14, '주방용품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 15, '문구/사무용품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 16, '사무기기');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 17, '악기/취미');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (14, 18, '반려동물용품');

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 10, '노트북/PC');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 11, '모니터/프린터');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 12, 'PC주변기기');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 13, '모바일/태블릿');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 14, '카메라');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 15, '게임');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 16, '영상가전');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 17, '주방가전');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 18, '계절가전');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 19, '생활/미용가전');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 20, '음향가전');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (15, 21, '건강가전');

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 10, '스포츠의류/운동화');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 11, '휘트니스/수영');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 12, '구기/라켓');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 13, '골프');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 14, '자전거/보드/기타레저');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 15, '캠핑/낚시');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 16, '등산/아웃도어');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 17, '건강/의료용품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 18, '건강식품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (16, 19, '렌탈서비스');

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (17, 10, '자동차용품');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (17, 11, '공구/안전/산업용품');

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (18, 10, '여행/항공권');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (18, 11, '도서/음반/e교육');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (18, 12, '공연티켓');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (18, 13, 'e쿠폰');
INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES (18, 14, '상품권');

/* prodNo 컬럼 1,000,000부터 번호 부여*/
alter table `km_product` auto_increment = 1000000;