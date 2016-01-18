#This searchs for ANY string in a list of fasta files

echo "Enter a search string:"
read searchseq

echo "Enter a file list (no quotes):"
read filelist

echo "Name of output file"
read outputname

# make an output directory
mkdir ${outputname}
mkdir ${outputname}/meta

# add metadata to outputname
date > ${outputname}/${outputname}.meta
echo "Dataset searched:" `pwd` >> ${outputname}/${outputname}.meta
echo "Search string:" ${searchseq} >> ${outputname}/${outputname}.meta
echo "Who ran this:" `whoami` >> ${outputname}/${outputname}.meta

# the loop performs the search and cuts out the sequence name from each grep hit
for ATfile in ${filelist}  #Works for any file list
      do grep -B 1 -i ${searchseq} ${ATfile} |  
      head -1 | 
      cut -f 1 -d " " |          # -d " "    #makes it cut on spaces
      cut -f 2 -d ">" # this works fine
     # tr ">" " "  # this is an alterative. tr translates 1 character into another
done > ${outputname}/${outputname}.results

