#!/bin/bash
mysql -u root -p << QUERY_OUTPUT  
USE database1
SELECT COUNT(*) AS Total_users FROM users;
SELECT COUNT(*) AS Total_blogs FROM blogs;
SELECT COUNT(*) AS Total_posts FROM posts;

QUERY_OUTPUT

