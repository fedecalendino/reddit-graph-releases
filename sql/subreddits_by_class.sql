SELECT type, nsfw, quarantined, COUNT(*) AS amount
	FROM subreddits
		WHERE type NOT IN ('non-existent', 'deleted')
			GROUP BY type, nsfw, quarantined