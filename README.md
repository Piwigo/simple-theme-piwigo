SimpleNG theme for Piwigo
=========================

*SimpleNG* is a complete redesign of the *Simple Grey* theme, taking advantage
of the new features of the web (HTML5 and CSS3) and based on Bootstrap. The
old version (*Simple Grey*) is still available on
[piwigo extensions](http://fr.piwigo.org/ext/extension_view.php?eid=308) and
is maintained by the Piwigo team.

[![screenshot][2]][1]

[1]: https://raw.github.com/saimn/simple-theme-piwigo/master/screenshot.large.jpg
[2]: https://raw.github.com/saimn/simple-theme-piwigo/master/screenshot.png

Features
--------

* responsive,
* HTML5 and CSS3,
* use [bootstrap](http://twitter.github.com/bootstrap/),
* use the *Open Sans* font.

Download
--------

* Use the builtin theme manager in Piwigo's admin interface,
* Or download the archive and extract it in ``your-gallery/theme/simpleng/``.
* [Piwigo extensions](http://fr.piwigo.org/ext/extension_view.php?eid=602)
* [Source code (github)](http://github.com/saimn/simple-theme-piwigo)

Licence
-------

This theme is licensed under the GNU General Public License. See LICENSE for
details.

Customize
---------

This theme is based on the [less](http://lesscss.org/) sources of bootstrap.
To customize it, you must install some
[dependencies](https://github.com/twitter/bootstrap#compiling-css-and-javascript).
In short, install nodejs, then `npm install recess uglify-js`. Windows users
can use a gui like [winless](http://winless.org/).

Then, you will need to get the sources with git. You can fork on github (if
you want to publish your theme later or submit a pull request) or get the
sources directly with git:

    git clone https://github.com/saimn/simple-theme-piwigo.git

Get the latest release (3.1.0 here):

    git checkout 3.1.O

Then get the bootstrap submodule:

    git submodule update --init

To compile simpleng's css and javascript sources, you can then use `make css`
and `make js`. `make watch` will watch the files to automatically compile the
css. The main file to edit is `css/styles.less`. You can also override
bootstrap variables (see `bootstrap/less/variables.less` for a complete list).


Changelog
---------

### version 3.2.1 (04/08/2014)

- Fix photo admin link.

### version 3.2.0 (19/03/2014)

- piwigo 2.6 compatibility

### version 3.1.3 (14/07/2013)

- Remove extra get_combined_scripts that was breaking the rating.
- css fix for Language Switch.

### version 3.1.2 (20/05/2013)

* Update Bootstrap to v2.3.2
* Add the #thumbnails id

### version 3.1.1 (18/04/2013)

* Another bugfix for voids in the thumbnails page.
* Reuse bootstrap variables when possible.
* Add some doc on how to customize the theme.

### version 3.1.0 (23/03/2013)

* Remove infinitescroll as it doesn't work.
* Better use of `GALLERY_TITLE` and `PAGE_BANNER`: Use `GALLERY_TITLE` for the
  navbar, where the title must be short and without html tags, and let users
  use `PAGE_BANNER` for what they want.
* Minor fixes: mobile url, ...
* Template fixes for piwigo 2.5: comments, navbar.
* Icon for categories with new images.
* Update bootstrap to v2.3.1
* Update jquery to 1.9.1
* Add bootstrap as a submodule.
* Center the footer text.
* Fix slideshow buttons that were not clickable.

### version 3.0.1 (05/12/2012)

* Switch to recess.
* Bugfix for voids in the thumbnails page.
* Fix the height of thumbnail captions for better alignement.

### version 3.0 (28/08/2012)

* forms - fix the search page button
* include the ajax queue to load thumbnails
* minor fixes
* comment list - fix thumbnails

### version 3.0-beta5 (28/06/2012)

* image nav bar
* use the same style for category thumbnails and other thumbnails
* apply the transparent background to the subcontent
* thumbnails - use bootstrap
* put the title in the navbar using javascript
* css - change responsive styles
* don't use pwg's combine as it breaks with plugins
* minify bootstrap.js

### version 3.0-beta4 (25/06/2012)

Compatibility with piwigo 2.4:

* update bootstrap to 2.0.4
* minor template changes
* adapt templates to use derivatives
* header - add canonical url

### version 3.0-beta3 (27/03/2012)

* update screenshots
* use infinitescroll plugin to avoid pagination
* change tooltip position for category thumbnails
* font-size for imgNext/imgPrev
* fix icon dir

### version 3.0-beta2 (10/03/2012)

* rename theme

### version 3.0-beta1 (09/03/2012)

Complete redesign:

* switch to HTML5
* responsive design
* based on [Bootstrap](http://twitter.github.com/bootstrap/)
* use [Open Sans](http://en.wikipedia.org/wiki/Open_Sans) font

### version 2.5.5 (01/03/2012)

* fix the adaptation of the main image with the resolution

### version 2.5.4 (23/01/2012)

* improve media-queries for small resolutions
* limit with of descriptions - combine files
* bugfix for the admin option

### version 2.5.3 (22/01/2012)

* add an option and admin page to choose the layout for albums (with description
  under or next to the album thumbnail)

### version 2.5.2 (20/12/2011)

* more flexible layout for thumbnails
* more flexible layout for categories
* restore the possibility to hide thumbnails caption.
* center image in slideshow

### version 2.5.1 (18/10/2011)

* refactor code for #titrePage and add the link to switch the menu
* fixes for comments page
* fixes for pages where the $MENUBAR is present

### version 2.5 (08/10/2011)

* use media queries to adapt layout for small screens
* remove arbitrary limit on width: the picture will simply be partially hidden if too wide
* update password.tpl
* add MENUBAR on all pages
* Spelling correction in README
* update url
* bugfix for the feature 'open external links in new window' for menubar links

### version 2.4.3 (31/05/2011)

* add a #Tags id for tags list, for the user tags plugin
* use inline-block instead of float left for thumbnails ans categories
* print css: re-enable it in the header + improve it
* update README + add debugging mode in themeconf
* language strings
* new script to tag a new version and generate a zip archive

### version 2.4.2 (10/04/2011)

* fix version in themeconf (needed for update manager)

### version 2.4.1 (06/04/2011)

* new tpl for PWG stuff - thanks to P@t
* subcontent is now a class, to allow several subcontent block inside the content block
* add get_combined_scripts in the footer

### version 2.4 (05/04/2011)

compatibility with piwigo 2.2:

* update template, language strings + misc things
* use rating and core.scripts from default theme
* cleanup useless javascript stuff
* use new combined_css feature - thanks to P@t
* replace known_script with combine_script

### version 2.3 (07/01/2011)

* if cl_conflit is used, don't add jQuery.noConflict
* fix the possibility to toggle visibility of image information
* show logout link when connected - thanks to gbo
* update jquery to 1.4.4
* backport commit from piwigo: r6244, r6430 & r6438
* add gitignore
* update javascripts + add script to combine/minify
* apply r6594 from piwigo's trunk
* move jquery in the header, using known_script
* translation for the menu title
* add 1px icon start_filter.png to avoid loading error with rvtree plugin
* margin for error & info divs

### version 2.2 (23/09/2010)

* fix the calendar's pages
* update picture.tpl (download, favorites, metadata, rating)
* change the way to hide blocks  in JS, without <noscript>, thanks to VDigital
  & nicolas
* update jquery to 1.4.2
* remove standard deviation for votes

### version 2.1 (16/06/2010)

- bugfix for user's profile - use default `profile_content.tpl`
- child themes do not need to have `content.css`
- use `local_head.tpl`
- correct order of thumbnails & show copyright on picture page
- use default as parent theme & change theme URI
- add quicksearch and style input, textarea, ...
- add login link in the footer

### version 2.0 (31/05/2010)

- adapt the theme for Piwigo 2.1
- add Readme
- tweak for plugins adding icons in .titrePage (piwishak, addthis, ...)
