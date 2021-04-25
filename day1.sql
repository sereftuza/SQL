--tablo olusturma
CREATE TABLE student 
(
   std_id  CHAR(3),
   std_name  VARCHAR2,
   std_age  NUMBER
);

INSERT INTO student VALUES('101','AHMET CAN',30);
INSERT INTO student VALUES('102','MUSTAFA ALI',40);
INSERT INTO student VALUES('103','SEREF TUZA',38);
INSERT INTO student VALUES('104','EKREM TUZA',8);
INSERT INTO student VALUES('106','ALI TUZA',6);
--

SELECT * FROM student;


------------

CREATE TABLE urunler 
(
   urun_id  CHAR(3),
   urun_name  VARCHAR2(50),
   urun_fiyat  NUMBER(5,2),
   urun_tett   DATE,
   urun_stok  NUMBER(10)
);

INSERT INTO urunler VALUES(100,'CIPS',5.5,'21-MAY-22',500);
INSERT INTO urunler VALUES(100,'KOLA',7.5,'21-JAN-25',100);
INSERT INTO urunler VALUES(100,'AYRAN',2.5,'21-MAY-25',1000);
INSERT INTO urunler VALUES(100,'BISKUVI',3.5,'21-MAY-25',1000);

SELECT * FROM urunler;


