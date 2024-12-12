CREATE SCHEMA library;

CREATE TABLE library.publisher (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    district VARCHAR(100),
    street VARCHAR(255),
    house VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE library.book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher_id INT NOT NULL,
    publish_date DATE CHECK (publish_date >= '1000-01-01' AND publish_date <= '9999-12-31'),
    genre VARCHAR(100),
    FOREIGN KEY (publisher_id) REFERENCES library.publisher(publisher_id) ON DELETE CASCADE
);

CREATE TABLE library.member (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(100),
    district VARCHAR(100),
    street VARCHAR(255),
    house VARCHAR(50)
);

CREATE TABLE library.department (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(100),
    district VARCHAR(100),
    street VARCHAR(255),
    house VARCHAR(50),
    rent_amt INT,
    phone_number varchar(20),
    CONSTRAINT chk_rent_amt CHECK (rent_amt is NULL OR rent_amt  >= 0)
);

CREATE TABLE library.position (
    position_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE library.staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) CHECK (salary > 0),
    FOREIGN KEY (department_id) REFERENCES library.department(department_id) ON DELETE CASCADE
);

CREATE TABLE library.sp (
    staff_id INT NOT NULL,
    position_id INT NOT NULL,
    PRIMARY KEY (staff_id, position_id),
    FOREIGN KEY (staff_id) REFERENCES library.staff(staff_id) ON DELETE CASCADE,
    FOREIGN KEY (position_id) REFERENCES library.position(position_id) ON DELETE CASCADE
);

CREATE TABLE library.borrow_log (
    borrow_id SERIAL PRIMARY KEY,
    member_id INT NOT NULL,
    staff_id INT NOT NULL,
    book_id INT NOT NULL,
    fine_amt INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    real_return_date DATE,
    FOREIGN KEY (member_id) REFERENCES library.member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES library.staff(staff_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES library.book(book_id) ON DELETE CASCADE,
    CONSTRAINT chk_return_date CHECK (return_date IS NOT NULL OR return_date >= borrow_date),
    CONSTRAINT chk_real_return_date CHECK (real_return_date IS NOT NULL OR real_return_date >= borrow_date),
    CONSTRAINT chk_fine_amt CHECK (fine_amt IS NOT NULL OR fine_amt >= 0)
);

-- INSERT into library.borrow_log(member_id, staff_id, book_id, fine_amt, borrow_date, return_date, real_return_date) values (1,1,1,121, '2015-06-01', '2015-06-02', '2015-06-02')

-- select * from library.publisher;
-- select * from library.book;
-- select * from library.member;
-- select * from library.staff;
-- select * from library.position;
-- select * from library.sp;
-- select * from library.department;
-- select * from library.borrow_log;