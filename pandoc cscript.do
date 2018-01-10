cd Z:/Stata/pandoc

capture pandoc bogus // file ___ not found
assert _rc==601

pandoc z:/public_web/index.md, replace
_assert_streq `"`r(command)'"' ///
	`" "C:\Program Files (x86)\pandoc\pandoc" -f markdown -t html -s -o "z:/Stata/pandoc/index.html"  "z:/public_web/index.md" "'

capture pandoc z:/public_web/index.md // file ___ already exists
assert _rc==602

capture pandoc "z:/public_web/index.md", saving("z:/public_web/index.md") // output same as source
assert _rc==602

* Error, not enough dashes in "-toc"
pandoc index.md, replace args(-toc) perror
* No error
pandoc index.md, replace args(--toc) perror

* Tables tests
pandoc "tables/md table types.md", saving("tables/md tables default.html") replace

pandoc "tables/md table types.md", saving("tables/md tables nosimple.html") ///
	tables("nosimple") replace
	
pandoc "tables/md table types.md", saving("tables/md tables nopipe.html") ///
	tables("nopipe") replace
	
pandoc "tables/md table types.md", saving("tables/md tables nomulti.html") ///
	tables("nomulti") replace
	
pandoc "tables/md table types.md", saving("tables/md tables nogrid.html") ///
	tables("nogrid") replace
	
* Other output types
pandoc "tables/md table types.md", saving("tables/md tables default.pdf") ///
	to("pdf") replace

pandoc "tables/md table types.md", saving("tables/md tables default.docx") ///
	to("docx") replace

