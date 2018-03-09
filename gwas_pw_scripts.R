###pairwise GWAS colocolization script###

##This script is for creating the right input file for pairwise gwas###

setwd()
library(data.table)

gwas1 = fread("")
gwas2 = fread("")

#ensure that the SNP file is called "SNP", if not set it using setnamesoption

merged = merge(gwas1, gwas2, by = "SNP")

merged$true1 = merged$effect_allele == merged$A1

merged$true2 = merged$effect_allele == merged$A2

merged1 = subset(merged, true1 == "TRUE")
merged2 = subset(merged, true2 == "TRUE")

merged2$Z.y = -1*merged2$Z.y
merged3 = rbind(merged1, merged2)

setnames(merged3, "SNP", "SNPID")
setnames(merged3, "BP", "POS")
setnames(merged3, "Z.x", "Z_GWAS1")
setnames(merged3, "Z.y", "Z_GWAS2")
setnames(merged3, "SE.x", "V_GWAS1")
setnames(merged3, "SE.y", "V_GWAS2")

merged3$CHR2 = paste0("chr", merged3$CHR)

merged4 = merged3[,c("SNPID", "CHR2", "POS", "Z_empathy", "V_empathy", "Z_scz", "V_scz")]

merged = merged4


chr = subset(merged, CHR == "chr1")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 10583 & POS < 249239466)
detach(chr)
data = chr


chr = subset(merged, CHR == "chr2")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 10133 & POS < 243188920)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr3")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 60157 & POS < 197946622)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr4")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 10240 & POS < 191043594)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr5")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 11940 & POS < 180885156)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr6")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 73924 & POS < 171051270)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr7")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 16161 & POS < 159128575)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr8")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 10422 & POS < 146303867)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr9")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 10023 & POS < 141144796)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr10")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 60523 & POS < 135523865)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr11")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 70855 & POS < 134946452)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr12")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 61107 & POS < 133841511)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr13")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 19020013 & POS < 115109853)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr14")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 19002084 & POS < 107289454)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr15")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 20001200 & POS < 102520966)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr16")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 60054 & POS < 90292812)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr17")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 56 & POS < 81194908)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr18")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 10644 & POS < 78017158)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr19")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 80840 & POS < 59118839)
detach(chr)
data = rbind(data, chr)


chr = subset(merged, CHR == "chr20")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 60479 & POS < 62965163)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr21")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 9411243 & POS < 48119752)
detach(chr)
data = rbind(data, chr)

chr = subset(merged, CHR == "chr22")
attach(chr)
chr = chr[order(POS),]
chr = subset(chr, POS > 16050408 & POS < 44995308)
detach(chr)
data = rbind(data, chr)

data = unique(data)

write.table(data, file = "filename.txt", row.names = F, col.names  = T, quote = F)
