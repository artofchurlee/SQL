CREATE TABLE library_branch (
	branchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branchName VARCHAR(50) NOT NULL,
	branchAddress VARCHAR(100) NOT NULL
);

CREATE TABLE publisher (
	publisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	publisherAddress VARCHAR(100) NOT NULL,
	publisherPhone VARCHAR(50) NOT NULL
);

CREATE TABLE books (
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookTitle VARCHAR(100) NOT NULL,
	publisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisherName FOREIGN KEY REFERENCES publisher(publisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors (
	bookID INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	bookAuthor VARCHAR(50) NOT NULL,
);

CREATE TABLE book_copies (
	bookID INT NOT NULL CONSTRAINT fk_bookIDcopies FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_branchID FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE borrower (
	borrowerCard INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	borrowerName VARCHAR(50) NOT NULL,
	borrowerAddress VARCHAR(100) NOT NULL,
	borrowerPhone VARCHAR(50) NOT NULL,
);

CREATE TABLE book_loans (
	bookID INT NOT NULL CONSTRAINT fk_bookIDloans FOREIGN KEY REFERENCES books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_branchIDloans FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	borrowerCard INT NOT NULL CONSTRAINT fk_borrowerCard FOREIGN KEY REFERENCES borrower(borrowerCard) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut DATE,
	dateDue DATE
);

INSERT INTO library_branch
	(branchName, branchAddress)
	VALUES
	('Sharpstown', '123 N. Main St'),
	('Central', '234 W. Sesame St'),
	('North', '345 S. Lime Ave'),
	('South', '456 S. Banana St'),
	('East', '987 E. Apple Pl')
;

SELECT * FROM library_branch

INSERT INTO publisher
	(publisherName, publisherAddress, publisherPhone)
	VALUES
	('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000'),
	('Macmillan', '120 Broadway, New York, NY 10271', '800-221-7945'),
	('Penguin', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000')
;

SELECT * FROM publisher

INSERT INTO books
	(bookTitle, publisherName)
	VALUES
	('The Lost Tribe', 'Macmillan'),
	('1922', 'Simon & Schuster'),
	('The Dark Tower', 'Simon & Schuster'),
	('It', 'Simon & Schuster'),
	('Pet Sematary', 'Simon & Schuster'),
	('The Turn of the Key', 'Simon & Schuster'),
	('Ask Again, Yes', 'Simon & Schuster'),
	('East of Eden', 'Penguin'),
	('Arrow of God', 'Penguin'),
	('The Force Awakens', 'Penguin'),
	('Last Ones Left Alive', 'Macmillan'),
	('Wild Savage Stars', 'Macmillan'),
	('Learning From the Germans', 'Macmillan'),
	('Blind Spot', 'Macmillan'),
	('Human Relations and Other Difficulties', 'Macmillan'),
	('A Better Man', 'Macmillan'),
	('No Barriers', 'Macmillan'),
	('Moonlight Over Paris', 'HarperCollins'),
	('The Golden Son', 'HarperCollins'),
	('Somewhere in France', 'HarperCollins'),
	('The Illegal', 'HarperCollins'),
	('The Bone Labyrinth', 'HarperCollins')
;

SELECT * FROM books

INSERT INTO book_authors
	(bookID, bookAuthor)
	VALUES
	(1, 'Mark Lee'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Stephen King'),
	(5, 'Stephen King'),
	(6, 'Ruth Ware'),
	(7, 'Mary Beth Keane'),
	(8, 'John Steinbeck'),
	(9, 'Chinua Achebe'),
	(10, 'Alan Dean Foster'),
	(11, 'Sarah Davis-Goff'),
	(12, 'Kristina Perez'),
	(13, 'Susan Neiman'),
	(14, 'Brenda Novak'),
	(15, 'Mary-Kay Wilmers'),
	(16, 'Louise Penny'),
	(17, 'Erik Weihenmayer'),
	(18, 'Jennifer Robson'),
	(19, 'Shilpi Somaya Gowda'),
	(20, 'Jennifer Robson'),
	(21, 'Lawrence Hill'),
	(22, 'James Rollins')
;

SELECT * FROM book_authors

INSERT INTO book_copies
	(bookID, branchID, number_of_copies)
	VALUES
	(1, 1, 5),
	(1, 2, 2),
	(1, 3, 2),
	(1, 4, 3),
	(1, 5, 2),
	(2, 1, 3),
	(2, 2, 5),
	(2, 3, 5),
	(2, 4, 3),
	(2, 5, 2),
	(3, 3, 3),
	(3, 4, 2),
	(3, 5, 2),
	(4, 1, 3),
	(4, 2, 2),
	(4, 3, 3),
	(5, 2, 3), 
	(5, 3, 2),
	(5, 4, 2),
	(6, 1, 2),
	(6, 2, 2),
	(6, 5, 2),
	(7, 2, 2),
	(7, 3, 2),
	(7, 4, 3),
	(8, 5, 2),
	(9, 1, 3),
	(9, 2, 2),
	(10, 4, 2),
	(10, 5, 2),
	(11, 2, 2),
	(11, 3, 2),
	(11, 5, 2),
	(12, 1, 2),
	(12, 3, 2),
	(12, 5, 2),
	(13, 2, 2),
	(13, 4, 2),
	(14, 3, 2),
	(15, 5, 2),
	(16, 1, 3),
	(16, 5, 3),
	(17, 2, 2),
	(18, 3, 2),
	(19, 4, 2),
	(20, 5, 2),
	(21, 1, 3),
	(22, 2, 4),
	(22, 3, 3),
	(22, 4, 2)
;

SELECT * FROM book_copies

INSERT INTO borrower
	(borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	('Bobby McBobFace', '123 Bob Street', '222-555-1234'),
	('Jenny McJenFace', '123 Jen Street', '222-555-1235'),
	('Timmy McTimFace', '123 Tim Street', '222-555-1235'),
	('Tommy McTomFace', '123 Tom Street', '222-555-1236'),
	('Jonny McJonFace', '123 Jon Street', '222-555-1237'),
	('Tony McToeFace', '123 Toe Street', '222-555-1238'),
	('Nicky McNickFace', '123 Nick Street', '222-555-1239'),
	('Bonnie McBonFace', '123 Bon Street', '222-555-1240'),
	('Andy McAnnFace' , '123 Ann Street', '222-555-1241')
;

SELECT * FROM borrower

INSERT INTO book_loans
	(bookID, branchID, borrowerCard, dateOut, dateDue)
	VALUES
	(1, 1, 100, '2019-08-26', '2019-09-06'),
	(2, 1, 100, '2019-08-26', '2019-09-06'),
	(4, 1, 100, '2019-08-26', '2019-09-06'),
	(6, 1, 100, '2019-08-26', '2019-09-06'),
	(9, 1, 100, '2019-08-26', '2019-09-06'),
	(12, 1, 100, '2019-08-26', '2019-09-06'),
	(16, 1, 100, '2019-08-26', '2019-09-06'),
	(21, 1, 100, '2019-08-26', '2019-09-06'),
	(1, 1, 101, '2019-08-29', '2019-09-09'),
	(2, 2, 101, '2019-08-29', '2019-09-09'),
	(4, 2, 101, '2019-08-29', '2019-09-09'),
	(7, 3, 101, '2019-08-29', '2019-09-09'),
	(10, 5, 101, '2019-08-29', '2019-09-09'),
	(12, 3, 101, '2019-08-29', '2019-09-09'),
	(14, 3, 101, '2019-08-29', '2019-09-09'),
	(22, 4, 101, '2019-08-29', '2019-09-09'),
	(1, 4, 102, '2019-09-01', '2019-09-11'),
	(5, 3, 102, '2019-09-01', '2019-09-11'),
	(17, 2, 102, '2019-09-01', '2019-09-11'),
	(18, 3, 102, '2019-09-01', '2019-09-11'),
	(1, 5, 103, '2019-09-02', '2019-09-12'),
	(4, 3,  103, '2019-09-02', '2019-09-12'),
	(5, 3,  103, '2019-09-02', '2019-09-12'),
	(11, 5,  103, '2019-09-02', '2019-09-12'),
	(13, 4,  103, '2019-09-02', '2019-09-12'),
	(19, 4,  103, '2019-09-02', '2019-09-12'),
	(22, 3,  103, '2019-09-02', '2019-09-12'),
	(2, 4, 104, '2019-08-23', '2019-09-03'),
	(7, 4, 104, '2019-08-23', '2019-09-03'),
	(12, 5, 104, '2019-08-23', '2019-09-03'),
	(16, 1, 104, '2019-08-23', '2019-09-03'),
	(19, 4, 104, '2019-08-23', '2019-09-03'),
	(14, 1, 105, '2019-08-23', '2019-09-03'),
	(10, 4, 107, '2019-08-23', '2019-09-03'),
	(15, 5, 107, '2019-08-23', '2019-09-03'),
	(16, 5, 107, '2019-08-23', '2019-09-03'),
	(17, 2, 107, '2019-08-23', '2019-09-03'),
	(18, 3, 107, '2019-08-23', '2019-09-03'),
	(20, 5, 107, '2019-08-23', '2019-09-03'),
	(21, 1, 107, '2019-08-23', '2019-09-03'),
	(22, 2, 107, '2019-08-23', '2019-09-03'),
	(3, 3, 108, '2019-08-24', '2019-09-04'),
	(5, 3, 108, '2019-08-24', '2019-09-04'),
	(9, 2, 108, '2019-08-24', '2019-09-04'),
	(10, 5, 108, '2019-08-24', '2019-09-04'),
	(12, 5, 108, '2019-08-24', '2019-09-04'),
	(13, 4, 108, '2019-08-24', '2019-09-04'),
	(16, 5, 108, '2019-08-24', '2019-09-04'),
	(18, 3, 108, '2019-08-24', '2019-09-04'),
	(19, 4, 108, '2019-08-24', '2019-09-04'),
	(22, 4, 108, '2019-08-24','2019-09-04')
;

/*------------------------------
QUESTION 1 -How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
-------------------------------*/
SELECT a1.number_of_copies
FROM book_copies a1
INNER JOIN library_branch a2 ON a2.branchID = a1.branchID
INNER JOIN books a3 ON a3.bookID = a1.bookID
WHERE branchName = 'Sharpstown' AND bookTitle = 'The Lost Tribe'
;

/*--------------------------------
Q2 -How many copies of the book titled "The Lost Tribe" are owned by each library branch?
-------------------------------*/
SELECT a1.number_of_copies, a3.branchName
FROM book_copies a1
INNER JOIN books a2 ON a2.bookID = a1.bookID
INNER JOIN library_branch a3 ON a3.branchID = a1.branchID
WHERE bookTitle = 'The Lost Tribe'
;

/* ----------------------------------
Q3- Retrieve the names of all borrowers who do not have any books checked out.
---------------------------------*/

SELECT a1.borrowerName
FROM borrower a1
LEFT OUTER JOIN book_loans a2 ON a2.borrowerCard = a1.borrowerCard
WHERE a2.borrowerCard IS NULL 

/*-------------------------------------
Q4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
--------------------------------------*/

SELECT a2.bookTitle, a3.borrowerName, a3.borrowerAddress
FROM book_loans a1
INNER JOIN books a2 ON a2.bookID = a1.bookID
INNER JOIN borrower a3 ON a3.borrowerCard = a1.borrowerCard
WHERE dateDue = '2019-09-03'

/* ----------------------------------------
Q5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
-------------------------------------------*/

SELECT a1.branchName, COUNT(bookID)
FROM library_branch a1
INNER JOIN book_loans a2 ON a2.branchID = a1.branchID
GROUP BY branchName


/*-----------------------------------------------
Q6- Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
--------------------------------------------------*/

SELECT a1.borrowerName, a1.borrowerAddress, COUNT(bookID)
FROM borrower a1
INNER JOIN book_loans a2 ON a2.borrowerCard = a1.borrowerCard
GROUP BY borrowerName, borrowerAddress
HAVING COUNT(bookID) > 5


/*------------------------------------------------
Q7-  For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
---------------------------------------------------*/

SELECT a2.bookTitle, a3.number_of_copies
FROM book_authors a1
INNER JOIN books a2 ON a2.bookID = a1.bookID
INNER JOIN book_copies a3 ON a3.bookID = a1.bookID
INNER JOIN library_branch a4 ON a4.branchID = a3.branchID
WHERE bookAuthor = 'Stephen King' AND branchName = 'Central'