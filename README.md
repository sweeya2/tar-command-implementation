# tar-command-implementation
### PROGRAMMING LANGUAGE USED : shell script
### OPERATING SYSTEM : LINUX

### Initial two arguments to the command line:
To compile: ``` chmod +x 200101079_2.sh ``` \
To run: ``` ./200101079_2.sh ```

The following options can be executed in this program:

cvf: \
tar cvf (example).tar [input files] \
creates an uncompressed tar Archive and displays verbose information \

cf: \
tar cf (example).tar [input files] \
creates an uncompressed tar Archive \

rvf: \
tar rvf (example).tar [input files] \
passes more files to our uncompressed tar Archive (append like) and displays verbose information \

rf: \
tar rf (example).tar [input files] \
passes more files to our uncompressed tar Archive (append like) \

xvf: \
tar xvf (example).tar [output files] \
Extracting particular [output files] from Archive and displays verbose information \
tar xvf (example).tar \
Extracting all files from Archive and displays verbose information \

xf: \
tar xvf (example).tar [output files] \
Extracting particular [output files] from Archive \
tar xvf (example).tar \
Extracting all files from Archive \

tvf:  \
tar tvf (example).tar \
Viewing the Archive \
tar tvf (example).tar [files] \
Viewing the Archive of particular files \

tf: \
tar tf (example).tar \
list the contents and specify the tarfile \
tar tf (example).tar [files] \
list the contents and specify the tarfile of particular files \

note: \
• All the options above also work if the options are jumbled, i.e. cvf, vfc, fvc all the give the same results. \
• Wherever [input files] or [output files] is written, more than one file can be sent. \
• At any point if you type a options which is incorrect or which can't be done by the following program, an error message will be shown. \
• Programme works perfectly fine for .txt files but may or may not work for other formats. \
• Only the .tar files which are created by this programme can be extracted using 'xvf' command using this programme. \
