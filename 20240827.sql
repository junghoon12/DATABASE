/*
where ������
- ��� �����͸� ��ȸ�ϴ� ���� �ƴ϶� ����ڰ� ���ϴ� �����͸�
  ��ȸ�ϰ� ���� ��쿡 �����.
- where �������� �ڷḦ ���͸��� �� �����.
- where �������� from ���̺�� �ڿ� ����� �ϸ� ��.

����) select �÷���1, �÷���2, �÷���3.....
     from ���̺��
     where ���ǽ�;
     
- ���ǽĿ� ���� ����
  1) = : ������ ������ ���� Ȯ��.
  2) < : ������ ������ ���� Ȯ��.
  3) <= : ������ �۰ų� ������ ���� Ȯ��.
  4) >= : ������ ũ�ų� ������ ���� Ȯ��.
  5) > : ������ ū�� ���� Ȯ��.
  6) != : ������ ���� ������ ���� Ȯ��.
  7) <> : ������ ���� ������ ���� Ȯ��.
  8) between A and B : A�� B ���̿� �ִ��� ���� Ȯ��.
  9) in(list) : list �� �߿� ��� �ϳ��� ��ġ�ϴ��� ���� Ȯ��.
  10) not between A and B : A�� B ���̿� ���� �ʴ��� ���� Ȯ��.
      ==> A�� B�� ���Ե��� ����.
  11) not in(list) : list ���� ��ġ���� �ʴ��� ���� Ȯ��.
*/

-- emp ���̺��� �������� 'MANAGER'�� ������ 
-- ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where job = 'MANAGER';

-- emp ���̺��� �������� 'SALESMAN' �� ������ 
-- ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where job = 'SALESMAN';


-- [����1] emp���̺��� empno, ename, job, deptno �÷���
--        ȭ�鿡 �����ּ���.
select empno, ename, job, deptno
from emp; 


-- [����2] emp ���̺��� �̸�, �Ի���, �޿��� ȭ�鿡 �����ּ���.
select ename, hiredate, sal
from emp;


-- [����3] emp ���̺��� ���, �̸�, ������, ���ʽ��� ȭ�鿡 �����ּ���.
select empno, ename, job, comm
from emp;


-- [����4] emp ���̺��� ���, �̸�, �޿�, ���ʽ�, �޿� + ���ʽ� �����
--        ȭ�鿡 �����ּ���.
select empno, ename, sal, comm, sal + comm
from emp;

-- null ���� ������ �÷��� �ٸ� �÷��� ������ �ϰ� �Ǹ�
-- ��� null ������ ó���� �Ǵ� ������ �߻�.

-- nvl() �Լ� : null ���� Ư���� ������ ������� �ִ� �Լ�.
-- ����1) nvl(null ���� ��� �ִ� �÷���, ������ ��)
select empno, ename, sal, comm, sal + nvl(comm, 0) as "�޿� + ���ʽ�"
from emp; 

-- ����2) nvl2(�÷���, expr1, expr2)
select empno, ename, sal, comm, sal + nvl2(comm, comm, 0) as "�޿� + ���ʽ�"
from emp;


-- [����5] emp ���̺��� �������� 'CLERK' �� �����
-- ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job = 'CLERK';


-- [����6] emp ���̺��� 1982�� 1�� 1�� ���Ŀ� �Ի���
-- ����� ���, �̸�, ������, �޿�, �Ի����ڸ� ȭ�鿡 �����ּ���.
select empno, ename, job, sal, hiredate
from emp
where hiredate >= '82/01/01';


-- [����7] emp ���̺��� �޿��� 1300 ~ 1500 ������ �����
-- �̸��� ������, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, job, sal, deptno
from emp
-- where sal >= 1300 and sal <= 1500;
where sal between 1300 and 1500;


-- [����8] emp ���̺��� ����� 7902, 7788, 7566 �� �����
-- ���, �̸�, �������� ȭ�鿡 �����ּ���.
select empno, ename, job
from emp
-- where empno = 7902 or empno = 7788 or empno = 7566;
where empno in(7902, 7788, 7566);


--[����9] emp ���̺��� ���ʽ��� 300�̰ų� 500�̰ų�
-- 1400�� ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
-- where comm = 300 or comm = 500 or comm = 1400;
where comm in(300, 500, 1400);


-- [����10] emp ���̺��� �޿��� 1100 �̻��̰�, ��������
-- 'MANAGER' �� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal >= 1100 and job = 'MANAGER';


/*
  like Ű���� : ���� �� ������. �˻��� �ϴ� Ű����.
  
  1) where ename like '%S%'
     ==> ename �÷��� S�ڸ� �����ϴ� ����� �̸��� �˻�.
      
  2) where ename like 'S%'
     ==> ename �÷��� S�ڷ� �����ϴ� ����� �̸��� �˻�.
     
  3) where ename like '%S'
     ==> ename �÷��� S�ڷ� ������ ����� �̸��� �˻�.
     
  4) where ename like '_S%'
     ==> ename �÷��� �ι�° S�ڸ� �����ϴ� ����� �̸��� �˻�.
*/


-- emp ���̺��� ����� 'A' ��� ���ڸ� �����ϴ� �����
-- ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '%A%';


-- [����1] emp ���̺��� ����� 'M' �̶�� ���ڸ� �����ϴ�
-- ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '%M%';

-- [����2] emp ���̺��� ������� �ι�° ���ڿ� 'I' �̶�� 
-- ���ڸ� �����ϴ� ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '_I%';


-- [����3] emp ���̺��� ����� �̸��� 'S' ��� ���ڷ� ������
-- ����� ����� �̸�, ������, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, job, deptno
from emp
where ename like '%S%';

-- [����4] emp ���̺��� ����� ����° ���ڰ� 'R' �̶�� 
-- ���ڸ� �����ϴ� ����� �̸��� ������, �޿��� ȭ�鿡 �����ּ���.
select ename, job, sal
from emp
where ename like '__R%';

-- [����5] emp ���̺��� ����� �ι�° ���ڰ� 'O' ��� 
-- ���ڸ� �����ϴ� ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '_O%';


-- [����6] emp ���̺��� �Ի�⵵�� 82�⵵�� ����� 
-- ���, �̸�, ������, �Ի����ڸ� ȭ�鿡 �����ּ���.
select empno, ename, job, hiredate
from emp
where hiredate like '82%';



-- member ��� ���̺��� ����� ����.

create table member(
    memno number primary key,          -- ȸ�� ��ȣ
    memid varchar2(20) not null,       -- ȸ�� ���̵�
    memname varchar2(30) not null,     -- ȸ�� �̸�
    mempwd varchar2(20) not null,      -- ȸ�� ��й�ȣ
    age number,                        -- ȸ�� ����
    mileage number,                    -- ȸ�� ���ϸ���
    job varchar2(30),                  -- ȸ�� ����
    addr varchar2(500),                -- ȸ�� �ּ�
    regdate date not null              -- ȸ�� ������
);


-- member ���̺� ȸ���� ������ ������ ����.
insert into member
    values(1, 'id1', 'ȫ�浿', '1111', 25, 0, '�л�',
            '�λ�� ������', '2013-08-08');

insert into member
    values(2, 'kimkd', '��浿', '2222', 30, 1500, 'ȸ���',
            '����� ������', '2013-09-15');

insert into member
    values(3, 'id3', '������', '3333', 33, 10000, 'ȸ���',
            '�λ�� �߱�', '2013-09-09');
            
insert into member
    values(4, 'kimyh', '�迵��', '4444', 18, 3000, '�л�',
            '��󳲵� �����', '2014-05-23');
            
insert into member
    values(5, 'id5', '�ڸ���', '5555', 45, 5000, '�ֺ�',
            '��⵵ �����ֽ�', '2013-12-01');

insert into member
    values(6, 'id6', '��ö��', '6666', 55, 0, '����',
            '���ֵ� ��������', '2013-01-10');

insert into member
    values(7, 'hong', 'ȫ�浿', '7777', 14, 0, '�л�',
            '���ϵ� ���ֽ�', '2013-12-25');

insert into member
    values(8, 'id8', '�����', '8888', 31, 0, '����',
            '����� ������', '2013-04-22');

insert into member
    values(9, 'id9', '������', '9999', 25, 0, '�л�',
            '������ ������', '2013-10-10');

insert into member
    values(10, 'id10', 'ȫ�浿', '1010', 52, 10000, '����',
            '����� ���ϱ�', '2013-09-15');


-- ī�װ� ���̺��� ����� ����.
create table category(
    cnum number unique,                        -- ī�װ� ��ȣ
    category_code varchar2(8),                 -- ī�װ� �ڵ�
    category_name varchar2(30) not null,       -- ī�װ� �̸�
    primary key(category_code)
);


-- ī�װ� ���̺� �����͸� ������ ����.
insert into category values(1, '00010000', '������ǰ');
insert into category values(2, '00010001', 'TV');
insert into category values(3, '00010002', '��ǻ��');
insert into category values(4, '00010003', '��Ʈ��');
insert into category values(5, '00010004', '������');
insert into category values(6, '00020000', '�Ƿ���ǰ');
insert into category values(7, '00020001', '����');
insert into category values(8, '00020002', '�ӿ�');
insert into category values(9, '00020003', '����');
insert into category values(10, '00030000', '����');
insert into category values(11, '00030001', '��ǻ�͵���');
insert into category values(12, '00030002', '�Ҽ�');


-- ��ǰ ���� ���̺��� ����� ����.
create table products(
    pnum number(11) primary key,                   -- ��ǰ ��ȣ
    category_fk varchar2(8) not null,              -- ī�װ� �ڵ�
    products_name varchar2(50) not null,           -- ��ǰ��
    ep_code_fk varchar2(5) not null,               -- ��ǰ �ڵ�
    input_price number(10) default 0 not null,     -- ��ǰ �԰� ����
    output_price number(10) default 0 not null,    -- ��ǰ ��� ����
    trans_cost number(5) default 0 not null,       -- ��ǰ ��ۺ�
    mileage number(6) default 0 not null,          -- ��ǰ ���ϸ���
    company varchar2(30),                          -- ��ǰ ������
    constraint category_ref foreign key(category_fk) 
        references category(category_code)
);

-- ��ǰ �����͸� ������ ����.
insert into products
   values(1, '00010001', 'S ������ TV', '00001', 5000000, 8000000, 0, 100000, '�Ｚ');
insert into products
   values(2, '00010001', 'L TV', '00002', 1000000, 1500000, 0, 50000, 'LG');
insert into products
   values(3, '00010004', 'S ������', '00001', 1000000, 1100000, 5000, 100000, '�Ｚ');
insert into products
   values(4, '00010000', 'C ���', '00003', 200000, 220000, 5500, 0, '����');
insert into products
   values(5, '00010004', 'L ������', '00003', 1200000, 1300000, 0, 0, 'LG');
insert into products
   values(6, '00020001', '��������', '00002', 100000, 150000, 2500, 0, '');
insert into products
   values(7, '00020001', '��������', '00002', 120000, 200000, 0, 0, '');
insert into products
   values(8, '00020002', '�簢��Ƽ', '00002', 10000, 20000, 0, 0, '���𰡵�');
insert into products
   values(9, '00020003', '�ủ����', '00002', 15000, 18000, 0, 0, '');
insert into products
   values(10, '00030001', '������ �ø���', '00001', 25000, 30000, 2000, 0, '���');
   
commit;



/*
  order by ��
  
  - �ڷḦ �����Ͽ� ��Ÿ�� �� ����ϴ� ��ɾ�.
  - order by ���� ��� �ÿ��� select ������ 
    �� �������� �;� ��.
  - asc Ű���� : �������� ����
  - desc Ű���� : ����ó�� ����
  - ���������� ��쿡�� asc�� �����ص� ��.
*/

-- member ���̺��� �̸��� �������� ������������ �����Ͽ�
-- ��� ������ ȭ�鿡 �����ּ���.
-- ��, �̸��� ���� ��쿡�� ���̸� �������� �������� �����ϼ���.
select *
from member
order by memname, age desc;


-- [����1] emp ���̺��� �μ���ȣ�� �������� �������� ������ �ϰ�,
-- �μ���ȣ�� ���� ��� �޿��� �������� ������������ ������ �Ͽ�
-- ȭ�鿡 �����ּ���.
-- ��, �޿��� ���� ��� �����ȣ�� �������� �������� ����
select *
from emp
order by deptno, sal desc, empno;

--[����2] products ���̺��� �ǸŰ����� �������� ������������
-- ������ �Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from products
order by output_price desc;


-- [����3] products ���̺��� ��ۺ� �������� ������������
-- �����ϼ���. ��, ��ۺ� ���� ��� ���ϸ����� ��������
-- ������������ �����Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from products
order by trans_cost desc, mileage desc;

-- [����4] emp ���̺��� �Ի����ڰ� ������ ������� �ֱٿ� 
-- �Ի��� ����� �������� �����ϵ�, �����, �Ի����ڸ�
-- ȭ�鿡 �����ּ���.
select ename, hiredate
from emp
order by hiredate;


-- [����5] emp ���̺��� �޿��� �������� ������������ ������
-- �Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
order by sal desc;


-- [����6] emp ���̺��� �޿��� 1100 �̻��� ������� ������
-- �����ֵ�, �Ի����ڰ� ���� ������ �����Ͽ� ȭ�鿡 �����ּ���.
select *
from emp
where sal >= 1100
order by hiredate;

-- [����7] emp ���̺��� �μ���ȣ�� �������� �������� �����Ͽ�
-- ��Ÿ����, �μ���ȣ�� ���� ��� �������� �������� ���������Ͽ�
-- �����ϼ���. ���� �������� ���ٰ� �ϸ�, �޿��� �������� ����
-- ������ �����Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
order by deptno, job, sal desc;

-- �μ���ȣ�� ȭ�鿡 ǥ���ϵ� �ߺ��� �����ϰ� �����ִ� ���.
-- distinct Ű���� : �ߺ��� �����ϴ� Ű����.
select distinct deptno 
from emp;

select distinct job
from emp;

/*
  dual ���̺�
  - ����Ŭ���� ��ü������ ������ �ִ� ���̺�.
  - �����ϰ� �Լ��� �̿��ؼ� ���, ������� ����� �� ��
    ����ϴ� ���̺�.
  - ������� �ϳ��� ����
  - ��� �뵵 : Ư�� ���̺��� ������ �ʿ䰡 ���� �Լ� �Ǵ�
               ����� �ϰ��� �� �� ���.
*/

-- ����Ŭ���� ������ �ִ� �Լ�.
-- 1) ��¥�� ���õ� �Լ���
--   * sysdate : ���� �ý����� ��¥�� �˷� �ִ� Ű����.
   select sysdate from dual;
   
--   * add_months(���� ��¥, ����(������)) : ���� ��¥���� ���� ���� ���� �ִ� �Լ�.
   select add_months(sysdate, 3) from dual;
   
--   * next_day(���� ��¥, '����') : �ٰ��� ��¥(����)�� ���� �ִ� �Լ�.
   select next_day(sysdate, 'ȭ����') from dual;
   
--   * to_char(��¥, '��¥����') : ���Ŀ� �°� ���ڿ��� ��¥�� ����� �ִ� �Լ�.
   select to_char(sysdate, 'yyyy/mm/dd') from dual;

   select to_char(sysdate, 'mm/dd/yy') from dual;
   
   select to_char(sysdate, 'yyyy-mm-dd') from dual;
   
--   * months_between('������ ��¥', ���� ��¥) : �� ��¥ ������ �������� ����� �ִ� �Լ�.
   select months_between('24/12/31', sysdate) from dual;
   
--   * last_day() : ���� ��¥�� ������ ���� �˷��ִ� �Լ�.
   select last_day(sysdate) from dual;
   
-- 2) ���ڿ� ���õ� �Լ���.
--   * concat('����1', '����2') : �� ���� ���ڿ��� ����(����)�� �ִ� �Լ�.
   select concat('�ȳ�', '�ϼ���?') from dual;

--   * || ������ : ���ڿ��� �����ϴ� ������.
   select '�氡' || '�氡' from dual;
   
   select ename || '�� �������� ' || job || ' �Դϴ�.'
   from emp;
   
   select memname || '�� ������ ' || job || ' �Դϴ�.'
   from member;
   
--  * upper() : �ҹ��ڸ� �빮�ڷ� ����� �ִ� �Լ�.
   select upper('happy day') from dual;
   
--  * lower() : �빮�ڸ� �ҹ��ڷ� �ٲپ� �ִ� �Լ�.
    select lower(upper('happy day')) from dual;
    
--  * substr('���ڿ�', x, y) : ���ڿ��� x���� y�� ���̸�ŭ ������ �ִ� �Լ�.
    select substr('ABCDEFG', 3, 2) from dual;  -- CD
    
--     x ���� ������ ��쿡�� �����ʿ������� ���۵�.
    select substr('ABCDEFG', -3, 2) from dual;
    
--  * lpad('���ڿ�', '��ü�ڸ���', '�þ �ڸ����� �� ����')
    select lpad('happyday', 15, '*') from dual;
    
--  * rpad('���ڿ�', '��ü�ڸ���', '�þ �ڸ����� �� ����')
    select rpad('happyday', 15, '*') from dual;
    
--  * ltrim('���ڿ�', '�ϳ��� ����') : ���ʿ� �ִ� ���ڸ� �����ִ� �Լ�.
    select ltrim('ABCDEFGA', 'A') from dual;
    
--  * rtrim('���ڿ�', '�ϳ��� ����') : �����ʿ� �ִ� ���ڸ� �����ִ� �Լ�.
    select rtrim('ABCDEFGA', 'A') from dual;
    
--  * replace('���� ���ڿ�', '��ü�� ���ڿ�', '����� ���߿�') : ���ڿ��� ��ü�� �ִ� �Լ�.
    select replace('java program', 'java', 'python') from dual;
    

-- [����1] emp ���̺��� ����� �Ʒ��� ���� ��������
-- ȭ�鿡 �����ּ���.
-- ���) 'SCOTT�� �������� ANALYST �Դϴ�.'
-- ��, concat() �Լ��� �̿��ϼ���.
select concat(concat(ename, '�� �������� '), concat(job, ' �Դϴ�')) from emp;


-- [����2] emp ���̺��� ����� �Ʒ��� ���� ��������
-- ȭ�鿡 �����ּ���.
-- ���) 'SCOTT�� ������ 36000�Դϴ�.'
-- ��, concat() �Լ��� �̿��ϼ���.
select concat(concat(ename, ' �� ������ '), concat(sal*12, ' �Դϴ�.')) from emp;


-- [����3] member ���̺��� ����� �Ʒ��� ���� ��������
-- ȭ�鿡 �����ּ���.
-- ���) 'ȫ�浿 ȸ���� ������ �л��Դϴ�.'
-- ��, concat() �Լ��� �̿��ϼ���.
select concat(concat(memname, ' �� ������ '), concat(job, ' �Դϴ�.')) from member;


-- [����4] emp ���̺��� ���, �̸�, �������� ȭ�鿡
-- �����ּ���. ��, �������� �ҹ��ڷ� �����Ͽ� �����ּ���.
select empno, ename, lower(job)
from emp;


-- [����5] �������� �ֹε�� ��ȣ �߿��� ��������� �����Ͽ�
-- ȭ�鿡 �����ּ���.
select substr('881201-1234567', 1, 6)
from dual;


-- [����6] emp ���̺��� �������� 'A' ��� ���ڸ�
-- '$'�� �ٲپ� ȭ�鿡 �����ּ���.
select replace(job, 'A', '$')
from emp;


-- [����7] member ���̺��� ������ '�л�' �� ������
-- '���л�'���� �ٲپ� ȭ�鿡 �����ּ���.
select replace(job, '�л�', '���л�')
from member;


--[����8] member ���̺��� �ּҿ� '�����' �� �� ������
-- '����Ư����'�� �ٲپ� ȭ�鿡 �����ּ���.
select replace(addr, '�����', '����Ư����')
from member;


    
-- 3) ���ڿ� ���õ� �Լ���.
 
--  * abs(����) : ���밪�� ���� �ִ� �Լ�.
    select abs(23) from dual;
    select abs(-23) from dual;
    
--  * sign(����) : ���(1), ����(-1), 0(0)�� ��ȯ�� �ִ� �Լ�.
    select sign(0) from dual;
    select sign(22), sign(0), sign(-22) from dual;
    
--  * round() : �ݿø��� �� �� ����ϴ� �Լ�.
--   ����) round(����[�ʼ�], �ݿø� ��ġ[����])
--   ==> ���� ���� �����ϸ� �ڿ���(����)������ ���ڸ��� ���� �ݿø��� �� ��.
    select round(0.1234567, 6) from dual; -- 0.123457
    
    select round(2.3423557, 4) from dual; -- 2.3424
    
    select round(1256.5678, -2) from dual; -- 1300
    
--  * trunc() : �Ҽ��� ���� �ڸ����� �߶󳻴� �Լ�.
--   ����) trunc(����[�ʼ�], ������ġ[����])
    select trunc(1234.1234567, 0) from dual;  -- 1234
    
    select trunc(1234.1234567, 4) from dual;  -- 1234.1234
    
    select trunc(1234.1234567, -3) from dual; -- 1000
    
--  * ceil() : ������ �ø��� �� �ִ� �Լ�.
    select ceil(22.8) from dual;  -- 23
    
    select ceil(22.2) from dual;  -- 23
    
--  * power() : ������ �� �ִ� �Լ�.
    select power(4, 3) from dual;
    
--  * mod() : �������� ���� �ִ� �Լ�.
--   ����) mod(�������� ����[�ʼ�], ���� ����[�ʼ�])
    select mod(77, 4) from dual;
    
--  * sqrt() : �������� ���� �ִ� �Լ�.
    select sqrt(3) from dual;
    
    select sqrt(16) from dual;


/*
  �׷��Լ�
  ==> ���� �� �Ǵ� ���̺� ��ü�� ���Ͽ� �Լ��� ����Ǿ�
      �ϳ��� ������� �������� �Լ�.
      
  - avg() : ��հ��� ���ϴ� �Լ�.
  - count() : ��(���ڵ�)�� ������ ���ϴ� �Լ�.
              null ���� �����ϰ� ���� ������ ����.
  - max() : �ִ밪�� ���ϴ� �Լ�.
  - min() : �ּҰ��� ���ϴ� �Լ�.
  - sum() : �� ���� ���ϴ� �Լ�.
*/

-- emp ���̺��� �������� ������ �ִ� ��� �����
-- ���� ���Ͽ� ȭ�鿡 �����ּ���.
select count(mgr)
from emp;


-- [����1] emp ���̺��� ������(mgr)�� ����
-- ���Ͽ� ȭ�鿡 �����ּ���.
select count(distinct mgr)
from emp;

--[����2] emp ���̺��� ���ʽ��� ���� ����� ����
-- ���Ͽ� ȭ�鿡 �����ּ���.
select count(comm)
from emp;


--[����3] emp ���̺��� ��� 'SALESMAN' �� �޿� ��հ�
-- �޿� �ְ��, �޿� ������, �޿� �հ���� ���Ͽ�
-- ȭ�鿡 �����ּ���.
select avg(sal), max(sal), min(sal), sum(sal)
from emp
where job = 'SALESMAN';


--[����4] emp ���̺��� ��ϵǾ� �ִ� ����� �� ��,
-- ���ʽ��� null �� �ƴ� ��� ��, ���ʽ��� ���, ��ϵǾ�
-- �ִ� �μ��� ���� ���Ͽ� ȭ�鿡 �����ּ���.
select count(empno), count(comm), avg(comm), count(distinct deptno)
from emp;


-- DML �߿��� update(����) ���� ����.
-- update��
-- ����) update ���̺�� set ������ �÷���1 = ������ ��, ������ �÷���2 = ������ ��
--      where primary key�� ������ �÷��� = ������ ������;

update student set addr = '����� ������'
    where hakbun = 20240827;
    
update student set major = '�����а�', addr = '����� �����', regdate = sysdate
where hakbun = 20240826;

-- delete �� : ���̺��� �����͸� �����ϴ� ��ɹ�.
-- ����) delete from ���̺��
--       where primary key�� ������ �÷��� = ������ ������;
delete from student
 where hakbun = 20240826;
 
commit;

rollback;




