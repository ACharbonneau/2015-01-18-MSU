#This searchs for ANY string in a list of fasta files

echo "Enter a search string:"
read searchseq

echo "Enter a file list (no quotes):"
read filelist

echo "Name of output file"
read outputname

# create 2nd output name with a ".mr" suffix for feeding into other programs later.
machinereadable=${outputname}.mr

# add metadata to outputname
date > ${outputname}
echo "Dataset searched:" `pwd` >> ${outputname}
echo "Search string:" ${searchseq} >> ${outputname}
echo "Who ran this:" `whoami` >> ${outputname}

# the loop performs the search and cuts out the sequence name from each grep hit
for ATfile in ${filelist}  #Works for any file list
      do grep -B 1 -i ${searchseq} ${ATfile} |  
      head -1 | 
      cut -f 1 -d " " |          # -d " "    #makes it cut on spaces
      cut -f 2 -d ">" # this works fine
     # tr ">" " "  # this is an alterative. tr translates 1 character into another
done > ${machinereadable}

cat ${machinereadable} >> ${outputname}
