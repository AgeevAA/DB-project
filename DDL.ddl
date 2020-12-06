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

CREATE TABLE ARTICLE_THEMES (
	article_id       INT NOT NULL,
	theme_id        INT NOT NULL,
	primary key (article_id, theme_id),
	FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id),
	FOREIGN KEY (theme_id) REFERENCES THEME(theme_id)
) ;

CREATE TABLE THEME (
	theme_id       INT PRIMARY KEY,
	body           VARCHAR(50)
) ;

CREATE TABLE CLIENT_SOURCEGENRE (
	client_id           INT NOT NULL,
	sgenre_id  	    INT NOT NULL,
	primary key (client_id, sgenre_id),
	FOREIGN KEY (client_id) REFERENCES CLIENT(client_id),
	FOREIGN KEY (sgenre_id) REFERENCES GENRE(sgenre_id)
) ;

CREATE TABLE SOURCE_SOURCEGENRE (
	source_id           INT NOT NULL,
	sgenre_id  	    INT NOT NULL,
	primary key (source_id, sgenre_id),
	FOREIGN KEY (source_id) REFERENCES SOURCES(source_id),
	FOREIGN KEY (sgenre_id) REFERENCES GENRE(sgenre_id)
) ;

CREATE TABLE GENRE (
	sgenre_id  INT PRIMARY KEY, 
	body            VARCHAR(50)
) ;

CREATE TABLE CLIENT_LANGUAGES (
	client_id      INT NOT NULL,
	lang_id        INT NOT NULL,
	primary key (client_id, lang_id),
	FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id),
	FOREIGN KEY (lang_id) REFERENCES LANGUAGES(lang_id)
) ;

CREATE TABLE SOURCES_LANGUAGES (
	source_id      INT NOT NULL,
	lang_id        INT NOT NULL,
	primary key (source_id, lang_id),
	FOREIGN KEY (source_id) REFERENCES SOURCES(source_id),
	FOREIGN KEY (lang_id) REFERENCES LANGUAGES(lang_id)
) ;

CREATE TABLE ARTICLES_LANGUAGES (
	article_id      INT NOT NULL,
	lang_id        INT NOT NULL,
	primary key (article_id, lang_id),
	FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id),
	FOREIGN KEY (lang_id) REFERENCES LANGUAGES(lang_id)
) ;

CREATE TABLE LANGUAGES (
	lang_id  INT PRIMARY KEY,
	body     VARCHAR(25)
) ;

CREATE TABLE CLIENT_WORDS (
	client_id      INT NOT NULL,
	word_id        INT NOT NULL,
	primary key (client_id, word_id),
	FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id),
	FOREIGN KEY (word_id) REFERENCES WORDS(word_id)
) ;

CREATE TABLE WORDS (
	word_id		INT PRIMARY KEY,
	body            VARCHAR(50)
) ;

CREATE TABLE WORD_SENTENCES (
	word_id        INT NOT NULL,
	sentence_id    INT NOT NULL,
	primary key (word_id, sentence_id),
	FOREIGN KEY (word_id) REFERENCES WORDS(word_id),
	FOREIGN KEY (sentence_id) REFERENCES SENTENCES(sentence_id)
) ;

CREATE TABLE SENTENCES (
	sentence_id       INT PRIMARY KEY,
	body              BLOB(100000)
) ;

CREATE TABLE SENTENCES_ARTICLES (
	sentence_id    INT NOT NULL,
	article_id     INT NOT NULL,
	primary key (sentence_id, article_id),
	FOREIGN KEY (sentence_id) REFERENCES SENTENCES(sentence_id),
	FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id)
) ;

CREATE TABLE SOURCES (
	source_id      INT PRIMARY KEY
) ;

CREATE TABLE ARTICLES (
	article_id     INT PRIMARY KEY,
	body           BLOB(100000),
	article_url    VARCHAR(100),
	published_year INT,
	source_id      INT,
    FOREIGN KEY (source_id) REFERENCES SOURCES(source_id) 
) ;
