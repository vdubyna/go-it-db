-- 2. Нормалізуйте таблицю infectious_cases до 3ї нормальної форми. Збережіть у цій же схемі дві таблиці з нормалізованими даними.
--
-- Виконайте запит SELECT COUNT(*) FROM infectious_cases , щоб ментор міг зрозуміти, скільки записів ви завантажили у базу даних із файла.

CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    Entity VARCHAR(100),
    Code VARCHAR(10),
    UNIQUE (Entity, Code)
);
CREATE TABLE infectious_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT,
    Year INT,
    Number_yaws INT,
    polio_cases INT,
    cases_guinea_worm INT,
    Number_rabies FLOAT,
    Number_malaria FLOAT,
    Number_hiv FLOAT,
    Number_tuberculosis FLOAT,
    Number_smallpox INT,
    Number_cholera_cases INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

INSERT INTO locations (Entity, Code)
SELECT DISTINCT Entity, Code
FROM pandemic;
-- 245 unique locations

INSERT INTO infectious_cases (
    location_id, Year, Number_yaws, polio_cases, cases_guinea_worm,
    Number_rabies, Number_malaria, Number_hiv,
    Number_tuberculosis, Number_smallpox, Number_cholera_cases
)
SELECT
    l.location_id,
    p.Year,
    p.Number_yaws,
    p.polio_cases,
    p.cases_guinea_worm,
    p.Number_rabies,
    p.Number_malaria,
    p.Number_hiv,
    p.Number_tuberculosis,
    p.Number_smallpox,
    p.Number_cholera_cases
FROM pandemic p
JOIN locations l ON p.Entity = l.Entity AND p.Code = l.Code;
-- 10521 cases

SELECT COUNT(*) FROM infectious_cases;

-- 3. Проаналізуйте дані:
-- Для кожної унікальної комбінації Entity та Code або їх id порахуйте середнє, мінімальне, максимальне значення та суму для атрибута Number_rabies.
-- 💡 Врахуйте, що атрибут Number_rabies може містити порожні значення ‘’ — вам попередньо необхідно їх відфільтрувати.
-- Результат відсортуйте за порахованим середнім значенням у порядку спадання.
-- Оберіть тільки 10 рядків для виведення на екран.
SELECT
    l.location_id,
    l.Entity,
    l.Code,
    AVG(ic.Number_rabies) AS avg_rabies,
    MIN(ic.Number_rabies) AS min_rabies,
    MAX(ic.Number_rabies) AS max_rabies,
    SUM(ic.Number_rabies) AS sum_rabies
FROM infectious_cases ic
JOIN locations l ON ic.location_id = l.location_id
WHERE ic.Number_rabies IS NOT NULL
GROUP BY l.location_id, l.Entity, l.Code
ORDER BY avg_rabies DESC
LIMIT 10;

-- 4. Побудуйте колонку різниці в роках.
-- Для оригінальної або нормованої таблиці для колонки Year побудуйте з використанням вбудованих SQL-функцій:
-- атрибут, що створює дату першого січня відповідного року,
-- 💡 Наприклад, якщо атрибут містить значення ’1996’, то значення нового атрибута має бути ‘1996-01-01’.
-- атрибут, що дорівнює поточній даті,
-- атрибут, що дорівнює різниці в роках двох вищезгаданих колонок.
-- 💡 Перераховувати всі інші атрибути, такі як Number_malaria, не потрібно.
SELECT
    location_id,
    Year,
    STR_TO_DATE(CONCAT(Year, '-01-01'), '%Y-%m-%d') AS start_of_year,
    CURDATE() AS today_date,
    TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(Year, '-01-01'), '%Y-%m-%d'),
        CURDATE()
    ) AS years_difference

FROM infectious_cases;

-- 5. Побудуйте власну функцію.
-- Створіть і використайте функцію, що будує такий же атрибут, як і в попередньому завданні: функція має приймати на вхід значення року, а повертати різницю в роках між поточною датою та датою, створеною з атрибута року (1996 рік → ‘1996-01-01’).
DROP FUNCTION IF EXISTS years_since;

DELIMITER //

CREATE FUNCTION years_since(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE start_date DATE;
    SET start_date = STR_TO_DATE(CONCAT(input_year, '-01-01'), '%Y-%m-%d');

    RETURN TIMESTAMPDIFF(YEAR, start_date, CURDATE());
END;
//

DELIMITER ;
-- Execute query
SELECT
    location_id,
    Year,
    years_since(Year) AS years_difference
FROM infectious_cases;
