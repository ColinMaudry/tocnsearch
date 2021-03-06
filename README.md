#TOCnSearch 0.9.2

This DITA Open Toolkit plugin is a fusion between the standard tocjs plugin (by Shawn McKenzie) and the little known HTML Search plugin (by Nadège Quaine).
It generates an HTML WebHelp with a table of contents in the left page (thanks TocJS) and a full text search field in the top banner (thanks HTML Search). It's easy to customize.

I modernized it all a bit so that it feels more like 21st century (iframes instead of frames, decent CSS framework).

(plugin descriptions by their respective authors)

## TocJS 

(C) Copyright Shawn McKenzie, 2007. All Rights Reserved.

The tocjs plugin generates a Table of Contents for the DITA Open Toolkit's 
XHTML output that can expand and collapse nodes. It is a more usable and 
visually pleasing option than the standard index.html generated by the Open 
Toolkit's dita2html  transformation.

## HTML Search

Copyright (c) 2008 N. Quaine - NexWave Solutions All Rights Reserved. 

The search plugin generates javascript index files from the html files produced by the web transform and a frameset with a simple search feature.

## Change log

#### 0.9.2

- Iframe now take remaining height, no more = vertical scrolling bar only if too much content for the screen     

#### 0.9.1

- Added support for relative path as "output.dir", not only absolute (used to break indexing)

#### 0.9.0

- Integrated HTML Search
- Cleaned output directory (less files)
- Uses Bootstrap 3.9 for some fluidity and better styles

#### 0.1.0 (TocJS only)

- Enabled easy customization taking pdf2 as a model (XSLT, CSS)
- For the output, reorganized files in subfolders to clean up the root directory (html/, css/, js/)


     
