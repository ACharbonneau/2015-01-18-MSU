#This searches for a string ${searchstring} in a list of files called ${filelist}

echo  "Enter search string"  # Program will ask for input
read searchstring            # And read that input as this variable

echo "Enter file names"
read filelist

echo "Enter output file"     #Now it also asks for what to call the output file
read outputname

date > $outputname           #Now it also adds todays date to the output file
echo "Dataset:" `pwd` >> $outputname     #and appends which folder I'm running from
echo "Search string:" ${searchstring} >> $outputname  #And appends my searchstring
for ATfiles in ${filelist}
        do grep -i -B 1 ${searchstring} ${ATfiles} | #search for any string that is input after the command
        head -1 | #Get only the comment lines
        cut -f 1 -d " " | #Remove the description from the comment lines
done >> $outputname #and puts the output in the same file