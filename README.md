# UnBTeX: A class for bachelor, master, and doctoral thesis at the
# University of Brasilia (UnB), Brazil.
# Version 1.5.2 2024/07/04

Copyright (C) 2021-2024 by Henrique C. Ferreira <hcferreira@unb.br>

The package provides a class based on abnTeX and compatible with pdflatex 
and bibtex to prepare theses for the University of Brasilia (UnB), Brazil. 
The class also comes with a template for the various types of theses for 
ungraduated and graduated programs at UnB.

Please note that the documentation for the class and the comments in the 
templates are all written in Portuguese, the language of the target 
audience.

This package consists of the file unbtex.cls and the bibliographic style
files located in the unbtexcite directory.
Template files: unbtex-example.pdf, unbtex-example.tex, and files within 
unbtex-example directory.
To compile the unbtex-example.tex file you should call pdflatex, bibtex, 
pdflatex.

Here is a history of changes:
  1.0 (2021-12-15): Initial release
  1.1 (2022-05-23): 
    . Changed \codigocutter to \numerocutter 
    . The argument of \preambulo command now admits a more general text
    . updated example
  1.1.1 (2022-05-30):
    . Changed abntex2 commands \orientador and \coorientador to do the 
      same as \orient and \coorient
    . Changed hyphenation for \preambulo text in portuguese when english 
      language is selected
  1.1.2 (2022-07-29):
    . Page break on the copyright page has been corrected
    . Documentation and comments improvements
  1.1.3 (2022-09-04):
    . Improved compilation time
  1.2 (2022-10-05):
    . The styles of Table of Contents (Sumário), List of Sybols (Lista de
      símbolos), and List of Acronyms (Lista de abreviaturas) have been
      modified
    . A compilation problem with Tex Live 2022 that arises when microtype
      package is used has been solved
  1.2.1 (2023-06-15):
    . Braces around equation numbering and language option for \autoref 
      command has been corrected
    . The code comments have been improved
  1.3 (2023-10-17):
    . To avoid the compilation time limit in Overleaf, the biblatex 
      bibliography package has been replaced by the bibtex package, 
      and the TikZ package for drawings no more has not been used.
    . The indentation of lists of figures and tables have been corrected
    . The cleveref package is now being used for cross-references instead 
      of the autoref command
  1.3.1 (2023-10-18):
    . The abtex2eng-alf.bst file was included to format bibliographic 
      references in ABNT style for documents written in English.
  1.3.2 (2023-10-20):
    . Documentation and comments improvements
  1.3.3 (2023-11-02):
    . The abtex2eng-alf.bst file has been replaced by the unbtexcite-en.bst
      and unbtexcite-pt.bst files. These style files generate citations and
      bibliographic references in accordance with updates to ABNT's NBR
      6023:2018 and NBR 10520:2023 standards 
    . Example and code comments improvements
  1.4 (2023-11-15):
    . Text main font based on stix2 package has been replace by stickstoo
      package to improve math subscript spacing
    . Sans serif font scale has been adjusted (helvet package)
    . Typewriter font and scale have been changed (inconsolata package)
    . Font size and line spread of verbatim environment have been modified
    . Cross-references names for listing, algorithm, and theorem
      environments have been corrected
    . Indentation and line spacing of references list have been adjusted
    . Figure and table numbering by chapter have been corrected
  1.4.1 (2023-11-27):
    . Figure captions have been moved to the top to comply with the ABNT
      standard
    . Spacing between figures/tables and captions/legends has been 
      adjusted
    . Spacing between figures/tables and text has been adjusted
    . Spacing in list environments has been adjusted
  1.4.2 (2023-12-15):
    . Cross-references to the appendix and annex using the cref command
      have been corrected
    . The lists of abbreviations and acronyms, as well as the list of symbols, 
      have been enhanced, and page numbering has been removed
    . The example chapters have been reorganized
  1.4.3 (2023-12-22):
    . Keywords in English have been included on the copyright page if the
      document is written in this language
    . Examples of long tables and rotated tables have been included
  1.4.4 (2024-01-05):
    . The pdfpages package has been used to include pages from PDF documents
    . The sans-serif font Helvetica (helvet package) has been replaced by the
      TeX Gyre Heros font (tgheros package)
  1.5 (2024-02-02):
    . ABNT style with a numeric citation scheme for bibliographic references
      has been included
    . Added an option to the UnBTeX class for selecting the citation style
      (author-year or numeric)
    . Added an option to the UnBTeX class for selecting the main language of
      the text (Brazilian Portuguese or English)
    . The font size of the title is automatically adjusted according to its 
      length (and number of lines)
    . Reorganization of the class source code and improvements in the comments
    . The template text has been revised and improved
  1.5.1 (2024-03-02):
    . The approval sheet (folha de aprovação) has been changed
    . The bottom margin size has been corrected to be consistently adhered to
  1.5.2 (2024-07-04):
    . The length of the footnote separator line has been corrected according 
      to ABNT standards
    . The left margin indentation of the citacao environment has been corrected
      according to ABNT standards
    . The left margin indentation of the references can be adjusted by the user

## Overleaf

The template is available on [Overleaf]
(https://www.overleaf.com/latex/templates/unbtex-a-class-for-bachelor-master-and-doctoral-thesis-at-university-of-brasilia-unb/rfsxjkzprztc).

## Licence

This class file may be distributed and/or modified under the conditions
of the LaTeX Project Public License, either version 1.3 of this license
or (at your option) any later version. The latest version of this
license is in:

http://www.latex-project.org/lppl.txt

and version 1.3 or later is part of all distributions of LaTeX version
2005/12/01 or later.