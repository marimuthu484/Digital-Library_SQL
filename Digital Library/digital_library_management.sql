CREATE TABLE Books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    category VARCHAR2(50),
    author VARCHAR2(100)
);


drop table Students;

CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    course VARCHAR2(50),
    join_date DATE
    status VARCHAR(20);
);


CREATE TABLE Issuedbooks (
    issue_id NUMBER PRIMARY KEY,
    book_id NUMBER,
    student_id NUMBER,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


INSERT INTO Books VALUES (1, 'Java', 'Programming', 'James Gosling');
INSERT INTO Books VALUES (2, 'English Grammar', 'Education', 'Ravi');
INSERT INTO Books VALUES (3, 'World History', 'History', 'Suresh');
INSERT INTO Books VALUES (4, 'Data Science Intro', 'Science', 'Anand');
INSERT INTO Books VALUES (5, 'C Programming', 'Programming', 'Arun');

Select * from Books;

INSERT INTO Students VALUES (101, 'Arun', 'BE', DATE '2021-06-10','active');
INSERT INTO Students VALUES (102, 'Kumar', 'BCom', DATE '2020-07-15','active');
INSERT INTO Students VALUES (103, 'Karthik', 'BCA', DATE '2019-08-20','active');
INSERT INTO Students VALUES (104, 'Mari', 'BE', DATE '2022-01-05','active');
INSERT INTO Students VALUES (105, 'Ramesh', 'BSc', DATE '2018-03-12','active');

Select * from Students;


INSERT INTO Issuedbooks VALUES (1, 1, 101, DATE '2026-03-01', DATE '2026-3-10');
INSERT INTO Issuedbooks VALUES (2, 2, 102, DATE '2026-03-22', NULL);
INSERT INTO Issuedbooks VALUES (3, 3, 103, DATE '2025-12-15', NULL);
INSERT INTO Issuedbooks VALUES (4, 4, 104, DATE '2026-03-05', DATE '2025-12-12');
INSERT INTO Issuedbooks VALUES (5, 5, 101, DATE '2026-03-08', NULL);


Select * from Issuedbooks;


Select s.student_name, b.title, i.issue_date
FROM Issuedbooks i
JOIN Students s ON i.student_id = s.student_id
JOIN Books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL
AND i.issue_date < SYSDATE - 14;


SELECT b.category, COUNT(i.issue_id) AS total_count
FROM Books b
JOIN Issuedbooks i ON b.book_id = i.book_id
GROUP BY b.category
ORDER BY total_count DESC;


UPDATE Students SET status = 'Inactive'
WHERE student_id NOT IN (
    SELECT student_id FROM Issuedbooks
    WHERE issue_date >= SYSDATE - 365*3
);
