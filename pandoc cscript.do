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
