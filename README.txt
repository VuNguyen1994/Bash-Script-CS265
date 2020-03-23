*Name: Dinh Nguyen
*CS265 Assignment 1
****README****

*INTRO*
a1-top is the top level script. filter.awk is the support script for a1-top.
a1-top will traverse current directory and all subdirectories to look for README file.
a1-top will call filter.awk to parse the README files and output into 2 files: .index, .required.
a1-top will handle different cases and read index, required files to build dir.json files for each directory it visits.
a1-top will clean up the extra created files after finish. 

*IMPLEMENT*
Execute a1-top as follow: ./a1-top [optional-arg]
a1-top takes 1 optional argument as the top directory that it will run on. 
If no argument, it will run on current directory.
a1-top needs filter.awk to run successfully, so filter.awk needs to be in the same directory with a1-top. 

********************END OF FILE********************
