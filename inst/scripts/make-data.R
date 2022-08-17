### ----- Yeast data (Bastie, Chapard et al 2022)

# curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR162/053/SRR16250953/SRR16250953_1.fastq.gz -o CH324_R1.fq.gz
# curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR162/053/SRR16250953/SRR16250953_2.fastq.gz -o CH324_R2.fq.gz
# curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR139/079/SRR13994279/SRR13994279_1.fastq.gz -o CH112_R1.fq.gz
# curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR139/079/SRR13994279/SRR13994279_2.fastq.gz -o CH112_R2.fq.gz
# tinyMapper.sh --mode HiC --sample CH324 --genome ~/genomes/S288c/S288c --output HiC --threads 16
# tinyMapper.sh --mode HiC --sample CH112 --genome ~/genomes/S288c/S288c --output HiC --threads 16
# chromosight detect --pattern loops --threads 16 HiC/matrices/CH112/CH112^mapped_S288c^R8GM85.cool CH112_loops
# sed '1d' CH112_loops.tsv | awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}' > S288C-loops.bedpe
# chromosight detect --pattern borders --threads 16 HiC/matrices/CH112/CH112^mapped_S288c^R8GM85.cool CH112_borders
# sed '1d' CH112_borders.tsv | awk '{print $1"\t"$2"\t"$3}' > S288C-borders.bed

### -----  mESCs data (Bonev et al 2017)

# curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR533/000/SRR5339750/SRR5339750_1.fastq.gz -o mESCs_R1.fq.gz
# curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR533/000/SRR5339750/SRR5339750_2.fastq.gz -o mESC_R2.fq.gz
# tinyMapper.sh --mode HiC --sample mESCs --genome ~/genomes/mm10/mm10 --output HiC --threads 16 --resolutions 10000,20000,40000,80000,160000,320000,640000,1280000,2560000

### ----------  Subset and compress files

# cp HiC/matrices/CH112/CH112^mapped_S288c^R8GM85.cool S288C.cool
# cp HiC/matrices/CH112/CH112^mapped_S288c^R8GM85.mcool S288C.mcool
# cp HiC/matrices/CH324/CH324^mapped_S288c^2M30JS.mcool S288C_Eco1-AID.mcool
# cp HiC/matrices/mESCs/mESCs^mapped_mm10^OF4CB9.mcool mESCs.mcool
# cp ~/Projects/20220816_HiContacts_datasets/S288C-loops.bedpe S288C-loops.bedpe
# cp ~/Projects/20220816_HiContacts_datasets/S288C-borders.bed S288C-borders.bed
# grep -P '#' HiC/pairs/CH112/CH112^mapped_S288c^R8GM85.valid_idx_pcrfree.pairs > S288C.pairs
# grep -P '\tII\t.*\tII\t' HiC/pairs/CH112/CH112^mapped_S288c^R8GM85.valid_idx_pcrfree.pairs >> S288C.pairs
# gzip S288C.pairs
# grep -P '#' HiC/pairs/CH324/CH324^mapped_S288c^2M30JS.valid_idx_pcrfree.pairs > S288C_Eco1-AID.pairs
# grep -P '\tII\t.*\tII\t' HiC/pairs/CH324/CH324^mapped_S288c^2M30JS.valid_idx_pcrfree.pairs >> S288C_Eco1-AID.pairs
# gzip S288C_Eco1-AID.pairs