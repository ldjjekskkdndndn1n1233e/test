/* 
여러줄 주석 
오늘 부터 SQR학습을 시작

SQR는 을 이용하여 저장되어 있는 데이터를 조회하는 방법

<SELSCT>
데이터를 조회하거나 검색할떄 사용 하는 명령어

SELECT
       조회하고자하는 컴럼
       FROM
       테이블명;

*/


--PATIENT 테이블에서 모든 컬럼을 조회

--SELECT * FROM 
--PATIENT;--서능에 영향을 끼치므로 실무에서는 사용 할수없음
/*
 * SELECT
 * 
 */

SELECT  
       DEPT_ID,DEPT_NAMe
  FROM DEPT;
  
SELECT 
       WARD_ID 
  FROM 
       WARD ;

SELECT
     PATIENT_NAME
    ,HEIGHT_CM 
    ,HEIGHT_CM /100
  FROM
     PATIENT
 SELECT
       PATIENT_NAME
       WEIGHT_KG
      ,WEIGHT_KG/((HEIGHT_CM/100)*(HEIGHT_CM/100))
     FROM
       PATIENT;
SELECT 
      PATIENT_NAME
      ADRISSION_DATE
     ,DISCHARGE_DATE
     ,DISCHARGE_DATE-ADMISSION_DATE
    FROM 
      PATIENT;

SELECT 
      PATIENT_NAME
     ,ADMISSION_DATE
     ,SYSDATE-ADMISSION_DATE
  FROM
     PATIENT;

     
 ------------------------------------------------------------------ 
--RESULTSET
/*
 * 
 * 컬럼명이 복잡할때-> 별칭 부여하기
 * 
 * 컴럼명 별칭. 컬럼명 AS별칭 ,컬럼명 "별칭",컬럼명 AS "별칭"
 * 
 * 오라클에서 문자열을 다룰 땐 ''를  사용
 * 
 */
SELECT
           HEIGHT_CM AS "키(CM)"
          ,'cm'
      FROM 
           PATIENT;
 -------------------------
 
 SELECT 
      DISTINCT BLOOD_TYPE
   FROM 
      PATIENT;
 
 SELECT 
       BLOOD_TYPE
    FROM 
       PATIENT;
 -- DISTINCT--
/*
 * <WHERE 절>
 * 조건을 제시해서 조건에 만족하는 행만 조회
 * 
 * 
 * <비교 연산자>
 * 동등비교:=,!=
 * 대소비교:<,>,<=,>=
 * 
 * 
 * 
 * 
 * 
 */

--patioent 테이블에서 환자들에 이름이랑 몸무개 조회
 
 SELECT 
       PATIENT_NAME
      ,WEIGHT_KG
   FROM 
      PATIENT
   WHERE
     WEIGHT_KG>=80;
 
SELECT 
       PATIENT_NAME
      ,GENDER
    FROM
      PATIENT
WHERE 
    -- GENDER !='f';--
     GENDER<>'M;'
  --순서 1 FROM -> 2.WHERE->3.SELECT
     
     /*
      * <논리 연산자>
      * AND/OR
      */
     --병동코드 W3(중환자실) 이면서 키가 160 CM 이상인 환자들이름 ,병동코드,키조회
     
     SELECT 
           PATIENT_NAME
          ,WARD_ID
          ,HEIGHT_CM
       FROM 
           PATIENT
      WHERE
          WARD_ID ='W3'
        --AND
          OR 
          HEIGHT_CM >=170;
     --키가 160이상 170 이하인 환자들의 이름 키를 조회 하시요
     
     SELECT 
          PATIENT_NAME
         ,HEIGH_CM
         
       FROM
           PATIENT
       WHERE
           HEIGHT_CM<= 170
           
       AND
           HEIGHT_CM>=160;
       ---------------------
        SELECT 
            PATIENT_NAME
           ,HEIGHT_CM
          FROM
             PATIENT
          WHERE 
            --HEIGHT_CM BETWEEN  160 AND 170;
            HEIGHT_CM NOT BETWEEN  160 AND 170;
       ---------1980년댜 생  ( 1990~ 1999년)에 태어난 사람 조회
       
       SELECT 
             PATIENT_NAME
            ,BIRTH_DATE
        FROM 
           PATIENT
        WHERE
            BIRTH_DATE BETWEEN  TO_DATE('1990-01-01','YYYY-MM-DD')
                           AND TO_DATE('1999-12-31','YYYY-MM-DD');
/*
 * <like '특정 패턴'>
 * 컬럼의 값이 지정한 특정 패텀 에 만족할 경우 조회
 * 
 * '%': 0글자 이상
 * LIKE '김% => 김으로로 시작하는 모든 글자
 * LIKE '%김' => 김으로 끝나는 모든 글자
 *  LIKe '%김%'=>김을 포함 한 모든 글자
 * 
 * '-':한길자
 * LIKE '__'
 */
         
       SELECT 
             PATIENT_NAME
            ,DIAGNOSIS
         FROM 
             PATIENT
         WHERE 
             --DIAGNOSIS LIKE'%골절';
             DIAGNOSIS LIKE'%급성%';
       
       --이름이 2글자인 의사들만 조회
        SELECT 
             DOCTOR_NAME
          FROM 
              DOCTOR
          WHERE 
              DOCTOR_NAME LIKE '__';
       
       
       
       
       ---------------------------
       
       /*
        * <IS NULL>
        * 
        * 
        * 
        */
       --현재입원중인 환자들 조회
       SELECT 
             PATIENT_NAME
            ,DISCHARGE_DATE
       FROM 
            PATIENT
       WHERE 
       --DISCHARGE_DATE= NULL; NULL은 동등 비교로 불다능
          DISCHARGE_DATE IS  NOT NULL;
       
       -----------------------------------------------
       
       SELECT 
             PATIENT_NAME || '의 담당 코드는 '|| DOCTOR_ID || '입나다'
            ,DOCTOR_ID
          FROM 
             PATIENT;
       -------------------------------
       SELECT 
            PATIENT_NAME
           ,BLOOD_TYPE
       FROM
           PATIENT
       WHERE
            BLOOD_TYPE NOT IN =('A','B','C');
         -- OR
            BLOOD_TYPE='B'
          OR
          --  BLOOD_TYPE='C';
       
 -----------------------------------------      
          SELECT 
               PATIENT_NAME
              ,WARD_ID
              ,GENDER
              ,WEIGHT_KG
           FROM 
              PATIENT
           WHERE
               WARD_ID = 'W3'
            AND 
              GENDER = 'M'
            OR 
              WEIGHT_KG >=85;
 /*
  * <연산자 우선순위>
  * 
  * 1.()
  * 2 산술연산자
  * 3. 연결 연살자
  * 4.비교연산자
  * 5.IS NULL ,LIKE,IN,BETWEEN AND
  * 6.NOT
  * 7.AND
  * 8.OR
  * 
  * -> 아리까리하면 무저건 괄호
  * -> AND 가 OR보다 먼저 묶인다
  * 
  * 
  * 
  * 
  * 
  */
 
 -------------------------------------------
 
 SELECT * FROM PATIENT;
 --ORDER BY
 SELECT
       PATIENT_NAME
      ,HEIGHT_CM
      ,DISCHARGE_DATE 
   FROM 
      PATIENT
   ORDER
      BY
       DISCHARGE_DATE  DESC NULLS LAST;
 
 --oracle에서는 null을 가장 큰 값으롷 취급 하기 때문에 nulls FIRST/LAST
 
 SELECT 
      PATIENT_NAME
     ,HEIGHT_CM/ 100키
     FROM
      PATIENT
    WHERE
      HEIGHT_CM/100>=1.5
    ORDER
       BY
          키 DESC;--컬럼의 순번으로 정렬 가능(비추비추 비권장)
          
          --------------------
          SELECT 
                PATIENT_NAME
                ,WARD_ID
              FROM 
                 PATIENT
          ORDER 
              BY
                WARD_ID
               ,PATIENT_NAME;
          
          
                
 
 
 
 
              
             
       
       
       
       
