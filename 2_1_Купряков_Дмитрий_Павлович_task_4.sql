--Вставка в табличку "Издательство"
INSERT INTO library.publisher (name, city, district, street, house, phone, email) VALUES ('Pearson', 'New York', 'Manhattan', '5th Ave', '10A', '123-456-7890', 'info@pearson.com');
INSERT INTO library.publisher (name, city, district, street, house, phone, email) VALUES ('Penguin Random House', 'London', 'Westminster', 'Baker St', '221B', '987-654-3210', 'contact@prh.co.uk');
INSERT INTO library.publisher (name, city, district, street, house, phone, email) VALUES ('HarperCollins', 'Sydney', 'Parramatta', 'George St', '12', '456-789-0123', 'sales@harpercollins.com.au');
INSERT INTO library.publisher (name, city, district, street, house, phone, email) VALUES ('Macmillan', 'San Francisco', 'Downtown', 'Market St', '101', '789-012-3456', 'hello@macmillan.com');
INSERT INTO library.publisher (name, city, district, street, house, phone, email) VALUES ('Hachette', 'Paris', 'Montmartre', 'Rue Lepic', '35', '234-567-8901', 'service@hachette.fr');

--Вставка в табличку "Книги"
INSERT INTO library.book (title, author, publisher_id, publish_date, genre) VALUES ('To Kill a Mockingbird', 'Harper Lee', 1, '1960-07-11', 'Fiction');
INSERT INTO library.book (title, author, publisher_id, publish_date, genre) VALUES ('1984', 'George Orwell', 2, '1949-06-08', 'Dystopian');
INSERT INTO library.book (title, author, publisher_id, publish_date, genre) VALUES ('Pride and Prejudice', 'Jane Austen', 3, '1813-01-28', 'Romance');
INSERT INTO library.book (title, author, publisher_id, publish_date, genre) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 4, '1925-04-10', 'Fiction');
INSERT INTO library.book (title, author, publisher_id, publish_date, genre) VALUES ('Moby-Dick', 'Herman Melville', 5, '1851-10-18', 'Adventure');

--Вставка в табличку "Члены библиотеки"
INSERT INTO library.member (first_name, last_name, date_of_birth, email, phone, city, district, street, house) VALUES ('John', 'Doe', '1990-05-15', 'john.doe@example.com', '111-222-3333', 'New York', 'Brooklyn', 'Elm St', '45A');
INSERT INTO library.member (first_name, last_name, date_of_birth, email, phone, city, district, street, house) VALUES ('Jane', 'Smith', '1985-03-20', 'jane.smith@example.com', '444-555-6666', 'Los Angeles', 'Hollywood', 'Sunset Blvd', '88');
INSERT INTO library.member (first_name, last_name, date_of_birth, email, phone, city, district, street, house) VALUES ('Alice', 'Johnson', '1978-11-12', 'alice.johnson@example.com', '777-888-9999', 'Chicago', 'Lincoln Park', 'Clark St', '120');
INSERT INTO library.member (first_name, last_name, date_of_birth, email, phone, city, district, street, house) VALUES ('Bob', 'Brown', '2000-02-25', 'bob.brown@example.com', '123-123-1234', 'Houston', 'Midtown', 'Main St', '22');
INSERT INTO library.member (first_name, last_name, date_of_birth, email, phone, city, district, street, house) VALUES ('Eve', 'Davis', '1995-07-07', 'eve.davis@example.com', '456-456-4567', 'Phoenix', 'Downtown', 'Washington St', '50');

--Вставка в табличку "Департаменты"
INSERT INTO library.department (name, city, district, street, house, rent_amt, phone_number) VALUES ('Central Library', 'New York', 'Manhattan', '5th Ave', '1', 5000, '123-456-7890');
INSERT INTO library.department (name, city, district, street, house, rent_amt, phone_number) VALUES ('West End Library', 'Los Angeles', 'Santa Monica', 'Ocean Ave', '101', 4000, '987-654-3210');
INSERT INTO library.department (name, city, district, street, house, rent_amt, phone_number) VALUES ('Eastside Branch', 'Chicago', 'Hyde Park', 'Woodlawn Ave', '58', 3000, '456-789-0123');
INSERT INTO library.department (name, city, district, street, house, rent_amt, phone_number) VALUES ('Downtown Hub', 'Houston', 'Downtown', 'Smith St', '500', 4500, '789-012-3456');
INSERT INTO library.department (name, city, district, street, house, rent_amt, phone_number) VALUES ('Uptown Location', 'Phoenix', 'Camelback', 'Highland Ave', '202', 3500, '234-567-8901');

-- Вставка в табличку "Должности"
INSERT INTO library.position (name) VALUES ('Librarian');
INSERT INTO library.position (name) VALUES ('Assistant Librarian');
INSERT INTO library.position (name) VALUES ('Archivist');
INSERT INTO library.position (name) VALUES ('Technician');
INSERT INTO library.position (name) VALUES ('Manager');

-- Вставка в табличку "Сотрудники"
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Michael', 'Green', 1, '2015-06-01', 8000.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Sarah', 'White', 1, '2018-09-15', 3500.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('David', 'Black', 1, '2020-01-20', 4500.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Emily', 'Gray', 2, '2017-03-12', 6000.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('James', 'Blue', 2, '2019-11-05', 3000.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Olivia', 'Johnson', 2, '2021-02-22', 3800.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Liam', 'Williams', 3, '2020-07-19', 6600.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Ava', 'Martinez', 3, '2022-04-11', 3700.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Ethan', 'Garcia', 3, '2021-08-25', 4500.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Isabella', 'Hernandez', 4, '2019-10-05', 6000.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Mason', 'Lopez', 4, '2018-05-14', 3000.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Sophia', 'Young', 4, '2022-01-17', 3600.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Jackson', 'King', 5, '2020-12-02', 7000.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Amelia', 'Wright', 5, '2017-04-30', 2500.00);
INSERT INTO library.staff (first_name, last_name, department_id, hire_date, salary) VALUES ('Lucas', 'Scott', 5, '2019-06-20', 3700.00);

-- Вставка в табличку связи "Должность-сотрудник"
INSERT INTO library.sp (staff_id, position_id) VALUES (1, 1);
INSERT INTO library.sp (staff_id, position_id) VALUES (1, 5);
INSERT INTO library.sp (staff_id, position_id) VALUES (2, 2);
INSERT INTO library.sp (staff_id, position_id) VALUES (3, 3);
INSERT INTO library.sp (staff_id, position_id) VALUES (4, 1);
INSERT INTO library.sp (staff_id, position_id) VALUES (4, 5);
INSERT INTO library.sp (staff_id, position_id) VALUES (5, 2);
INSERT INTO library.sp (staff_id, position_id) VALUES (6, 3);
INSERT INTO library.sp (staff_id, position_id) VALUES (7, 1);
INSERT INTO library.sp (staff_id, position_id) VALUES (7, 5);
INSERT INTO library.sp (staff_id, position_id) VALUES (8, 2);
INSERT INTO library.sp (staff_id, position_id) VALUES (9, 3);
INSERT INTO library.sp (staff_id, position_id) VALUES (10, 1);
INSERT INTO library.sp (staff_id, position_id) VALUES (10, 5);
INSERT INTO library.sp (staff_id, position_id) VALUES (11, 2);
INSERT INTO library.sp (staff_id, position_id) VALUES (12, 3);
INSERT INTO library.sp (staff_id, position_id) VALUES (13, 1);
INSERT INTO library.sp (staff_id, position_id) VALUES (13, 5);
INSERT INTO library.sp (staff_id, position_id) VALUES (14, 2);
INSERT INTO library.sp (staff_id, position_id) VALUES (15, 3);

-- Вставка в табличку "Факт одалживания"
INSERT INTO library.borrow_log (member_id, staff_id, book_id, fine_amt, borrow_date, return_date, real_return_date)
VALUES (1, 1, 1, 10, '2023-09-15', '2023-09-22', '2023-09-22');
INSERT INTO library.borrow_log (member_id, staff_id, book_id, fine_amt, borrow_date, return_date, real_return_date)
VALUES (2, 4, 2, 15, '2023-10-01', '2023-10-15', '2023-10-14');
INSERT INTO library.borrow_log (member_id, staff_id, book_id, fine_amt, borrow_date, return_date, real_return_date)
VALUES (3, 7, 3, 21, '2023-08-10', '2023-08-20', '2023-08-19');
INSERT INTO library.borrow_log (member_id, staff_id, book_id, fine_amt, borrow_date, return_date, real_return_date)
VALUES (4, 10, 4, 17, '2023-11-05', '2023-11-12', '2023-11-14');
INSERT INTO library.borrow_log (member_id, staff_id, book_id, fine_amt, borrow_date, return_date, real_return_date)
VALUES (5, 13, 5, 13, '2023-07-15', '2023-07-25', '2023-07-25');