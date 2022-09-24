(
	SELECT '**TOTAL**' AS type_, COUNT(*) AS amount
		FROM subreddits
			WHERE type NOT IN ('non-existent', 'deleted')
)
UNION
(
	SELECT 
		CONCAT(
			'**' || type || '**',
			CASE WHEN nsfw THEN ' [nsfw]' ELSE '' END, 
			CASE WHEN quarantined THEN ' [quarantined]' ELSE '' END
		) AS type_,
		COUNT(*) AS amount
			FROM subreddits
				WHERE type NOT IN ('non-existent', 'deleted')
					GROUP BY type, nsfw, quarantined
)
ORDER BY amount DESC