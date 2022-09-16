SELECT 
	name,
	type,
	title,
	description,
	subscribers,
	nsfw,
	quarantined,
	color,
	img_banner,
	img_icon,
	created_at,
	updated_at
FROM subreddits
	WHERE type NOT IN ('non-existent', 'deleted')
		ORDER BY name
