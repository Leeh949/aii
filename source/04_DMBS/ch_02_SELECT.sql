-- [II] SELECT - 조회
-- 1. SELECT 문장작성법
SELECT * FROM TAB;-- 현 계정이 가지고 있는 테이블 정보 ( 실행: CATRL + ENTER)
SELECT * FROM DEPT; -- DEPT 테이블의 모든 열, 모든 행 출력
SELECT * FROM SALGRADE;
SELECT * FROM EMP;

-- 2. 특정 열만
DESC EMP;
--     EMP 테이블구조
SELECT EMPNO, ENAME, SAL, JOB FROM EMP;  --EMP 테이블의 SELECT절에 지정된 열만 출력
SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" FROM EMP;
    -- 열 이름에 별칭을 두눈 경우 EX.열이름 AS 별칭
SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" FROM EMP;

SELECT EMPNO 사번, ENAME 이름, SAL 급여, JOB 직책 FROM EMP;
    -- 열 이름에 별칭에 SPACE가 없는 경우는 따옴표 생략가능 
    
-- 3. 특정 행 출력: WHERE절 (조건절) --비교연산자 : 같다(=), 다르다(!= , ^= , <>))
SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP WHERE SAL=3000;
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL^=3000;
    -- 비교연산자는 숫자, 문자, 날짜형 모두 가능
    -- 문자는 ASCII기준으로 비교  A<B<C
SELECT * FROM EMP WHERE ENAME < 'D';
    -- ex2. 81년도 이전에 입사한 사원의 모든 열(필드)
    SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
    -- ex3. 부서번호(DEPTNO)가 10번인 사원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO =10;
    -- SQL문은 대소문자 구별없음. 데이터는 대소문자 구별
    -- ex4. 이름(ENAME)이 SCOTT인 직원의 모든 데이터(필드)
    SELECT * FROM EMP WHERE ENAMe= 'SCOTT';
-- 4. WHERE절 (조건절)에 논리연산자: AND OR NOT
    -- EX1. 급여(SAL)가 2000이상 3000이하인 직원의 모든 필드
    SELECT * FROM EMP WHERE 2000<= SAL AND SAL <=3000;
    -- EX2. 82년도 입사한 사원의 모든 필드 
    SELECT * FROM EMP WHERE HIREDATE >= '82/01/01' AND HIREDATE<='82/12/31';
    
    -- 날짜 표기법 셋팅 (현재:RR/MM/DD)
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    SELECT * FROM EMP 
        WHERE TO_CHAR (hiredate, 'rr/mm/dd')>='82/01/01'
            AND TO_CHAR(hiredate,'rr/mm/dd') <='82/12/31';
    -- ex3. 부서번호가 10이 아닌 직원의 모든 필드
    select * from emp where deptno != 10;
    select * from emp where not deptno != 10;
    
-- 5. 산술연산자 (SELECT 절, WHERE 절, ORDER BY절)
select empno, ename, sal "예전 월급", sal*1.1 "오른월급" from EMP;
    -- ex1. 연봉이 10,000 이상인 직원의 ENAME(이름), sal, (연봉)
select ename"이름", sal"월급", sal*12"연봉" from emp where sal*12>=10000 order by sal * 12 DESC;
    -- ex2. 직원의 이름, 월급, 상여, 연봉(sal*12+comm)
    -- Null일 수도 있는 필드명, 대체값을 이용
select ename, sal, comm, sal*12+NVL(COMM,0) 연봉 FROM EMP;
    -- EX3. 모든 사원의 ENAME, MGR(상사사번을)을 출력-상사사번이 없으면 'CEO'출력
    SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MGR FROM EMP;
    
-- 6. 연결연산자 (||): 필드내용이나 문자를 연결
SELECT ENAME || '은(는)' || JOB FROM EMP;

-- 7. 중복제거(DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;


--1. emp 테이블의 구조 출력
DESC EMP;
--2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;
--3. 현 scott 계정에서 사용가능한 테이블 출력
SELECT TABLE_NAME FROM USER_TABLES;
--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO, ENAME, SAL, HIREDATE, JOB FROM emp;
--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<2000;
--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP
    WHERE HIREDATE >= '81/02/01';
--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB = 'SALESMAN';
--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB != 'CLERK';
--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >=1500 AND SAL>=1500;
--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO !=20;
--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB = 'SALESMAN' OR SAL >=3000;
--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT ENAME, EMPNO, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB= 'MANAGER';
--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ENAME || '은' || JOB || '업무이고 연봉은' || (SAL*12 +NVL(COMM, 0)) || '이다' MSG FROM EMP;


-- 8. SQL연산자 (BETWEEN, IN, LIKE, IS NULL)
--- BETWEEN A AND B: A부터 B까지 (A,B포함. A<=B)
    -- EX1. SAL이 1500이상 3000이하
    SELECT * FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
    
    -- ex1-1 SAL이 1500미만 3000초과 (EX1의 반대)
    SELECT * FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;
    -- EX2. 82년도 봄(3월에~5월)에 입사한 직원의 모든 필드
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') BETWEEN '81/03/01' AND '82/05/31';
    
--  (2) IN (값1, 값2)
-- 부서코드가 10이거나 30인 사람 모든 정보

SELECT * FROM EMP WHERE DEPTNO IN (10,30,40);
-- EX2. 직책(JOB)이 'MABAGER'  이거나 'ANALYST'인 사원의 모든 정보
SELECT * FROM EMP WHERE JOB IN ('MANAGER','ANALYST');
-- EX1-1. EX1의 반대 (부서번호가 10번도 아니고, 30도 아니고 40도 아닌 사람)
SELECT * FROM EMP WHERE DEPTNO NOT IN( 10,30,40);

-- (3) 필드명 LIKE '패턴' : %(0글자 이상), _(한글자)를 포함하는 패턴
    -- EX. 이름이 M으로 시작하는 사원의 모든 정보
    SELECT * FROM EMP WHERE ENAME LIKE 'M%';
    -- EX. 이름이 S로 끝나는 사원의 모든 정보
    SELECT * FROM EMP WHERE ENAME LIKE'%S';
    -- EX. 이름에 N이 들어가는 사원의 모든 정보
    SELECT * FROM EMP WHERE ENAME LIKE '%N%';
    -- EX. 이름에 N이 들어가고 JOB에 S가 들어가는 사원의 모든 정보
    SELECT * FROM EMP WHERE ENAME LIKE '%N%' AND JOB LIKE '%S%';
    -- EX. SAL이 5로 끝나는 사원
    SELECT * FROM EMP WHERE SAL LIKE '%5';
    -- EX. 82년도에 입사한 사원
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') LIKE '82/%';
    -- EX. 1월에 입사한 사원
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') LIKE '__/01/%';
    -- EX. 이름에 A가 들어간 사원
    SELECT * FROM EMP WHERE ENAME LIKE '%A%';
    -- EX 이름에 %가 들어간 사원
    SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE '\';
    DESC EMP;
    -- 이름에 %가 들어간 데이터 INSERT
    INSERT INTO EMP VALUES (9999, '홍%신', NULL, NULL, NULL, 9000,9000,40);
    SELECT * FROM EMP;
    ROLLBACK; -- DML(데이터조작어;, 추가, 수정, 삭제, 검색)를 취소
    
-- (4) 필드명 IS NULL: 필드명이  널인지를 검색할 때
    -- EX.COMM(상여)이 없는 사원
    SELECT * FROM EMP WHERE COMM IS nULl OR COMM = 0;
    -- EX. COMM(상여)을 받는 사원(COMM!=0 AND COMM이 NULL이 아님)
    SELECT * FROM EMP WHERE NOT COMM IS NULL AND COMM!=0;
    
-- 9. 정렬 (오름차순, 내림차순) : ORDER BY절
    SELECT * FROM EMP ORDER BY SAL DESC;
    -- EX. 급여 내림차순 급여같으면 입사일 내림차순
    SELECT * FROM EMP ORDER BY SAL DESC, HIREDATE DESC;
    -- EX. 급여가 2000초과이름 ABC순 오름차순
    SELECT * FROM EMP WHERE SAL >2000 ORDER BY ENAME;
    
    
    
    
 --1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
 SELECT EMPNO, ENAME ,JOB, SAL FROM EMP WHERE SAL >=3000; 
 
--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO,EMPNO FROM EMP WHERE EMPNO='7788';
--3.	연봉(SAL*12+COMM)이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL, (SAL*12+NVL(COMM,0)) AS YEARSAL FROM EMP WHERE (SAL*12+NVL(COMM,0)) >= 24000 ORDER BY YEARSAL;
--4.	입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력)
 SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY/MM/DD') BETWEEN '1981/02/20' AND '1981/05/01' ORDER BY HIREDATE;
--5.	deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * FROM EMP WHERE DEPTNO IN (10,30) ORDER BY ENAME;
--6.	sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 출력되는 결과의 타이틀을 employee과 Monthly Salary로 출력)
SELECT ENAME EMPLOYEE, SAL MONTHLYSALARY  FROM EMP WHERE SAL >=1500 AND DEPTNO IN(10,30);
--7.	hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY') = '1982';
--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT * FROM EMP WHERE ENAME BETWEEN 'C' AND 'P' ORDER BY ENAME;
--9.	comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM FROM EMP WHERE NVL(COMM,0)<= SAL * 1.1;
--10.	job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);
--11.	ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MGR =7782);
--12.	입사일이 81년도인 직원의 사번, 사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO, ENAME,HIREDATE, JOB, SAL FROM EMP 
    WHERE TO_CHAR(HIREDATE,'RR') = '81';
--13.	입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO, ENAME,HIREDATE, JOB, SAL FROM EMP 
    WHERE TO_CHAR(HIREDATE,'RR') = '81' AND NOT JOB='SALESMAN';
--14.	사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT DEPTNO, ENAME, HIREDATE, JOB, SAL FROM EMP 
    ORDER BY SAL, HIREDATE;
--15.	사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '__N%';

--16.	사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%A%';
--17.	연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO, ENAME, (SAL + NVL(COMM,0) )*12 ANNUALSAL  FROM EMP 
    WHERE (SAL + NVL(COMM,0) )*12 >=35000;