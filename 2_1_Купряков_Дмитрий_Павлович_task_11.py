from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Date, Numeric
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

DATABASE_URL = "postgresql://postgres:password@localhost:5432/postgres"
engine = create_engine(DATABASE_URL)

Base = declarative_base()
Session = sessionmaker(bind=engine)
session = Session()

class Publisher(Base):
    __tablename__ = 'publisher'
    __table_args__ = {'schema': 'library'}
    publisher_id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    city = Column(String)
    district = Column(String)
    street = Column(String)
    house = Column(String)
    phone = Column(String)
    email = Column(String, unique=True)
    books = relationship("Book", back_populates="publisher")

class Book(Base):
    __tablename__ = 'book'
    __table_args__ = {'schema': 'library'}
    book_id = Column(Integer, primary_key=True)
    title = Column(String, nullable=False)
    author = Column(String, nullable=False)
    publisher_id = Column(Integer, ForeignKey('library.publisher.publisher_id'), nullable=False)
    publish_date = Column(Date)
    genre = Column(String)
    publisher = relationship("Publisher", back_populates="books")

Base.metadata.create_all(engine)

# Чтение
books = session.query(Book).all()
for book in books:
    print(book.book_id, book.author, book.title)
    
# Запись
new_book = Book(title="a", author="a", publisher_id = 1, publish_date = "2010-10-10", genre="a")
session.add(new_book)
session.commit()

# Проверим, что записалось
books = session.query(Book).all()
for book in books:
    print(book.book_id, book.author, book.title)
    
# Обновление
book_to_update = session.query(Book).filter(Book.book_id == 6).first()
if book_to_update:
    book_to_update.author = "b"
    session.commit()
    
# Проверим, что обновилось
books = session.query(Book).all()
for book in books:
    print(book.book_id, book.author, book.title)
    
# Удаление
book_to_delete = session.query(Book).filter(Book.book_id == 6).first()
if book_to_delete:
    session.delete(book_to_delete)
    session.commit()
    
# Проверим, что удалилось
books = session.query(Book).all()
for book in books:
    print(book.book_id, book.author, book.title)
    
# Выведем игформацию о книгах, если жанр "Fiction"
books_n_publ = session.query(Book.title, Book.author, Book.genre, Publisher.name).join(Publisher).filter(Book.genre == 'Fiction').all()
for book in books_n_publ:
    print(book)