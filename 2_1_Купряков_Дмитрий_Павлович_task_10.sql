-- Напишем процедуру, чтобы было удобно увольнять сотрудников
create or replace procedure library.fire(p_staff_id int) as $$
    begin
        if not exists (select 1 from library.staff where stuff_id = p_staff_id) then
            raise exception 'Staff with id % does not exist.', p_staff_id;
        end if;
        delete from library.staff where staff_id = p_staff_id;
        delete from library.sp where staff_id = p_staff_id;
    end;
$$ language plpgsql

-- Если уж очень много данных скопилось, то давайте у нас будет возможность
-- удалять старые и неактуальные данные
create or replace procedure library.delete_old_borrow_logs(p_date date) as $$
    begin
        delete from library.borrow_log
        where real_return_date < p_date;
        
        raise notice 'Old borrow logs before % have been deleted.', p_date;
    end;
$$ language plpgsql;
