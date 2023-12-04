

include { bam_sort_index }      from './bam_sort_index.nf'
include { MUDSKIPPER }          from '../../modules/local/mudskipper.nf'


workflow transcriptomise_bam {
    take:
        genomic_bam_ch
        mudskipper_index

    main:
        index_bam_ch        =   bam_sort_index          (genomic_bam_ch)
        bam_trans_ch        =   MUDSKIPPER              (index_bam_ch, mudskipper_index)
    
    emit:
        bam_trans_ch
}