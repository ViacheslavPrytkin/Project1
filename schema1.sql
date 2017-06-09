CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE INDEX inx_first_name ON users (first_name);
CREATE INDEX inx_last_name ON users (last_name);
CREATE UNIQUE INDEX inx_email ON users (email);

CREATE TABLE blogs (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    title_blog VARCHAR(255) DEFAULT NULL ,
    description VARCHAR(500) DEFAULT NULL,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT blogs_fk1  FOREIGN KEY (user_id)  REFERENCES users (id)
);

CREATE TABLE posts (
    id INT(11) NOT NULL AUTO_INCREMENT,
    blog_id INT(11) NOT NULL,
    title_post VARCHAR(255),
    body TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT posts_fk1  FOREIGN KEY (blog_id)  REFERENCES blogs (id)
);

INSERT INTO users (first_name,last_name,email)
    VALUES ('masha','poki','mashap@gmail.com'),
    ('katya','moki','katyam@gmail.com'),
    ('tom','koki','tomk@gmail.com'),
    ('max','soki','maxsgmail.com'),
    ('slava','poki','slavap@gmail.com'),
    ('rob','moki','robm@gmail.com'),
    ('mike','goki','mikeg@gmail.com'),
    ('nick','loki','nickl@gmail.com'),
    ('john','doki','johnd@gmail.com'),
    ('don','foki','donf@gmail.com')
;

INSERT INTO blogs (user_id, title_blog, description)
    VALUES (1,'PHP','Creating blogs for users by using PHP'),
    (3,'SQL','Automatic Updating for TIMESTAMP'),
    (5,'C++','Object'),
    (8,'C#', 'Integer')
;

INSERT INTO posts (blog_id,title_post, body)
    VALUES (3,'C++','It is very hard to find correct information'),
    (2,'SQL','Automatic Initialization and Updating for TIMESTAMP and DATETIME'),
    (2,'SQL','Installing and Upgrading MySQL'),
    (2,'SQL','VARCHAR'),
    (3,'C++','How to use objects')
;

UPDATE blogs SET created = '2017-06-06' WHERE id=2;

UPDATE blogs SET created = '2017-06-07' WHERE id=3;

CREATE VIEW amount_posts AS SELECT COUNT(*) AS x FROM posts;
CREATE VIEW amount_blogs AS SELECT COUNT(*) AS y FROM blogs;




SELECT *FROM users, blogs, posts 
    WHERE blogs.user_id =users.id AND posts.blog_id =blogs.id
;



