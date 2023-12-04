

include { bam_sort_index }                                  from './bam_sort_index.nf'

include { METAPLOTS }                                       from '../../modules/local/metaplots.nf'
include { RIBOCODE }                                        from '../../modules/local/ribocode.nf'

workflow ribocode {
    take:
        trans_bam_ch
        ribocode_annotation

    main:
        index_bam_trans_ch          =   bam_sort_index          (trans_bam_ch)
        metaplots_ch                =   METAPLOTS               (index_bam_trans_ch, ribocode_annotation)
        ribocode_ch                 =   RIBOCODE                (metaplots_ch, ribocode_annotation)
}