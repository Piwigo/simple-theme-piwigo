.PHONY: archive css js

css:
	@echo "Build css with boostrap and recess"
	recess --compress css/style.less > css/style.min.css
	recess --compress bootstrap/less/responsive.less > css/bootstrap-responsive.min.css

# Watch less files
watch:
	@echo "Watching less files..."
	recess css/style.less:css/style.min.css --watch .

js:
	cat bootstrap/js/{bootstrap-transition.js,bootstrap-tooltip.js,bootstrap-tab.js,bootstrap-collapse.js,bootstrap-dropdown.js} > js/bootstrap.js
	uglifyjs js/bootstrap.js -nc > js/bootstrap.min.js
	rm js/bootstrap.js


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
