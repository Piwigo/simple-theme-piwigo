.PHONY: less archive

less:
	lessc css/style.less > css/style.css
	lessc -x css/style.less > css/style.min.css

archive:
	sed -i "s/Version: .*/Version: $VERSION/" themeconf.inc.php
	git ci -m "new version $VERSION" themeconf.inc.php

	@echo "New tag for version $VERSION"
	git tag $VERSION

	@echo "Pushing to github"
	git push
	git push --tags

	git archive --format=zip --prefix=simple/ HEAD > ../simple-$VERSION.zip
	@echo "zip archive available: ../simple-$VERSION.zip"
