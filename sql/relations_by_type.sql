SELECT 'TOTAL', COUNT(*) AS amount
	FROM relations LEFT JOIN subreddits ON relations.target = subreddits.name
		WHERE subreddits.type NOT IN ('non-existent', 'deleted')
UNION SELECT relations.type, COUNT(*) AS amount
	FROM relations LEFT JOIN subreddits ON relations.target = subreddits.name
		WHERE subreddits.type NOT IN ('non-existent', 'deleted')
			GROUP BY relations.type
				ORDER BY amount DESC
