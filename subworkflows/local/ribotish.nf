


include { bam_sort_index }                                  from './bam_sort_index.nf'

include { RIBOTISH }                                       from '../../modules/local/ribotish.nf'


workflow ribocode {
    take:
        bam_ch
        gtf
        genome_fasta


    main:
        index_bam_ch                =   bam_sort_index          (bam_ch)
        ribotish_ch                 =   RIBOTISH                (index_bam_ch, gtf, genome_fasta)
}