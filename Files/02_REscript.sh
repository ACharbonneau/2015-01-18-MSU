#This searches for a string in a list of files called AT...
#Need to put the string you want to search after the command. Like this: 
#    sh 02_REscript.sh TTTTTT

for ATfiles in `ls`
        do grep -i -B 1 ${1} ${ATfiles} | #search for any string that is input after the command
        head -1 | #Get only the comment lines
        cut -f 1 -d " " | #Remove the description from the comment lines
done