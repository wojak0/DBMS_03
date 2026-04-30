-- 4a: Selection
SELECT * FROM copy WHERE shelf_loc LIKE 'A%';

-- 4b: Projection
SELECT title, pub_year FROM book;

-- 4c: Composition
SELECT isbn, shelf_loc FROM copy WHERE shelf_loc >= 'B';

-- 4d: Equi-Join
SELECT member.full_name, book.title FROM loan JOIN member ON loan.member_no = member.member_no JOIN copy ON loan.copy_no = copy.copy_no JOIN book ON copy.isbn = book.isbn WHERE loan.return_date IS NULL;

-- 4e: Left Outer Join
SELECT m.full_name, COUNT(l.member_no) AS active_loans FROM member AS m LEFT OUTER JOIN loan AS l ON m.member_no = l.member_no AND l.return_date IS NULL GROUP BY m.member_no, m.full_name;

-- 4f: Set Difference
SELECT isbn FROM book EXCEPT SELECT isbn FROM copy JOIN loan ON copy.copy_no = loan.copy_no;
