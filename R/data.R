#' human hg19 repeatmasker annotation file
#'
#' @description
#' This is a repeatmasker annotation file including information of transposable
#' elements in human (hg19). This dataframe object has 3 columns. gene_id for
#' the name of transposable element, family_id for the class name, and class_id
#' for the class name.
#' @usage data(hg19rmsk_info)
#' @example
#' data(hg19rmsk_info)
"hg19rmsk_info"

#' Gene Expression data of human and chimpanzee
#'
#' @description
#' This is a gene expression dataframe including 3 replicates of human and
#' chimpanzee. Row names are ensembl gene ID and column names are sample ID.
#' @usage data(hmchimpGene)
#' @example
#' data(hmchimpGene)
"hmchimpGene"

#' Transposable elements (TE) data of human and chimpanzee
#'
#' @description
#' This is a TE expression dataframe including 3 replicates of human and
#' chimpanzee. Row names are TE gene ID and column names are sample ID.
#' @usage data(hmchimpTE)
#' @example
#' data(hmchimpTE)
"hmchimpTE"

#' Human KRAB-Zinc-Finger gene reference data
#'
#' @description
#' This is a 2 column dataframe including the ensembl gene ID and common gene
#' name of 337 KRAB-Zinc-Finger gene in human.
#' @usage data(hmKZNFs337)
#' @example
#' data(hmKZNFs337)
"hmKZNFs337"
