-- Добавили нового сотрудника в библиотеку и добавли соответсвующие данные в табличку-связь
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) 
VALUES ('Bob', 'Bobby', 1, '2015-06-01', 4000.00);
INSERT INTO library.sp (staff_id, position_id) values (16, 4);

-- Посмотрим, что всё успешно добавилось
select * from library.staff;
select * from library.staff as s where s.staff_id = 16; 
select * from library.sp;
select * from library.sp as sp where sp.staff_id = 16;

-- Увеличим зарплату технику Бобу и сделаем его библиотекарем
update library.staff as s set salary = 7000 where s.staff_id = 16;
update library.sp as sp set position_id = 1 where staff_id = 16 and position_id = 4; -- так можно делать, т.к. это у нас составной ключ и что-то лишнее не поменяем
-- select * from library.staff as s where s.staff_id = 16; 
-- select * from library.sp as sp where sp.staff_id = 16;

-- А теперь уволим нашего библиотекаря Боба :(
delete from library.staff where staff_id = 16;
delete from library.sp where staff_id = 16;
-- select * from library.staff as s where s.staff_id = 16; 
-- select * from library.sp as sp where sp.staff_id = 16;

