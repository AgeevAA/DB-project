CREATE DATABASE BooksNews;

CREATE TABLE CLIENT (
	client_id       INT PRIMARY KEY,
	numexamples     INT
) ;

CREATE TABLE CLIENT_THEMES (
	client_id       INT NOT NULL,
	theme_id        INT NOT NULL,
	primary key (client_id, theme_id),
	FOREIGN KEY (client_id) REFERENCES CLIENT(client_id),
	FOREIGN KEY (theme_id) REFERENCES THEME(theme_id)
) ;

CREATE TABLE THEME (
	theme_id       INT PRIMARY KEY
) ;

CREATE TABLE CLIENT_SOURCEGENRE (
	client_id           INT NOT NULL,
	sgenre_id  	    INT NOT NULL,
	primary key (client_id, sgenre_id),
	FOREIGN KEY (client_id) REFERENCES CLIENT(client_id),
	FOREIGN KEY (sgenre_id) REFERENCES SOURCEGENRE(sgenre_id)
) ;

CREATE TABLE SOURCEGENRE (
	sgenre_id  INT PRIMARY KEY
) ;

CREATE TABLE CLIENT_LANGUAGES (
	client_id      INT NOT NULL,
	lang_id        INT NOT NULL,
	primary key (client_id, lang_id),
	FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id),
	FOREIGN KEY (lang_id) REFERENCES LANGUAGES(lang_id)
) ;

CREATE TABLE LANGUAGES (
	lang_id  INT PRIMARY KEY
) ;

CREATE TABLE CLIENT_WORDS (
	client_id      INT NOT NULL,
	word_id        INT NOT NULL,
	primary key (client_id, word_id),
	FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id),
	FOREIGN KEY (word_id) REFERENCES WORDS(word_id)
) ;

CREATE TABLE WORDS (
	word_id		INT PRIMARY KEY
) ;

CREATE TABLE WORD_SENTENCES (
	word_id        INT NOT NULL,
	sentence_id    INT NOT NULL,
	primary key (word_id, sentence_id),
	FOREIGN KEY (word_id) REFERENCES WORDS(word_id),
	FOREIGN KEY (sentence_id) REFERENCES SENTENCES(sentence_id)
) ;

CREATE TABLE SENTENCES (
	sentence_id       INT PRIMARY KEY
) ;

CREATE TABLE SENTENCES_ARTICLES (
	sentence_id    INT NOT NULL,
	article_id     INT NOT NULL,
	primary key (sentence_id, article_id),
	FOREIGN KEY (sentence_id) REFERENCES SENTENCES(sentence_id),
	FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id)
) ;

CREATE TABLE SOURCES (
	source_id      INT PRIMARY KEY,
	genre          VARCHAR(30),
	lang           VARCHAR(30)
) ;

CREATE TABLE ARTICLES (
	article_id     INT PRIMARY KEY,
	article_url    VARCHAR(1000),
	lang           VARCHAR(30),
	theme          VARCHAR(30),
	published_year INT,
	source_id      INT,
    FOREIGN KEY (source_id) REFERENCES SOURCES(source_id) 
) ;
