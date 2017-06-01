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

INSERT INTO blogs (title_blog, description)
    VALUES ('PHP','Creating blogs for users by using PHP'),
    ('SQL','Automatic Updating for TIMESTAMP'),
    ('C++','Object'),
    ('C#', 'Integer')
;

INSERT INTO posts (title_post, body)
    VALUES ('C++','It is very hard to find correct information'),
   ('SQL','Automatic Initialization and Updating for TIMESTAMP and DATETIME'),
   ('SQL','Installing and Upgrading MySQL'),
   ('SQL','VARCHAR'),
   ('C++','How to use objects')
;

SELECT *
    FROM users u
    LEFT JOIN blogs b ON u.id=b.blog_id
    LEFT JOIN posts p ON b.blog_id=p.post_id
;


