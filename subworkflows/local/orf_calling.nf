
// Include the necessary modules for this workflow
include { SAMTOOLS_SORT as SAMTOOLS_SORT_TRANS; SAMTOOLS_SORT as SAMTOOLS_SORT_GENOME } from '../../modules/local/samtools/samtools_sort.nf'
include { CONFIG }                                          from '../../modules/local/config.nf'
include { MUDSKIPPER }                                      from '../../modules/local/mudskipper.nf'
include { INDEX as INDEX_GENOME; INDEX as INDEX_TRANS }     from '../../modules/local/samtools/samtools_index.nf'
include { INFLATE }                                         from '../../modules/local/inflate.nf'
include { METAPLOTS }                                       from '../../modules/local/metaplots.nf'
include { RIBOCODE }                                        from '../../modules/local/ribocode.nf'
include { PSITE }                                           from '../../modules/local/psite.nf'
include { RIBOCODE_PSITE }                                   from '../../modules/local/ribocode_psite.nf'

workflow orf_calling {
    take:
        bam_trans_ch

    main:
        // sorted_bam_ch       =   SAMTOOLS_SORT_GENOME    (bam)
        // index_bam_ch        =   INDEX_GENOME            (sorted_bam_ch)

        // bam_trans_ch        =   MUDSKIPPER              (index_bam_ch, "/home/jack/projects/gencode-mouse-orfs/data/mus_musculus/mudskipper_index")

        inflated_ch         =   INFLATE                 (bam_trans_ch)

        psite_ch            =   PSITE                   (inflated_ch, "/home/jack/projects/gencode-mouse-orfs/data/mus_musculus/transcriptome.fasta", "/home/jack/projects/gencode-mouse-orfs/data/mus_musculus/txinfo.tsv")
        ribocode_psite_ch   =   RIBOCODE_PSITE          (psite_ch, "/home/jack/projects/gencode-mouse-orfs/data/mus_musculus/ribocode_annotation")



        // sorted_bam_trans_ch =   SAMTOOLS_SORT_TRANS     (inflated_ch)
        // index_bam_trans_ch  =   INDEX_TRANS             (sorted_bam_trans_ch)

        // // metaplots_ch        =   METAPLOTS               (index_bam_trans_ch, "/home/jack/projects/gencode-mouse-orfs/data/mus_musculus/ribocode_annotation")
        // metaplots_ch        =   CONFIG                  (index_bam_trans_ch)
        // ribocode_ch         =   RIBOCODE                (metaplots_ch, "/home/jack/projects/gencode-mouse-orfs/data/mus_musculus/ribocode_annotation")
}