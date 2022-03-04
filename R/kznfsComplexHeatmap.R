#' Use ComplexHeatmap to visualize KZNFs data from TEKRABber result
#'
#' @param df a TEKRABber geneDESeq2Log2 table
#' @param top a numeric value to show top numer of genes in heatmap
#' @param species indicate the species name to convert ID
#'
#' @return a ComplexHeatmap heatmap
#' @export
#'
#' @examples
kznfsComplexHeatmap <- function(df, top=40, species = "hsapiens") {

    # this is a prototype, parameters can be added later
    data(hmKZNFs337)
    df_KZNFs <- df[rownames(df) %in% hmKZNFs337$ensembl_gene_id, ]

    if (top >= nrow(df_KZNFs)) {
        df_KZNFs <- df_KZNFs[order(rowMeans(df_KZNFs), decreasing = TRUE), ]
    } else if (is.numeric(top) & top > 0) {
        df_KZNFs <- df_KZNFs[order(rowMeans(df_KZNFs), decreasing = TRUE), ][seq_len(top), ]
    }

    mat_df <- ensIDtoName(df_KZNFs, species)
    ComplexHeatmap::Heatmap(mat_df, name="Hello")
}
