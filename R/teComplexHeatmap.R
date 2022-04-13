#' Use ComplexHeatmap to visualize TEs data from TEKRABber result
#' @description This function use ComplexHeatmap::Heatmap() to visualize TEs
#' data generated from using TEKRABber. The input dataframe is the file with
#' extension teDESeq2norm.csv from TEKRABber. You can specified how many of
#' the TEs you want to visualize. The default is showing the top 40 TEs
#' with the highest row means among all samples. You can also specify a list
#' to filter out a subset of TEs using the teFilter parameters. If you face an
#' error with could not find function "unit", you need to load the
#' ComplexHeatmap library to your workspace.
#' @param df a TEKRABber teDESeq2norm table
#' @param teFilter a list of transposable elements subsets
#' @param top a numeric value to show top number of genes in heatmap
#' @param fileName the name for saving pdf file (if specified)
#' @param speciesAnnot a vector containing species information for top annotation on
#' heatmap
#' @param teAnnot a vector containing class and family information for row annotation
#' on heatmap
#'
#' @importFrom matrixStats rowVars
#' @importFrom tidyHeatmap save_pdf
#' @return a ComplexHeatmap heatmap (Formal class Heatmap)
#' @export
#'
#' @examples
#' data(hmchimpTE)
#' data(hg19rmsk_info)
#'
#' teComplexHeatmap(hmchimpTE, teFilter=hg19rmsk_info$gene_id[1:10],
#'     speciesAnnot = c("h", "h", "h", "c", "c", "c"),
#'     teAnnot = hg19rmsk_info[c(1:10), ])
#'
#'
teComplexHeatmap <- function(df, teFilter=NULL, top=40, fileName=NULL,
                             speciesAnnot=NULL, teAnnot=NULL) {

    # Filter TEs by gene name if teFilter is specified
    if (!is.null(teFilter)) {
        df <- df[rownames(df) %in% teFilter, ]
    }


    if (top >= nrow(df)) {
        df <- df[order(rowVars(as.matrix(df)), decreasing = TRUE), ]
    } else if (is.numeric(top) & top > 0) {
        df <- df[order(rowVars(as.matrix(df)),
                       decreasing = TRUE), ][seq_len(top), ]
    }

    species_ha <- NULL
    te_ha <- NULL

    if(!is.null(speciesAnnot)) {
        species_ha = ComplexHeatmap::HeatmapAnnotation(species=speciesAnnot)
    }

    if(!is.null(teAnnot)) {
        te_ha = ComplexHeatmap::rowAnnotation(
            family = teAnnot$family_id,
            class = teAnnot$class_id
        )
    }

    g <- ComplexHeatmap::Heatmap(
        df,
        name="Expr.",
        width = ncol(df) * unit(4, "mm"),
        height = nrow(df) * unit(4, "mm"),
        cluster_columns = FALSE,
        column_names_rot = 45,
        row_names_gp = gpar(fontsize = 8),
        column_names_gp = gpar(fontsize = 8),
        rect_gp = gpar(col = "black", lwd = 0.8),
        top_annotation = species_ha,
        right_annotation = te_ha

    )


    if (!is.null(fileName)) {

        save_pdf(
            g,
            filename = fileName,
            width = 8.27,
            height = 11.69
        )
    }

    g
}

