#!/bin/bash


echo SUMMARY:
users=$(echo "SELECT COUNT(*) FROM users" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Total users: $users"
blogs=$(echo "SELECT COUNT(*) FROM blogs" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Total blogs: $blogs"
posts=$(echo "SELECT COUNT(*) FROM posts" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Total posts: $posts"





echo BLOGS:
users_with_blogs=$(echo "SELECT email FROM users, blogs WHERE blogs.user_id = users.id" | mysql -u mike -p'P1ok2ak!' database1 )
echo "Users with blogs:$users_with_blogs"
users_without_blogs=$(echo "SELECT email FROM users WHERE id NOT IN (SELECT user_id from blogs)" | mysql -u mike -p'P1ok2ak!' database1 )
echo "Users without blogs:$users_without_blogs"
oldest_blog=$(echo "SELECT email, title_blog, created AS date FROM users, blogs WHERE created = (select MAX(created) from blogs) AND blogs.user_id = users.id" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Oldest blog: $oldest_blog"
newest_blog=$(echo "SELECT email, title_blog, created AS date FROM users, blogs WHERE created = (select MIN(created) from blogs) AND blogs.user_id = users.id" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Newest blog: $newest_blog"









echo POSTS:
blogs_whith_no_posts=$(echo "SELECT count(*) FROM posts, blogs WHERE blogs.user_id != posts.blog_id" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Blogs with no posts:$blogs_with_no_posts"
longest_blog_title=$(echo "SELECT MAX(CHAR_LENGTH(title_blog)) FROM blogs" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Longest_blog_title: $longest_blog_title"
shortest_blog_title=$(echo "SELECT MIN(CHAR_LENGTH(title_blog)) FROM blogs" | mysql -u mike -p'P1ok2ak!' database1 | tail -1)
echo "Shortest blog title:$shortest_blog_title"

