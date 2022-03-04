#' convert the ensID in row to gene name for heatmap visualization
#'
#' @param df
#' @param species
#'
#' @return a dataframe(matrix) with gene name in row names
#' @export
#'
#' @examples
ensIDtoName <- function(df, species) {
    ensIDList <- rownames(df)
    mat_forHeatmap <- df

    geneName <- gprofiler2::gconvert(query = ensIDList,
                                     organism = species,
                                     target="ENSG",
                                     mthreshold = Inf,
                                     filter_na = TRUE)
    # to avoid dulicated rownames, it is suggested to subset the data first
    # replace rownames
    rownames(mat_forHeatmap) <- geneName$name

    mat_forHeatmap
}
