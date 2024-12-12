-- Статистика взятия книг
create view library_views.book_stat as (
select b.title,
    b.author,
    count(*) as total_cnt,
    sum(fine_amt) as total_fine,
    avg(fine_amt) as avg_fine
from library.book as b
left join library.borrow_log as bl
on b.book_id = bl.book_id
group by b.title, b.author
);

-- Статистика на каждого члена библиотеки
create view library_views.member_stat as (
    select first_name || ' ' || last_name as full_name,
        count(*) as total_borrows,
        sum(fine_amt) as total_payed_fine,
        sum(good) as timely_return,
        sum(bad) as late_return
    from (select *,
        m.first_name || ' ' || m.last_name as full_name,
        case when return_date >= real_return_date 
            then 1
            else 0
        end as good,
        case when return_date < real_return_date 
            then 1
            else 0
        end as bad
    from library.member as m
    left join library.borrow_log as bl
    on m.member_id = bl.member_id
    ) as a
    group by first_name, last_name
);

-- Статистика сотрудников по департаментам
create view library_views.department_staff_statistics as (
    select 
        d.name as department_name,
        count(s.staff_id) as staff_count,
        avg(s.salary) as average_salary,
        max(s.salary) as max_salary
    from library.department d
    left join library.staff s on d.department_id = s.department_id
    group by d.name
);
