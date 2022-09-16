SELECT 
		relations.source,
		relations.type,
		relations.target,
		relations.updated_at
	FROM relations LEFT JOIN subreddits ON relations.target = subreddits.name
		WHERE subreddits.type NOT IN ('non-existent', 'deleted')
			ORDER BY relations.source, relations.type, relations.target
