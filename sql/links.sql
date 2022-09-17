SELECT 
		links.source,
		links.type,
		links.target,
		links.updated_at
	FROM links LEFT JOIN subreddits ON links.target = subreddits.name
		WHERE subreddits.type NOT IN ('non-existent', 'deleted')
			ORDER BY links.source, links.type, links.target
