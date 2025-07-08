
-- Заповнення таблиці "authors" тестовими даними
INSERT INTO authors (author_name) VALUES
    ('Джоан Роулінг'),
    ('Джордж Орвелл');

-- Заповнення таблиці "genres" тестовими даними
INSERT INTO genres (genre_name) VALUES
    ('Фантастика'),
    ('Антиутопія');

-- Заповнення таблиці "books" тестовими даними
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
    ('Гаррі Поттер і філософський камінь', 1997, 1, 1),
    ('1984', 1949, 2, 2);

-- Заповнення таблиці "users" тестовими даними
INSERT INTO users (username, email) VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com');

-- Заповнення таблиці "borrowed_books" тестовими даними
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
    (1, 1, '2023-05-01', '2023-05-15'),
    (2, 2, '2023-05-10', NULL);