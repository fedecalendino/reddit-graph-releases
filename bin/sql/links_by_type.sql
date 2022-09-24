(
	SELECT 
			'**TOTAL**' AS type_, 
			COUNT(*) AS amount
		FROM links LEFT JOIN subreddits ON links.target = subreddits.name
			WHERE subreddits.type NOT IN ('non-existent', 'deleted')
)
UNION 
(
	SELECT 
			'**' || links.type || '**' AS type_, 
			COUNT(*) AS amount
		FROM links LEFT JOIN subreddits ON links.target = subreddits.name
			WHERE subreddits.type NOT IN ('non-existent', 'deleted')
				GROUP BY links.type
)
	ORDER BY amount DESC
