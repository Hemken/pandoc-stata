* Pandoc in PATH
capture erase pdver.txt
capture erase pderr.txt

! pandoc --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")

* Bad drive
capture erase pdver.txt
capture erase pderr.txt

! F:/pandoc --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")

* Bad OS command (no quotes)
capture erase pdver.txt
capture erase pderr.txt

! C:/Program Files/pandoc --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")

* Bad directory
capture erase pdver.txt
capture erase pderr.txt

! "C:/Program Files/pandoc" --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")

* Bad file name
capture erase pdver.txt
capture erase pderr.txt

! "C:/program files (x86)/pandoc/panic" --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")

* Pandoc install
capture erase pdver.txt
capture erase pderr.txt

! "C:/program files (x86)/pandoc/pandoc" --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")

* RStudio install
capture erase pdver.txt
capture erase pderr.txt

! "C:/Program Files/RStudio/bin/pandoc/pandoc" --version > pdver.txt 2>pderr.txt
mata: stdout_or_stderr("pdver.txt", "pderr.txt")


