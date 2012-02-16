.PHONY: less

less:
	lessc css/style.less > css/style.css
	lessc -x css/style.less > css/style.min.css
