Simple grey theme for Piwigo
============================

*Simple  grey*  is a  theme  for *Piwigo*  gallery  software.  This theme  was
inspired  by *gally  /  Graphite* theme  for  Piwigo, and  *Carbon* theme  for
Gallery, with the goal to simplify the design up to go to basics: the photos !
You can also find some variants (Sunset, Black, White) in Piwigo extensions.

Licence
-------

Copyright(C) 2009-2011 Simon C. <contact at saimon dot org>

The "Simple grey"  theme for Piwigo is free software:  you can redistribute it
and/or  modify  it under  the  terms  of the  GNU  General  Public License  as
published by the Free Software Foundation.

This program  is distributed in the hope  that it will be  useful, but WITHOUT
ANY WARRANTY; without even the  implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have  received a copy of the GNU General  Public License along with
this program. If not,  see <http://www.gnu.org/licenses/>.

Links
-----

* [Piwigo](http://piwigo.org/)
* [Simple page](http://saimon.org/blog/pages/Theme-Simple-Grey-Piwigo)
* [Development](http://github.com/saimn/simple-grey)
* [Download](http://fr.piwigo.org/ext/extension_view.php?eid=308)

Install
-------

* for **Piwigo  > 2.1.x**,  use **Simple  > 2.x** :  download the  archive and
  extract it in  ``your-gallery/theme/``. You can also use  directly the theme
  installer for the admin interface.
* for  **Piwigo 2.0.x**,  use  **Simple  1.4.1** :  download  the archive  and
  extract it in ``your-gallery/template/``.

Changelog
---------

* update language strings
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
* fix the possibility to toggle visibility of image informations
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


## TODO

- put rss link in header.tpl (when ready)
