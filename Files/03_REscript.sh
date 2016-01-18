#This searches for a string ${1} in a list of files called ${2}

#  ${1} is search string
#  ${2} is file list
#Need to put the string you want to search after the command, and file list after that...Like this: 
#    sh 02_REscript.sh <searchStrng> <filelist>


for ATfiles in ${2}
        do grep -i -B 1 $1 ${ATfiles} | #search for any string that is input after the command
        head -1 | #Get only the comment lines
        cut -f 1 -d " " | #Remove the description from the comment lines
done