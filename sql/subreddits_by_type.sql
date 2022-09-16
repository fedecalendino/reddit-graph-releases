SELECT 'TOTAL', COUNT(*) AS amount
	FROM subreddits
		WHERE type NOT IN ('non-existent', 'deleted')
UNION SELECT type, COUNT(*) AS amount
	FROM subreddits
		WHERE type NOT IN ('non-existent', 'deleted')
			GROUP BY type
				ORDER BY amount DESC