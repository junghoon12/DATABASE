/*
  group by ��
  - Ư���� �÷��̳� ���� �������� �ش� ���ڵ带 ��� �ڷḦ ������ �� ���.
  - ������ Ư�� �÷��� �������� ���踦 ���ϴµ� ���� ����� ��.
  - �׷��Լ��� �Բ� ����� �ϸ� ȿ�������� Ȱ���� ������.
*/

select distinct deptno
from emp
order by deptno;


select deptno
from emp
group by deptno;

-- emp ���̺��� �μ����� �ش� �μ��� 
-- �ο��� Ȯ���ϰ� ���� ���
select deptno, count(*)
from emp
group by deptno
order by deptno;

-- emp ���̺��� �� �μ����� �μ� ������
-- �޿� �հ���� ���Ͽ� ȭ�鿡 �����ּ���.
select deptno, sum(sal)
from emp
group by deptno
order by sum(sal) desc;


-- [����] emp ���̺��� �μ����� �׷��� ��� �μ��� �޿� �հ��
--  �μ��� �ο� ��, �μ��� ��� �޿�, �μ��� �ִ� �޿�, �μ��� �ּ� �޿���
--  ���Ͽ� ȭ�鿡 �����ּ���.
--  ��, �޿� �հ踦 �������� ������������ �����Ͽ� ȭ�鿡 �����ּ���.
select deptno, sum(sal), count(empno), avg(sal), max(sal), min(sal)
from emp
group by deptno
order by sum(sal) desc;

/*
  having ��
  - group by �� ������ ������ ������.
  - group by ���� ����� ������ �־ ������ �� �����.
  - group by �� �������� where(������)�� �� �� ����.
*/

-- products ���̺��� ī�װ� ����
-- ��ǰ�� ������ ȭ�鿡 �����ּ���.
select category_fk, count(*)
from products
group by category_fk
having count(*) >= 2;


/*
  join ~ on Ű����
  - ���̺�� ���̺��� �����Ͽ� Ư���� �����͸� ����� �� �� �����.
  - �� �� �̻��� ���̺� ������ �������� ���� �� �����.
  - �ߺ��� �߻����� ������, ���ϴ� ������ ��� ���ؼ��� �������� �߻���.
  - Ư�� ����� �Ҽӵ� �μ��� �μ����� �˰� ���� ��� emp ���̺��
    dept ü�̺��� �ѳ���� �۾��� ����Ƿ� ����� ������.
  - �׷��� �� �� ���� ���̺��� �����Ͽ� ���ϴ� ����� ����
    �����̶�� ������ ���ܳ��� �Ǿ���.
    
    ������ ����
    1) euqal join
    2) self join
    3) outer join
*/

/*
  1) euqal join
     - �� �� �̻��� ���̺��� ���ε� �� ���������� �����ϴ� �÷��� ����
       ��ġ�ϴ� ���� �����Ͽ� ����� ��� ���.
     - ���� ���� ���Ǵ� ���� ���.
     - ��, �� ���̺��� ������ �Ϸ��� ��ġ�Ǵ� ���� �÷��� �����ؾ� ��.
*/

-- emp ���̺��� ����� ���, �̸�, ������, �μ���ȣ,
-- �μ���, �μ���ġ�� ȭ�鿡 �����ּ���.
-- emp ���̺�� dept ���̺��� ������ ��Ű�� �μ���ȣ�� �������� �����ؾ� ��.

select empno, ename, job, d.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp ���̺��� ������� 'SCOTT' �� ����� �μ����� �˰� �ʹٸ�??
select empno, ename, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where ename = 'SCOTT';


-- [����1] �μ����� 'RESEARCH' �� �����
-- ���, �̸�, �޿�, �μ���, �ٹ���ġ�� ȭ�鿡 �����ּ���.
select empno, ename, sal, dname, loc
from emp e join dept d
on e.deptno = d.deptno
where dname = 'RESEARCH';


-- [����2] emp ���̺��� 'NEW YORK'�� �ٹ��ϴ� �����
-- �̸��� �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, d.deptno
from emp e join dept d
on e.deptno = d.deptno
where loc = 'NEW YORK';


-- [����3] emp ���̺��� 'ACCOUNTING' �μ� �Ҽ� �����
-- �̸��� ������, �Ի��� �׸��� �μ���ȣ, �μ�����
-- ȭ�鿡 �����ּ���.
select ename, job, hiredate, e.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where dname = 'ACCOUNTING';


--[����4] emp ���̺��� �������� 'SALESMAN' �� �����
-- �̸��� ������, �μ���ȣ, �μ���, �ٹ���ġ�� ȭ�鿡 �����ּ���.
select ename, job, e.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno
where job = 'SALESMAN';


/*
  2) self join
  - ���̺�� ���̺��� ������ �ؾ� �����͸� ��� �� �� �ִµ� �� �״��
    �ڱ� ���Ű� ������ �δ� ���� ����.
  - from ������ ���̺� �̸��� ������ �� �� ����� �� �� ����.
    ���� ���̺��� �����ϴ� ��ó�� �ϱ� ���ؼ� �ݵ�� ��Ī�� �־�� ��.
*/

-- emp ���̺��� �� ����� �������� �̸��� ȭ�鿡 ����� ����.
-- ��� ��) CLARK�� ������ �̸��� KING �Դϴ�.
select e1.ename || ' �� ������ �̸��� ' || e2.ename || ' �Դϴ�.'
from emp e1 join emp e2
on e1.mgr = e2.empno;


/*
  3) outer join
  - 2�� �̻��� ���̺��� ������ �Ǵ� ��� ��� �� �� ���̺���
    �����Ͱ� ������ �ٸ��� ���̺��� �����Ͱ� �������� �ʴ� ���
    �ش� �����Ͱ� ����� ���� �ʴ� ������ �߻���. �ش� ��������
    �ذ��ϱ� ���ؼ� ���� ���.
  - ������ ������ ���̺��� �÷� �ڿ� '(+)' ��ȣ�� �ٿ��� ����� ��.
*/

select ename, d.deptno, dname
from emp e join dept d
on e.deptno(+) = d.deptno;

select e1.ename, e1.job, e1.mgr
from emp e1 join emp e2
on e1.mgr = e2.empno(+);

/*
  view
  - ������ ���̺���.
  - view�� ���������� �����͸� �����ϰ� ���� ����.
  - view�� ����� ���� �����ͺ��̽��� ������ �Ͽ� �����͸� ������.
  - view�� �ַ� �����͸� ��ȸ(select) �� �� ����� ��.
  - view�� ����ϴ� ����
    1) ���� ������ ���ؼ� ���.
       ==> ���� ��޿� ���缭 �÷��� ������ ���Ͽ� ��ȸ�� �����ϵ��� �� �� ����.
    2) ������� ���Ǽ��� ������.
    
    ����) create view ���̸�
          as
          ������;
*/

-- �λ�� view�� �÷��� sal(�޿�), comm(���ʽ�)�� ����
create view emp_insa
as
select empno, ename, job, mgr, hiredate, deptno
from emp;

select * from emp_insa;

-- ������ view�� �÷��� sal(�޿�)�� ����
create view emp_sales
as
select empno, ename, job, mgr, hiredate, comm, deptno
from emp;

select * from emp_sales;

-- ȸ��� view�� ��� �÷� �ۿ�
create view emp_account
as
select *
from emp;

select * from emp_account;


-- 2) ������� ���Ǽ��� ������.
create view emp_salary
as
select empno, ename, (sal*12 + nvl2(comm, comm, 0)) "����"
from emp;

select * from emp_salary;


/*
  Ʈ�����(transaction)?
  - ������ ó���� �� ����.
  - ����Ŭ���� �߻��ϴ� ���� ���� sql ��ɹ����� �ϳ��� ������
    �۾� ������ �����ϴ� ���� ����.
  - all or nothing
  - ����� ���������� ó���� �Ǹ� ���Ḧ �ϰ�, ���� ���� ��ɾ� �߿���
    �ϳ��� ����̶� �߸��� �Ǹ� ��ü�� ����ϴ� �۾��� ����.
    
  - Ʈ������� ����ϴ� ���� : �������� �ϰ����� �����ϰ� �������� 
                            �������� �����ϱ� ����.
  
  - commit : ��� �۾��� ���������� ó���ϰڴٰ� Ȯ���ϴ� ��ɾ�.
             Ʈ�����(insert, update, delete) �Ǵ� �۾��� ������
             DB�� �ݿ�.

  - rollback : �۾� �߿� ������ �߻����� �� Ʈ����� ó�� ��������
               ���� ������ ����Ͽ� ���� ���·� �ǵ����� ��ɾ�.
*/

-- 1. dept ���̺��� �����Ͽ� dept_02 ��� ���̺��� ����� ����.
create table dept_02
as
select * from dept;



-- 2. dept_02 ���̺��� 40�� �μ��� ���� �� commit�� �� ����.
delete from dept_02
where deptno = 40;

commit;

-- 3. dept_02 ���̺��� ��ü �����͸� ������ ����.
delete from dept_02;

-- 4. �� �� ���� 30�� �μ��� ���ؼ��� ������ �Ϸ��� �ߴµ�
-- �߸��ؼ� ��ü�� ������ �� ���, �ٽ� ���� �� �� �ִ�.
rollback;


select * from dept_02;


/*
  savepoint
  - Ʈ������� �۰� �����ϴ� ���� ����.
  - ����ڰ� Ʈ����� �߰� �ܰ迡�� ����Ʈ�� �����Ͽ�
    Ʈ����� ���� Ư�� savepoint���� rollback �� ��
    �ְ� �ϴ� ���� ����.
*/

-- 1. dept ���̺��� �����Ͽ� dept_03 �̶�� ���̺��� ����� ����.
create table dept_03
as
select * from dept;

-- 2. dept_03 ���̺��� 40�� �μ��� ������ �� commit �� �� ����.
delete from dept_03
where deptno = 40;

-- 3. dept_03 ���̺��� 30�� �μ��� ������ ����.
delete from dept_03
where deptno = 30;

-- 4. �� �� savepoint sp1 �� ������ ����.
savepoint sp1;

-- 5. dept_03 ���̺��� 20�� �μ��� ������ ����.
delete from dept_03
where deptno = 20;

-- 6. �� �� savepoint sp2 �� ������ ����.
savepoint sp2;

-- 7. dept_03 ���̺��� 10�� �μ��� ������ ����.
delete from dept_03
where deptno = 10;

-- 8. �μ���ȣ�� 20���� �μ��� �����ϱ� ������
-- �ǵ��� ���� ���� ���
rollback to sp1;


/*
  ��������
  - �ϳ��� ������ �ȿ� �� �ٸ� �������� ���ԵǾ� �ִ� �������� ����.
  - ������ ������ �����ؾ����� ���� �� �ִ� ����� �ϳ��� ��ø��
    ���� �������� ����� ���� �� �ֲ� ��.
  
  ���ǻ���
    - ���ʿ� �ִ� �������� ��ȣ�� ��� ����ϴ� ���� ������.
    - ���ʿ� �ִ� �������� order by ���� ����� �� ����.
    
  ������ 
    - �켱�� ���ʿ� �ִ� �������� �����Ŀ� �� ������� ������
      �ٱ��� �������� ������ �ϸ� ��.
*/

-- emp ���̺��� �̸��� 'SCOTT' �� ����� �޿����� �� ���� �޿���
-- �޴� ����� ���, �̸�. ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal > (select sal from emp where ename = 'SCOTT');  -- SCOTT�� �޿� : 3000


-- �������� ����
-- [����1] emp ���̺��� ��ձ޿����� �� ���� �޴� �����
-- ���, �̸�, ������, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, job, sal, deptno
from emp
where sal < (select avg(sal) from emp);   -- ��� �޿� : �� 2073


-- [����2] emp ���̺��� ����� 7521�� ����� �������� ����,
-- ����� 7934�� ����� �޿����� �� ���� �޴� ����� ���, �̸�, 
-- ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job = (select job from emp where empno = 7521)  -- ������ : SALESMAN
and
sal > (select sal from emp where empno = 7934);  -- 7934 ����� �޿� 1300 

-- [����3] emp ���̺��� �������� 'MANAGER' �� ����� �ּұ޿�����
-- �����鼭, �������� 'CLERK'�� �ƴ� ����� ���, �̸�, ������,
-- �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal < (select min(sal) from emp where job = 'MANAGER')   -- MANAGER �ּ� �޿� : 2450
and job != 'CLERK';

-- [����4] �μ���ġ�� 'DALLAS' �� ����� ���, �̸�, �μ���ȣ, 
-- �������� ȭ�鿡 �����ּ���.
select empno, ename, deptno, job
from emp
where deptno = (select deptno from dept where loc = 'DALLAS');    -- DALLAS �μ���ȣ : 20�� �μ�


-- [����5] member ���̺� �ִ� ���� ���� �� ���ϸ����� ���� ����
-- ���� ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where mileage = (select max(mileage) from member);   -- �ִ� ���ϸ��� : 10,000


-- [����6] emp ���̺��� 'SMITH' �� ������� �� ���� �޿���
-- �޴� ����� �̸���, �޿��� ȭ�鿡 �����ּ���.
select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');   -- SMITH ��� �޿� : 800


-- [����7] emp ���̺��� 10�� �μ� �޿��� ��� �޿����� ���� �޿��� �޴�
-- ������� �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, deptno
from emp
where sal < (select avg(sal) from emp where deptno = 10);  -- 10�� �μ� ��� �޿� : �� 2916


-- [����8] emp ���̺��� 'BLAKE'�� ���� �μ��� �ִ� �������
-- �̸��� �Ի�����, �μ���ȣ�� ȭ�鿡 �����ֵ�, 'BLAKE' �� �����ϰ�
-- ȭ�鿡 �����ּ���.
select ename, hiredate, deptno
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')   -- BLAKE ��� �μ���ȣ : 30�� �μ� 
and ename != 'BLAKE';

-- [����9] emp ���̺��� ��ձ޿����� �� ���� �޴� ������� ���,
-- �̸�, �޿��� ȭ�鿡 �����ֵ�, �޿��� �������� ���� ������ ȭ�鿡 
-- �����ּ���.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)   -- EMP ���̺� ���� ��� �޿� : 2073
order by sal desc;

-- [����10] emp ���̺��� �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ���
-- �ٹ��ϰ� �ִ� ����� ����� �̸�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, deptno
from emp
where deptno in (select distinct deptno from emp where ename like '%T%');


-- [����11] 'SALES' �μ����� �ٹ��ϰ� �ִ� ������� �μ���ȣ,
-- �̸�, �������� ȭ�鿡 �����ּ���.
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'SALES');  -- SALES �μ��� �ش��ϴ� �μ���ȣ : 30


-- [����12] emp ���̺��� 'KING'���� �����ϴ� ��� �����
-- �̸��� �޿�, �����ڸ� ȭ�鿡 �����ּ���.
select ename, sal, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');  -- KING ����� ��� 7839


-- [����13] emp ���̺��� �ڽ��� �޿��� ��ձ޿����� ����, �̸���
-- 'S' �ڰ� ���� ����� ������ �μ����� �ٹ��ϴ� ��� ����� 
-- ���, �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, sal, deptno
from emp
where sal > (select avg(sal) from emp)   -- EMP ���̺� ���� ��� �޿� : 2073
and
deptno in (select distinct deptno from emp where ename like '%S%');


-- [����14] emp ���̺��� ���ʽ��� �޴� ����� �μ���ȣ, �޿��� ����
-- ����� �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm > 0)
and
sal in (select sal from emp where comm > 0);


-- [����15] products ���̺��� ��ǰ�� �ǸŰ����� �ǸŰ�����
-- ��պ��� ū ��ǰ�� ��ü ������ ȭ�鿡 �����ּ���.
select *
from products
where output_price > (select avg(output_price) from products);  -- ��� �Ǹ� ���� : 1,253,800��


-- [����16] products ���̺� �ִ� �Ǹ� ���ݿ��� ��� ���� �̻���
-- ��ǰ ����� ���ϵ�, ����� ���� �� ������ ���� ū �ݾ��� ��ǰ��
-- �����ϰ� ����� ���Ͽ� ȭ�鿡 �����ּ���.
select *
from products
where output_price >= (select avg(output_price) from products
where output_price <>
(select max(output_price) from products));


-- [����17] products ���̺��� ��ǰ���� �̸��� '������' �̶��
-- �ܾ ���Ե� ī�װ��� ���ϴ� ��ǰ����� ȭ�鿡 �����ּ���.
select *
from products
where category_fk in(select distinct category_fk from products where products_name like '%������%');

-- [����18] member ���̺� �ִ� �� ���� �� ���ϸ����� ���� ���� 
-- �ݾ��� ������ ������ ���ʽ� ���ϸ��� 5000���� �� �־� ����,
-- ���ϸ���, ���ϸ���+5000 ���� ȭ�鿡 �����ּ���.
select memname, mileage, mileage + 5000 "�߰��� ���ϸ���"
from member
where mileage = (select max(mileage) from member);    -- �ִ� ���ϸ��� : 10,000

