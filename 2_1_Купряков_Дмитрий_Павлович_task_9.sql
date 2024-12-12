-- Если всё-таки попытались впихнуть null в borrow_date, то напишем текущую дату, 
-- а если ещё и ничего не написали в return_date, тогда это означает, что человек выкупил эту книгу
create or replace function library.set_auto_date()
returns trigger as $$
    begin
        if new.borrow_date is null then
            new.borrow_date := current_date;
        end if;
        if new.return_date is null then
            new.return_date := '9999-12-31';
        end if;
        return new;
    end;
$$ language plpgsql;


create trigger set_auto_date_trigger
before insert on library.borrow_log
for each row
execute function library.set_auto_date();

-- Вдруг кто-то захочет стать миллионером, мы это ему не дадим сделать
create or replace function library.validate_salary()
returns trigger as $$
begin
    if new.salary > 1000000 then
        raise exception 'Salary cannot exceed 1,000,000';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger validate_salary_trigger
before insert or update on library.staff
for each row
execute function library.validate_salary();
