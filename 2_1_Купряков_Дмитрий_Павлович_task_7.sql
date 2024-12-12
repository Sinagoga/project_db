create schema library_views;

-- пердставление для таблицы publisher
create view library_views.publisher_view as (
    select 
        name,
        city,
        district,
        street,
        house,
        phone,
        email
    from library.publisher
);

-- представление для таблицы book
create view library_views.book_view as(
    select 
        title,
        author,
        genre,
        publish_date,
        publisher_id 
    from library.book
);

-- представление для таблицы member
create view library_views.member_view as(
    select 
        first_name,
        last_name,
        '****-**-' || extract(day from date_of_birth) as masked_date_of_birth,
        substr(phone, 1, 4) || '********' as masked_phone,
        substr(email, 1, position('@' in email) - 1) || '@****' as masked_email,
        city,
        district,
        street,
        house
    from library.member
);

-- представление для таблицы borrow_log
create view library_views.borrow_log_view as(
    select 
        member_id,
        staff_id,
        book_id,
        fine_amt
    from library.borrow_log
);

-- представление для таблицы department
create view library_views.department_view as(
    select 
        name,
        city,
        district,
        street,
        house,
        phone_number,
        rent_amt
    from library.department
);

-- представление для таблицы position
create view library_views.position_view as(
    select 
        name
    from library.position
);

-- представление для таблицы staff
create view library_views.staff_view as(
    select 
        first_name,
        last_name,
        department_id,
        hire_date,
        salary
    from library.staff
);

-- представление для таблицы sp
create view library_views.sp_view as(
    select 
        staff_id,
        position_id
    from library.sp
);


-- select * from library_views.book_view;
-- select * from library_views.borrow_log_view;
-- select * from library_views.department_view;
-- select * from library_views.member_view;
-- select * from library_views.position_view;
-- select * from library_views.publisher_view;
-- select * from library_views.sp_view;
-- select * from library_views.staff_view;