mata:
real scalar not_empty(string scalar stderr) {
	Y=docread(stderr)
	if (rows(Y)) {
		rc=1
		}
		else {
		rc=0
		}
	st_global("r(not_empty)", strofreal(rc))
	return(rc)
	}
	
mata mosave not_empty(), dir(PERSONAL) replace
end
