#' Use ComplexHeatmap to visualize TEs data from TEKRABber result
#' @description
#' @param df a TEKRABber teDESeq2norm table
#' @param teFilter a list of transposable elements subsets
#' @param top a numeric value to show top number of genes in heatmap
#' @param filename the name for saving pdf file (if specified)
#'
#' @return a ComplexHeatmap heatmap (Formal class Heatmap)
#' @export
#'
#' @examples
teComplexHeatmap <- function(df, teFilter=NULL, top=40, filename=NULL) {

    # this is a prototype, parameters can be added later
    if (!is.null(teFilter)) {
        df <- df[rownames(df) %in% teFilter]
    }

    if (top >= nrow(df)) {
        df <- df[order(rowMeans(df), decreasing = TRUE), ]
    } else if (is.numeric(top) & top > 0) {
        df <- df[order(rowMeans(df), decreasing = TRUE), ][seq_len(top), ]
    }

    g <- ComplexHeatmap::Heatmap(
        df,
        name="normalized",
        width = ncol(df) * unit(5, "mm"),
        height = nrow(df) * unit(5, "mm")
    )

    if (!is.null(filename)) {

        save_pdf(
            g,
            filename = filename
        )
    }

    g
}

