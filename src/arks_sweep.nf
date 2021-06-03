

process rename_fa {

    script:
    """
    perl -ne 'chomp; if(/>/){$ct+=1; print ">$ct\n";}else{print "$_\n";} ' \
        < ${id}_canu_purged_arrow.fa > ${id}_canu_purged_arrow.renamed.fa
    touch empty.fof
    """

}

process arcs {

    script:
    """
    arcs --arks -v \
        -f ${id}_canu_purged_arrow.renamed.fa \
        -c 5 -m 50-10000 -r 0.05 -e 30000 -z 500 \
        -j 0.55 -k 30 -t 8 -d 0 --gap 100 \
        -b ${id}_canu_purged_arrow_c${c}_m${m}_k${k}_r${r}_e${e}_z${z} \
        ${id}-barcoded.fq.gz --barcode-counts barcodeMultiplicityArcs.tsv
    """
}

process maketsv {


    script:
    """
    python /home/meep/Desktop/Biocomputing/arcs/Examples/makeTSVfile.py
    
    """
}
