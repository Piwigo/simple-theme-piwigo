SimpleNG theme for Piwigo
=========================

*SimpleNG* is a complete redesign of the *Simple Grey* theme (should have been
the version 3.0), taking advantage of the new features of the web: HTML5,
CSS3, ...

**The version 3.0 is currently a beta version, there may be compatibility
  issues with plugins.**

[![screenshot][2]][1]

[1]: https://github.com/saimn/simple-theme-piwigo/raw/master/screenshot.large.jpg
[2]: https://github.com/saimn/simple-theme-piwigo/raw/master/screenshot.large.jpg

Download
--------

* [Piwigo extensions](http://fr.piwigo.org/ext/extension_view.php?eid=308)
* [Source code (github)](http://github.com/saimn/simple-theme-piwigo)

* use the builtin theme manager in Piwigo's admin interface,
* or download the archive and extract it in ``your-gallery/theme/simpleng/``.

Licence
-------

Copyright(C) 2009-2012 Simon C. <contact at saimon dot org>

The "SimpleNG" theme for Piwigo is free software: you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.

Changelog
---------

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
