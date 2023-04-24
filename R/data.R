#' human hg19 repeatmasker annotation file
#'
#' @description
#' This is a repeatmasker annotation file including information of transposable
#' elements in human (hg19). This dataframe object has 3 columns. gene_id for
#' the name of transposable element, family_id for the class name, and class_id
#' for the class name.
#' @usage data(hg19rmsk_info)
#' @examples
#' data(hg19rmsk_info)
"hg19rmsk_info"

#' Gene Expression data of human and chimpanzee
#'
#' @description
#' This is a gene expression dataframe including 3 replicates of human and
#' chimpanzee. Row names are ensembl gene ID and column names are sample ID.
#' @usage data(hmchimpGene)
#' @examples
#' data(hmchimpGene)
"hmchimpGene"

#' Transposable elements (TE) data of human and chimpanzee
#'
#' @description
#' This is a TE expression dataframe including 3 replicates of human and
#' chimpanzee. Row names are TE gene ID and column names are sample ID.
#' @usage data(hmchimpTE)
#' @examples
#' data(hmchimpTE)
"hmchimpTE"

#' Human KRAB-Zinc-Finger gene reference data
#'
#' @description
#' This is a 2 column dataframe including the ensembl gene ID and common gene
#' name of 337 KRAB-Zinc-Finger gene in human.
#' @usage data(hmKZNFs337)
#' @examples
#' data(hmKZNFs337)
"hmKZNFs337"

#' Differentially expressed genes comparing human and chimpanzee
#'
#' @description
#' This is a dataframe include log2 differentially expressed genes information
#' comparing human and chimpanzee from TEKRABber analyzing results.
#' @usage data(resHmChimpGene)
#' @examples
#' data(resHmChimpGene)
"resHmChimpGene"

#' Differentially expressed TEs comparing human and chimpanzee
#'
#' @description
#' This is a dataframe include log2 differentially expressed TEs information
#' comparing human and chimpanzee from TEKRABber analyzing results.
#' @usage data(resHmChimpTE)
#' @examples
#' data(resHmChimpTE)
"resHmChimpTE"

#' Human correlations result from TEKRABber
#'
#' @description
#' This is a dataframe including the human correlation between KZNFs and TEs
#' pairsusing TEKRABber.
#' @usage data(hmCorrResult.rda)
#' @examples
#' data(hmCorrResult)
"hmCorrResult"

#' Chimpanzee correlations result from TEKRABber
#'
#' @description
#' This is a dataframe including the chimpanzee correlation between KZNFs and
#' TEs pairs using TEKRABber.
#' @usage data(chimpCorrResult.rda)
#' @examples
#' data(chimpCorrResult)
"chimpCorrResult"

#' Information of human 423 KRAB-ZNFs gene
#'
#' @description
#' This is a dataframe including 423 human KRAB-ZNFs genes witt coordinates
#' @usage data(KZNFs423)
#' @examples
#' data(KZNFs423)
"KZNFs423"

#' hg38 information including age inference
#'
#' @description
#' This is a dataframe including hg38 gene (Ensembl Ver95), transcript, branch
#' (0-14), and geneName modified from GenTree data
#' (http://gentree.ioz.ac.cn/index.php).
#' @usage data(hg38age)
#' @examples
#' data(hg38age)
"hg38age"

#' hg19 information including age inference
#'
#' @description
#' This is a dataframe including hg19 gene (Ensembl Ver73), transcript, branch
#' (0-14), and geneName modified from GenTree data
#' (http://gentree.ioz.ac.cn/index.php)
#' @usage data(hg19age)
#' @examples
#' data(hg19age)
"hg19age"

#' Coordinates information of hg19 repeatmasker reference
#'
#' @description
#' This repeatmasker annotation including the information of transposable
#' elements and their chromosome number, start, end coordinate position. It
#' can be used to calculated the distance between KRAB-ZNFs and TEs.
#' @usage data(hg19rmsk_gtf)
#' data(hg19rmsk_gtf)
"hg19rmsk_gtf"

#' Positive selections of primates GRFs
#'
#' @description
#' This dataframe is from (Positive Selection in Gene Regulatory Factors
#' Suggests Adaptive Pleiotropic Changes During Human Evolution, Jovanovic,
#' et al. 2021). The data include 27 primates with their gene name, gene ID,
#' including transcription factors, co-factors and histone-modifying enzymes.
#' @usage data(primateGRFs)
"primateGRFs"

#'
