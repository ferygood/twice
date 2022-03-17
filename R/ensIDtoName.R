#' convert the ensID in row to gene name for heatmap visualization
#' @description `ensIDtoName` convert ensembl ID to gene name for more human
#' readibility. It takes a dataframe or matrix with ensembl gene ID as row
#' names and then convert them to common gene name. The default species name is
#' hsapiens. You can also specify the name of species you are interested in.
#' There are some situation you will face duplicated row names after convert.
#' Therefore, please consider first subset the data before conversion.
#' @param df a dataframe which has ensembl ID as row names
#' @param species the scientific abbreviation name of a species, such as
#' hsapiens for homo sapiens (human). The default is hsapiens.
#'
#' @return a dataframe(matrix) with gene name in row names
#' @export
#'
#' @examples
#' data(hmchimpGene)
#' data(hmKZNFs337)
#' dfKZNFs <-
#'     hmchimpGene[rownames(hmchimpGene) %in% hmKZNFs337$ensembl_gene_id, ]
#' df <- ensIDtoName(dfKZNFs, "hsapiens")
#'
#'
ensIDtoName <- function(df, species="hsapiens") {
    #df$ensid <- rownames(df)
    ensIDList <- rownames(df)
    geneName <- gprofiler2::gconvert(query = ensIDList,
                                     organism = species,
                                     target="ENSG",
                                     mthreshold = Inf,
                                     filter_na = TRUE)
    # to avoid dulicated rownames, it is suggested to subset the data first
    # replace rownames

    df$name <- geneName$name
    df <- df[!duplicated(df$name), ]

    rownames(df) <- df$name
    df <- df[,-(length(df))]
    df

}
