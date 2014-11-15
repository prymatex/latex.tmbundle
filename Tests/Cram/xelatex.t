-- Setup ----------------------------------------------------------------------

  $ cd "$TESTDIR";
  $ source setup_cram.sh
  $ cd ../TeX/

-- Tests ----------------------------------------------------------------------

  $ TM_FILEPATH="xelatex.tex"

Just try to translate the program using `latex`

  $ texmate.py -s latex -latexmk no | grep 'Output written' | countlines
  1

Check if clean removes all auxiliary files.

  $ texmate.py clean > /dev/null
  $ ls | grep -E $auxiliary_files_regex
  [1]

-- Cleanup --------------------------------------------------------------------

Restore the file changes made by previous commands.

  $ git checkout *.aux *.bcf

Remove the generated PDF files

  $ rm -f *.pdf
