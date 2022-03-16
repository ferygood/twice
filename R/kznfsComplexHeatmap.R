#' Use ComplexHeatmap to visualize KZNFs data from TEKRABber result
#' @description This function use ComplexHeatmap::Heatmap() to visualize KZNFs
#' data generated from using TEKRABber. First it will load the built-in
#' hmKZNFs337 and filter the dataframe. The dataframe is the file with
#' extension geneDESeq2norm.csv from TEKRABber. You can specified how many of
#' the KZNFs you want to visualize. The default is showing the top 40 KZNFs
#' with the highest row means among all samples. If you face an error with
#' could not find function "unit", you need to load the ComplexHeatmap library
#' to your workspace.
#' @param df a TEKRABber geneDESeq2norm table
#' @param top a numeric value to show top number of genes in heatmap
#' @param species indicate the species name to convert ID
#' @param fileName the name for saving pdf file (if specified)
#'
#' @return a ComplexHeatmap heatmap (Formal class Heatmap)
#' @export
#'
#' @examples
#' data(hmchimpGene)
#' kznfsComplexHeatmap(hmchimpGene, top=40, species="hsapiens")
#'
#'
kznfsComplexHeatmap <- function(df, top=40, species = "hsapiens", fileName=NULL) {

    # this is a prototype, parameters can be added later
    data(hmKZNFs337)
    df_KZNFs <- df[rownames(df) %in% hmKZNFs337$ensembl_gene_id, ]

    if (top >= nrow(df_KZNFs)) {
        df_KZNFs <- df_KZNFs[order(rowMeans(df_KZNFs), decreasing = TRUE), ]
    } else if (is.numeric(top) & top > 0) {
        df_KZNFs <- df_KZNFs[order(rowMeans(df_KZNFs), decreasing = TRUE), ]
        df_KZNFs <- df_KZNFs[seq_len(top), ]
    }

    mat_df <- ensIDtoName(df_KZNFs, species)

    g <- ComplexHeatmap::Heatmap(
        mat_df,
        cluster_columns = FALSE,
        name = "normalized",
        width = ncol(mat_df) * unit(4, "mm"),
        height = nrow(mat_df) * unit(4, "mm")
    )

    # save file in pdf format if fileName is specified
    if (!is.null(fileName)) {
        tidyHeatmap::save_pdf(
            g,
            filename = fileName,
            width = 8.27,
            height = 11.69
        )
    }

    g

}
