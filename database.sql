DROP TABLE authors, Books;

CREATE TABLE authors(
    author_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    birth_year INTEGER NOT NULL,
    country VARCHAR(35) NOT NULL
);

CREATE TABLE Books(
    Book_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(35) NOT NULL,
    category VARCHAR(35) NOT NULL,
    author_id INTEGER,
    cover VARCHAR(35) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    published_at INTEGER NOT NULL,
    CONSTRAINT fk_author
        FOREIGN KEY(author_id)
            REFERENCES authors(author_id)

);


INSERT INTO authors(name, last_name, birth_year, country)
VALUES('Dan Brown', 'Sacrilege', '1896', 'Greece'),
		('Agatha', 'Christie', '1967', 'Ireland'),
			('Paulo', 'Coelho', '1956', 'India'),
				('Ken', 'Follett', '1987', 'canada'),
					('John', 'Grisham', '1956', 'Ireland'),	
						('Stephen', 'King', '1966', 'Greece'),
						('Haruki', 'Murakami', '1898', 'England'),
							('James', 'Patterson', '1962', 'England');
							
SELECT * FROM authors

INSERT INTO Books(name, category, author_id, cover, published_at)
VALUES('The Mysterious Affair at Styles', 'Drama', '1', 'Affair at Styles', '1993'),
		('The Secret Adversary', 'Drama', '1', 'Adversary', '1985'),
		('The Murder on the Links', 'Thriller', '1', 'Adversary', '1978'),
		('The Man in the Brown Suit', 'Drama', '2', 'Affair at Styles', '1978'),
		('The Secret of Chimneys', 'Thriller', '2', 'Affair at Styles', '1967'),
		('The Murder of Roger Ackroyd', 'Drama', '2', 'Adversary', '1975'),
		('The Big Four', 'Thriller', '3', 'Adversary', '1965'),
		('The Mystery of the Blue Train', 'Drama', '3', 'Affair at Styles', '1992'),
		('The Seven Dials Mystery', 'Thriller', '3', 'Adversary', '1978'),
		('Why Did They Ask Evans', 'Drama', '4', 'Affair at Styles', '1967'),
		('Ask a Policeman', 'Thriller', '4', 'Adversary', '1996'),
		('Murder on the Orient Express', 'Drama', '4', 'Affair at Styles', '1967');

SELECT * FROM Books 

UPDATE Books SET cover = 'Hey Iam changing cover' WHERE book_id = 2;

UPDATE authors SET birth_year = 1996 WHERE author_id = 5;

SELECT * FROM Books;
SELECT * FROM Books LIKE '%A';
SELECT * FROM Books LIKE '%ANY%';
SELECT * FROM authors WHERE 2021-birth_year<60 ;
SELECT * FROM authors WHERE 2021-birth_year>40 ;
SELECT category, published_at FROM Books;
SELECT COUNT(*) FROM Books;
SELECT * FROM authors ORDER BY birth_year;

DELETE FROM authors WHERE country = 'Ireland';
DELETE FROM Books WHERE category = 'Drama';
DELETE FROM authors WHERE last_name LIKE 'H%'