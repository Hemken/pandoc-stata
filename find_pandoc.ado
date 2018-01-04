*! version 1.0
*! Doug Hemken
*! 27 December 2017
capture program drop find_pandoc
program define find_pandoc, rclass
	syntax [anything(name=exefile)]
	
	if ("`exefile'" ~= "") {
		local exefile = ustrtrim(usubinstr(`"`exefile'"', `"""', "", .))
		confirm file `"`exefile'"'
		return local pandoc "`exefile'"
		}
	else if (c(os) == "Windows") {
		capture confirm file "C:\Program Files (x86)\pandoc\pandoc.exe"
		if (_rc == 0 ) {
			return local pandoc "C:\Program Files (x86)\pandoc\pandoc"
			}
		else {
			capture confirm file "C:\Program Files\RStudio\bin\pandoc\pandoc.exe"
			if (_rc == 0 ) {
				return local pandoc "C:\Program Files\RStudio\bin\pandoc\pandoc"
			}
			else {
				display "Pandoc was not found in the usual places."
				display "  You will have to specify the location yourself."
				}
			}
		}
		else if (c(os) == "Unix") {
			capture confirm file "/usr/bin/pandoc"
			if (_rc == 0 ) {
					return local pandoc "/usr/bin/pandoc"
				}
		}
		// MacOS: /Applications/pandoc
		// MacOS: /Applications/RStudio.app/Contents/MacOS/pandoc
		else {
			display "{it: You need to specify where Pandoc is located}"
			}
end
