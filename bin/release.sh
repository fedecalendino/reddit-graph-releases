source bin/env.sh


function dump() {
	NAME="$1"

	QUERY=$(cat "bin/sql/$NAME.sql")
	CSV="csv/$NAME.csv"

	echo " * fetching $NAME ($CSV)"

	PGPASSWORD=$DATABASE_PASSWORD psql \
		-c "COPY ($QUERY) TO STDOUT WITH CSV HEADER" \
		-h $DATABASE_HOST \
		-p $DATABASE_PORT \
		--username $DATABASE_USERNAME > $CSV
}


VERSION=$(date +"v%Y.%m.%d.%H%M%S")

echo "Releasing $VERSION..."
echo ""

dump "subreddits_by_type"
dump "subreddits"

dump "links_by_type"
dump "links"

echo " * generating readme file"
python3 bin/make_readme.py $VERSION
echo ""


echo " * pushing changes to github"
git add README.md
git add csv/*
git commit -m "Release $VERSION"
git push origin main
echo ""


echo " * making release on github..."
curl -X POST  -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $GITHUB_ACCESS_TOKEN" --data "{\"tag_name\": \"$VERSION\", \"target_commitish\": \"main\", \"name\": \"$VERSION\", \"body\": \"Release $VERSION\", \"draft\": false, \"prerelease\": false, \"generate_release_notes\": false }" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPOSITORY/releases"  
echo ""

echo ""
echo ""

echo "Finished 🚀"
echo ""

echo "* $(cat csv/subreddits_by_type.csv | grep TOTAL | sed 's/.*,//') subreddits "
echo "* $(cat csv/links_by_type.csv | grep TOTAL | sed 's/.*,//') links"
echo ""

echo "https://github.com/$GITHUB_OWNER/$GITHUB_REPOSITORY/releases/tag/$VERSION"
echo ""