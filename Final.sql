create database db_library
go

create table library_branch (
	BranchID int primary key not null,
	BranchName varchar(50) not null,
	Address varchar(100) not null
);

create table publisher (
	PublisherName varchar(50) primary key not null,
	Address varchar(100) not null,
	Phone varchar(20) not null
);

create table borrower (
	CardNo varchar(50) primary key not null,
	Name varchar(50) not null,
	Address varchar(100) not null,
	Phone varchar(20) not null
);

create table books (
	BookID int primary key not null,
	Title varchar(100) not null,
	PublisherName varchar(50) not null constraint fk_PublisherName foreign key references publisher(PublisherName) on update cascade on delete cascade
);

create table book_copies (
	BookID int not null constraint fk_BookID foreign key references books(BookID) on update cascade on delete cascade, 
	BranchID int not null constraint fk_BranchID foreign key references library_branch(BranchID) on update cascade on delete cascade,
	Number_Of_Copies int not null
);

create table book_loans (
	BookID int not null constraint fk_BookID2 foreign key references books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID2 foreign key references library_branch(BranchID) on update cascade on delete cascade,
	CardNo varchar(50) not null constraint fk_CardNo foreign key references borrower(CardNo) on update cascade on delete cascade,
	DateOut varchar(20) not null,
	DateDue varchar(20) not null
);

create table book_authors (
	BookID int not null constraint fk_BookID3 foreign key references books(BookID) on update cascade on delete cascade,
	AuthorName varchar(50) not null
);

insert into library_branch
	(BranchID, BranchName, Address)
	values
	(100, 'Sharpstown', '1234 Elder Rd'),
	(101, 'Central', '5678 Lone Rd'),
	(102, 'Modern', '1289 Smock St'),
	(103, 'Honest', '4512 Uniform Ln')
;

select * from library_branch;

insert into publisher
	(PublisherName, Address, Phone)
	values
	('Books In Color', '1400 Hollow Rd', '503-888-1420'),
	('Books In Your Hand', '2390 Tubular Hwy', '503-888-1999')
;

select * from publisher;

insert into borrower
	(CardNo, Name, Address, Phone)
	values
	('1234567891011121', 'James Brown', '125 Yella Rd', '503-888-7490'),
	('9823764509127474', 'Elizabeth Yowen', '78904 Hollywood Blvd', '503-888-2478'),
	('1400004376340912', 'Frederick Sisco', '100 E Towns Rd', '503-888-5812'),
	('7575838329827354', 'Anthony Barbero', '52A S 22nd St', '503-888-7080'),
	('2300009874659021', 'Donald Heath', '78 Ridge St', '503-888-9993'),
	('8766544320985678', 'Austin Spring', '179H Euro Dr', '503-888-0098'),
	('8877668877887790', 'Dominic Youth', '4260 Penelope Rd', '503-888-7483'),
	('0988767651238907', 'Susan Gold', '2589 Swiss St', '503-888-8881'),
	('0987654321128763', 'Michael Standall', '109 S Portland Rd', '503-888-0000')
;

select * from borrower;

insert into books
	(BookID, Title, PublisherName)
	values
	(1, 'Pet Semetary', 'Books In Your Hand'),
	(2, 'It', 'Books In Color'),
	(3, 'The Lost Tribe', 'Books In Your Hand'),
	(4, 'Twilight', 'Books In Your Hand'),
	(5, 'Animal Farm', 'Books In Color'),
	(6, 'Jane Eyre', 'Books In Color'),
	(7, '1984', 'Books In Color'),
	(8, 'Harry Potter and the Sorcerers Stone', 'Books In Your Hand'),
	(9, 'The Kite Runner', 'Books In Your Hand'),
	(10, 'The Lord of the Rings', 'Books In Your Hand'),
	(11, 'Brave New World', 'Books In Color'),
	(12, 'The Hunger Games', 'Books In Your Hand'),
	(13, 'New Moon', 'Books In Color'),
	(14, 'The Odyssey', 'Books In Your Hand'),
	(15, 'Wuthering Heights', 'Books In Your Hand'),
	(16, 'The Cat in the Hat', 'Books In Your Hand'),
	(17, 'Angels & Demons', 'Books In Color'),
	(18, 'Fahrenheit 451', 'Books In Your Hand'),
	(19, 'Life of Pi', 'Books In Your Hand'),
	(20, 'Catching Fire', 'Books In Color'),
	(21, 'The Book Thief', 'Books In Color'),
	(22, 'Enders Game', 'Books In Your Hand'),
	(23, 'The Return of The King', 'Books In Color'),
	(24, 'Eclipse', 'Books In Your Hand'),
	(25, 'The Girl with the Dragon Tattoo', 'Books In Your Hand'),
	(26, 'Breaking Dawn', 'Books In Color'),
	(27, 'Mockingjay', 'Books In Color'),
	(28, 'Memoirs of a Geisha', 'Books In Color'),
	(29, 'Frankenstein', 'Books In Your Hand'),
	(30, 'Of Mice and Men', 'Books In Color'),
	(31, 'The Giver', 'Books In Your Hand'),
	(32, 'The Hitchhikers Guide to the Galaxy', 'Books In Your Hand'),
	(33, 'The Lovely Bones', 'Books In Color'),
	(34, 'The Golden Compass', 'Books In Your Hand'),
	(35, 'The Road', 'Books In Color'),
	(36, 'The Stranger', 'Books In Your Hand'),
	(37, 'A Wrinkle in Time', 'Books In Color'),
	(38, 'A Tale of Two Cities', 'Books In Your Hand'),
	(39, 'The Picture of Dorian Gray', 'Books In Color'),
	(40, 'Moby Dick', 'Books In Color')
;

select * from books;

insert into book_copies
	(BookID, BranchID, Number_Of_Copies)
	values
	(1, 101, 2),
	(2, 101, 7),
	(3, 100, 5),
	(4, 100, 3),
	(5, 100, 4),
	(6, 100, 5),
	(7, 100, 3),
	(8, 100, 2),
	(9, 100, 2),
	(10, 100, 9),
	(11, 100, 7),
	(12, 100, 3),
	(13, 101, 5),
	(14, 101, 2),
	(15, 101, 2),
	(16, 101, 3),
	(17, 101, 2),
	(18, 101, 3),
	(19, 101, 2),
	(20, 101, 3),
	(21, 102, 4),
	(22, 102, 2),
	(23, 102, 4),
	(24, 102, 3),
	(25, 102, 2),
	(26, 102, 2),
	(27, 102, 2),
	(28, 102, 3),
	(29, 102, 2),
	(30, 102, 3),
	(31, 103, 2),
	(32, 103, 5),
	(33, 103, 3),
	(34, 103, 3),
	(35, 103, 4),
	(36, 103, 3),
	(37, 103, 2),
	(38, 103, 3),
	(39, 103, 2),
	(40, 103, 5)
;

select * from book_copies;

insert into book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	(1, 101, '1234567891011121', '1/20', '1/27'),
	(2, 101, '1234567891011121', '1/20', '1/27'),
	(3, 100, '1234567891011121', '1/20', '1/27'),
	(4, 100, '1234567891011121', '1/20', '1/27'),
	(5, 100, '1234567891011121', '1/20', '1/27'),
	(6, 100, '9823764509127474', '3/1', '3/8'),
	(7, 100, '9823764509127474', '3/1', '3/8'),
	(8, 100, '9823764509127474', '3/1', '3/8'),
	(9, 100, '9823764509127474', '3/1', '3/8'),
	(10, 100, '9823764509127474', '3/1', '3/8'),
	(11, 100, '1400004376340912', '2/12', '2/19'),
	(12, 100, '1400004376340912', '2/12', '2/19'),
	(13, 101, '1400004376340912', '2/12', '2/19'),
	(14, 101, '1400004376340912', '2/12', '2/19'),
	(15, 101, '1400004376340912', '2/12', '2/19'),
	(16, 101, '7575838329827354', '1/2', '1/9'),
	(17, 101, '7575838329827354', '1/2', '1/9'),
	(18, 101, '7575838329827354', '1/2', '1/9'),
	(19, 101, '7575838329827354', '1/2', '1/9'),
	(20, 101, '7575838329827354', '1/2', '1/9'),
	(21, 102, '2300009874659021', '1/15', '1/22'),
	(22, 102, '2300009874659021', '1/15', '1/22'),
	(23, 102, '2300009874659021', '1/15', '1/22'),
	(24, 102, '2300009874659021', '1/15', '1/22'),
	(25, 102, '2300009874659021', '1/15', '1/22'),
	(26, 102, '8766544320985678', '3/30', '4/6'),
	(27, 102, '8766544320985678', '3/30', '4/6'),
	(28, 102, '8766544320985678', '3/30', '4/6'),
	(29, 102, '8766544320985678', '3/30', '4/6'),
	(30, 102, '8766544320985678', '3/30', '4/6'),
	(31, 103, '8877668877887790', '2/3', '2/10'),
	(32, 103, '8877668877887790', '2/3', '2/10'),
	(33, 103, '8877668877887790', '2/3', '2/10'),
	(34, 103, '8877668877887790', '2/3', '2/10'),
	(35, 103, '8877668877887790', '2/3', '2/10'),
	(36, 103, '0988767651238907', '1/1', '1/8'),
	(37, 103, '0988767651238907', '1/1', '1/8'),
	(38, 103, '0988767651238907', '1/1', '1/8'),
	(39, 103, '0988767651238907', '1/1', '1/8'),
	(40, 103, '0988767651238907', '1/1', '1/8'),
	(1, 101, '0988767651238907', '1/1', '1/8'),
	(2, 101, '0988767651238907', '1/1', '1/8'),
	(3, 100, '0988767651238907', '1/1', '1/8'),
	(4, 100, '0988767651238907', '1/1', '1/8'),
	(5, 100, '0988767651238907', '1/1', '1/8'),
	(6, 100, '8766544320985678', '3/30', '4/6'),
	(7, 100, '8766544320985678', '3/30', '4/6'),
	(8, 100, '8766544320985678', '3/30', '4/6'),
	(9, 100, '8766544320985678', '3/30', '4/6'),
	(10, 100, '8766544320985678', '3/30', '4/6')
;

select * from book_loans;

insert into book_authors
	(BookID, AuthorName)
	values
	(1, 'Stephen King'),
	(2, 'Stephen King'),
	(3, 'Matthew Caldwell'),
	(4, 'Stephenie Meyer'),
	(5, 'George Orwell'),
	(6, 'Charlotte Bronte'),
	(7, 'George Orwell'),
	(8, 'J. K. Rowling'),
	(9, 'Khaled Hosseini'),
	(10, 'J. R. R. Tolkien'),
	(11, 'Aldous Huxley'),
	(12, 'Suzanne Collins'),
	(13, 'Stephenie Meyer'),
	(14, 'Homer'),
	(15, 'Emily Bronte'),
	(16, 'Dr. Seuss'),
	(17, 'Dan Brown'),
	(18, 'Ray Bradbury'),
	(19, 'Yann Martel'),
	(20, 'Suzanne Collins'),
	(21, 'Markus Zusak'),
	(22, 'Orson Scott Card'),
	(23, 'J. R. R. Tolkien'),
	(24, 'Stephenie Meyer'),
	(25, 'Stieg Larsson'),
	(26, 'Stephenie Meyer'),
	(27, 'Suzanne Collins'),
	(28, 'Arthur Golden'),
	(29, 'Mary Shelley'),
	(30, 'John Steinbeck'),
	(31, 'Lois Lowry'),
	(32, 'Douglas Adams'),
	(33, 'Alice Sebold'),
	(34, 'Philip Pullman'),
	(35, 'Cormac McCarthy'),
	(36, 'Albert Camus'),
	(37, 'Madeleine LEngle'),
	(38, 'Charles Dickens'),
	(39, 'Oscar Wilde'),
	(40, 'Herman Melville')
;

select * from book_authors;

select
	a1.Title, a2.Number_Of_Copies, a3.BranchName
	from books a1
	inner join book_copies a2 on a2.BookID = a1.BookID
	inner join library_branch a3 on a3.BranchID = a2.BranchID
	where BranchName = 'Sharpstown'
	and Title = 'The Lost Tribe'
;

select
	a1.Title, a2.Number_Of_Copies, a3.BranchName
	from books a1
	inner join book_copies a2 on a2.BookID = a1.BookID
	inner join library_branch a3 on a3.BranchID = a2.BranchID
	where Title = 'The Lost Tribe'
;

select
	a1.Name
	from borrower a1
	full outer join book_loans a2 on a2.CardNo = a1.CardNo
	where BookID is null
;

select
	a1.Title, a2.Name, a2.Address
	from books a1
	inner join book_loans a3 on a3.BookID = a1.BookID
	inner join library_branch a4 on a3.BranchID = a4.BranchID
	inner join borrower a2 on a2.CardNo = a3.CardNo
	where BranchName = 'Sharpstown'
	and DateDue = '3/8'
;

select
	BranchName, count(*) as 'number box: '
	from library_branch a1
	inner join book_loans a2 on a2.BranchID = a1.BranchID
	group by BranchName
;

select
	a1.Name, a1.Address, count(*) as 'Book Number: '
	from borrower a1
	inner join book_loans a2 on a2.CardNo = a1.CardNo
	group by a1.Name, a1.Address
	having count(*) > 5
;

select
	a1.Title, a2.Number_Of_Copies
	from books a1
	inner join book_copies a2 on a2.BookID = a1.BookID
	inner join library_branch a3 on a3.BranchID = a2.BranchID
	inner join book_authors a4 on a4.BookID = a1.BookID
	where AuthorName = 'Stephen King'
	and BranchName = 'Central'
;