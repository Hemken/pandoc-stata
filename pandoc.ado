*! version 1.0
*! Doug Hemken
*! 27 December 2017

* uses find_pandoc, and mata: not_empty

capture program drop pandoc
program pandoc, rclass
    syntax anything(name=mdfile), [SAVing(string) replace ///
			to(string) from(string) ///
			ppath(string) PERRor    ///
			args(string)]
	
	local mdfile = ustrtrim(usubinstr(`"`mdfile'"', `"""', "", .))
	confirm file `"`mdfile'"'
	
	if ("`from'" == "") {
		local from "markdown"
		}
	if ("`to'" == "") {
		local to "html"
		}
//display "`to'"
	if ("`saving'" == "" ) {
		mata:(void)pathchangesuffix("`mdfile'", "`to'", "saving", 0)
		}
//display "`saving'"
	mata: (void)pathresolve("`c(pwd)'", `"`saving'"', "saving")
	local issame = 0
//display "`issame'"
	mata: (void)filesarethesame("`mdfile'", "`saving'", "issame")
//display "`issame'"
	if ("`issame'" == "1") {
		display in error "output file can not be the same as the source file"
		exit 602			
	}
	if ("`replace'"=="") {
		confirm new file "`saving'"
		}
		
	// pandoc
	local ppath = ustrtrim(usubinstr(`"`ppath'"', `"""', "", .))
	if ("`ppath'" == "") {
		find_pandoc
		local pandoc = ustrtrim(usubinstr(`"`r(pandoc)'"', `"""', "", .))
		}
	else {
		local pandoc `ppath'/pandoc
		}
	//display "`pandoc'"
	if ("`to'" == "pdf") {
		//local pdfengine `"--pdf-engine="C:\Program Files (x86)\MiKTeX 2.9\miktex\bin\pdflatex.exe""'
		local to latex
	}
	local cmd `" "`pandoc'" -f `from' -t `to' -s -o "`saving'" `args' "`mdfile'" "'
	//display `"`cmd'"'
	if ("`perror'" ~= "" ) {
		tempfile stderr
		local perror 2> `stderr'
		}
	! `cmd' `perror'
	if ("`perror'" ~= "") {
		mata: (void)not_empty("`stderr'")
		if ("`r(not_empty)'" == "1") {
			display "{error: Pandoc error:}"
			type "`stderr'"
			display
			}
		else {
			display "(no Pandoc error)"
			display
			}
		}
	display `"  {text:  Output to }{browse "`saving'"}."'
		
	return local command `"`cmd'"'
end
