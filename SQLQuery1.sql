use ubp
GO

SELECT last_name, title_blog 
    FROM users u
	LEFT JOIN blogs b
	ON u.id=b.user_id
GO

SELECT last_name, title_blog 
    FROM users u
	LEFT JOIN blogs b
	ON u.id=b.user_id
	WHERE b.user_id is NULL
GO

SELECT last_name, title_blog 
    FROM users u
	RIGHT JOIN blogs b
	ON u.id=b.user_id
GO

SELECT last_name, title_blog 
    FROM users u
	RIGHT JOIN blogs b
	ON u.id=b.user_id
	WHERE u.id is NULL
GO

SELECT last_name, title_blog 
    FROM users u
	INNER JOIN blogs b
	ON u.id=b.user_id
GO

SELECT last_name, title_blog 
    FROM users u
	FULL OUTER JOIN blogs b
	ON u.id=b.user_id
GO

SELECT last_name, title_blog 
    FROM users u
	FULL OUTER JOIN blogs b
	ON u.id=b.user_id
	WHERE u.id is NULL
	OR b.user_id is NULL
GO