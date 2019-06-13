REM Referenced from http://brendandawes.com/blog/ctagsprocessing
REM Assumes ctags is installed and in PATH
REM Should be run from root directory via `./dev-tools/GenerageVimTags.bat`

ctags -R --langmap=java:.pde --exclude=build-tmp
