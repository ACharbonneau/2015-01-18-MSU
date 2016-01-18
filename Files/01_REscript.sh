#This is a comment
#This is just a copy/past of the command line script we wrote to run interactively
#This searches for AccI in a list of files called AT...

for ATfiles in `ls`
        do grep -i -B 1 "gt[ac][gt]ac" ${ATfiles} | #search for AccI in a list, get the comment line as well
        head -1 | #Get only the comment lines
        cut -f 1 -d " " | #Remove the description from the comment lines
done