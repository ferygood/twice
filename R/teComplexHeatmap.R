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
#'
#' @return a ComplexHeatmap heatmap (Formal class Heatmap)
#' @export
#'
#' @examples
#' data(hmchimpTE)
#' teComplexHeatmap(hmchimpTE, top=40)
#'
#'
teComplexHeatmap <- function(df, teFilter=NULL, top=40, fileName=NULL) {

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
        width = ncol(df) * unit(4, "mm"),
        height = nrow(df) * unit(4, "mm")
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

