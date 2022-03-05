#' Title
#'
#' @param df
#' @param teFilter
#' @param top
#'
#' @return
#' @export
#'
#' @examples
teComplexHeatmap <- function(df, teFilter=NULL, top=40) {

    # this is a prototype, parameters can be added later
    if (!is.null(teFilter)) {
        df <- df[rownames(df) %in% teFilter]
    }

    if (top >= nrow(df)) {
        df <- df[order(rowMeans(df), decreasing = TRUE), ]
    } else if (is.numeric(top) & top > 0) {
        df <- df[order(rowMeans(df), decreasing = TRUE), ][seq_len(top), ]
    }

    ComplexHeatmap::Heatmap(df, name="Hello")
}
