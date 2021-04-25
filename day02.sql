
    CREATE TABLE calisanlar(
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('1001', 'Ali TUZA',10000,'02-MAY-2011');
    INSERT INTO calisanlar VALUES('1002', 'Ekrem TUZA',15000,'02-JAN-2009');
    INSERT INTO calisanlar VALUES('1003', 'Arif TUZA',20000,'02-FEB-2005');
    INSERT INTO calisanlar VALUES('1004', 'Aysun TUZA',25000,'02-MAY-2000');
    INSERT INTO calisanlar VALUES('1005', 'Seref tuza',30000,'02-MAY-1995');
    INSERT INTO calisanlar VALUES('1006', 'Ercan TUZA',40000,'02-MAY-1995');
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    DELETE calisanlar
    WHERE id='1003';
    
    --- Alternatif primary tanimlama yontemi--
    CREATE TABLE calisanlar(
        id CHAR(5),
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id)   
    );
    ---DISABLE   yazilirsa iptal olur
    INSERT INTO calisanlar VALUES('1001', 'Ali TUZA',10000,'02-MAY-2011');
    INSERT INTO calisanlar VALUES('1002', 'Ekrem TUZA',15000,'02-JAN-2009');
    INSERT INTO calisanlar VALUES('1003', 'Arif TUZA',20000,'02-FEB-2005');
    
    SELECT * FROM calisanlar;
    
    CREATE TABLE adresler (
       adrs_id CHAR(5) REFERENCES calisanlar(id),
       sokak  VARCHAR2(50),
       cadde  VARCHAR2(30),
       sehir VARCHAR2(15)
      -- CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar 
      -- boyle yapilarak paret child iliskisi yapilabilir
    );
    
    INSERT INTO adresler VALUES('1001', 'can sk','cumhuriyet cd', 'Ankara');
    INSERT INTO adresler VALUES('1002', 'mutlu sk','aliaga cd', 'Adana');
    INSERT INTO adresler VALUES('1003', 'cicek sk','yenigun cd', 'Izmir');
   -- INSERT INTO adresler VALUES('1004', 'aga sk','mecbur cd', 'Van');
    -- parent ta bu id olmadigi icin child den ekleme yapilamaz
    
    SELECT * FROM calisanlar;
    SELECT * FROM adresler;
    
    SELECT * FROM calisanlar, adresler
    WHERE id ='1001';
    
    DROP TABLE calisanlar;
    DROP TABLE adresler;
    
    
     CREATE TABLE sehirler(
        alan_kodu NUMBER(3) DEFAULT 34,
        isim VARCHAR2(20) DEFAULT 'ISTANBUL',
        nufus NUMBER(8) CHECK(nufus>0)
    );
    
    INSERT INTO sehirler VALUES(54, 'sakarya', 1250000);
    INSERT INTO sehirler VALUES('', '', 1250000);
    
    --parcali veri girisi
    INSERT INTO sehirler (nufus) VALUES(50000);
    INSERT INTO sehirler (nufus) VALUES(50000);
    
    SELECT * FROM sehirler;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*======================= CONSTRAINTS - KISITLAMALAR ======================================
               
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)
    FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir şartı sağlamasını garanti eder. 
    DEFAULT - Herhangi bir değer atanamadığında Başlangıç değerinin atanmasını sağlar.
 ========================================================================================*/
   
----------------------------------------------------------------
-- KISITLAMALAR (ORNEK1 - PRIMARY KEY)
----------------------------------------------------------------
   
    CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-18'); 
    INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '12-04-19');
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    -- 10001 id'li calisani silme (İleride bu konuyu göreceğiz).
    DELETE calisanlar
    WHERE id='10001';

----------------------------------------------------------------
-- KISITLAMALAR (ORNEK2 - PRIMARY KEY ALTERNATİF YÖNTEM)
----------------------------------------------------------------
-- Bu yöntemde Kısıtlamaya istediğimiz ismi atayabiliriz 
-- ve DISABLE komutuyla istediğimizde pasif hale getirebiliriz. 
    
    CREATE TABLE calisanlar
    (
        id CHAR(5), 
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id) --DISABLE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '14-04-18');

----------------------------------------------------------------
-- KISITLAMALAR (ORNEK3 - FOREIGN KEY)
----------------------------------------------------------------
      
    CREATE TABLE adresler
    (
        adres_id CHAR(5),     -- REFERENCES calisanlar(id),
        sokak VARCHAR2(50),
        cadde VARCHAR2(30),
        sehir VARCHAR2(15),
        CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
    );
    
    INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
    -- FK'ye null değeri atanabilir. 
    INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Antep');
    -- Parent tabloda olmayan bir id ile ekleme yapılamaz.
    INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');
    
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
    
    -- Child tablo silinmeden parent tablo silinemez.
    DROP TABLE calisanlar;
    DROP TABLE adresler;
    
    -- FK ile birleştirilen tablolardaki tüm verileri çekmek için 
    -- JOIN İşlemi yapmak gerekir. Bu konuyu sonra göreceğiz.
    SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;
    
    
    