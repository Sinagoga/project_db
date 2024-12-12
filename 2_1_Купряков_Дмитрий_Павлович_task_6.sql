-- Посмотрим сколько сотрудников работаем в каждом департаменте и выведем наименование департамента
select d.name, count(*) as staff_amt from library.staff as s
inner join library.department as d on
s.department_id = d.department_id
group by d.name;

-- А теперь выведем те департаменты, в которых есть хотя бы 3 сотрудника
select d.name, count(*) as staff_amt from library.staff as s
inner join library.department as d on
s.department_id = d.department_id
group by d.name
having count(*) >= 3;

-- А давайте ещё отсортируем по алфавиту, только в обратном порядке
select d.name, count(*) as staff_amt from library.staff as s
inner join library.department as d on
s.department_id = d.department_id
group by d.name
having count(*) >= 3
order by d.name desc;

-- Теперь давайте посмотрим, как растут общие траты с поступлением новых сотрудников ежегодно
select first_name || ' ' || last_name as full_name,
    salary,
    hire_year,
    sum(salary) over (order by hire_year)
from  (
    select s.staff_id, 
        s.first_name, 
        s.last_name, 
        d.name, 
        s.hire_date,
        extract(YEAR from s.hire_date) as hire_year,
        s.salary, 
        d.total_rent_amt
    from library.staff as s
    inner join (
        select *, sum(rent_amt) over () as total_rent_amt from library.department
    ) as d on
    s.department_id = d.department_id
)

-- Посчитаем среднюю з.п. по каждому департаменту
select s.first_name || ' ' || s.last_name as full_name,
    d.name,
    avg(salary) over (partition by s.department_id)
from library.staff as s
inner join library.department as d
on s.department_id = d.department_id
--Не важно какие сотрудники--
select d.name, avg from (select s.department_id, avg(salary) 
from library.staff as s
group by s.department_id
order by avg(salary)) as a
inner join library.department as d
on a.department_id = d.department_id