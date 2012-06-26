.PHONY: less archive js

less:
	lessc css/style.less > css/style.css
	lessc -x css/style.less > css/style.min.css
	cat css/{bootstrap.min.css,bootstrap-responsive.min.css,style.css} > tmp.css
	mv tmp.css css/style.css
	cat css/{bootstrap.min.css,bootstrap-responsive.min.css,style.min.css} > tmp.css
	mv tmp.css css/style.min.css

js:
	cat js/bootstrap-* > js/bootstrap.js
	uglifyjs js/bootstrap.js > js/bootstrap.min.js

archive:
	sed -i "s/Version: .*/Version: $(VERSION)/" themeconf.inc.php
	git ci -m "new version $(VERSION)" themeconf.inc.php

	@echo "New tag for version $(VERSION)"
	git tag $(VERSION)

	@echo "Pushing to github"
	git push
	git push --tags

	git archive --format=zip --prefix=simpleng/ HEAD > ../simpleng-$(VERSION).zip
	@echo "zip archive available: ../simpleng-$(VERSION).zip"
