#' Filter transposable elements from rmsk reference based on given their gene,
#' family, and class ID.
#'
#' @description For filtering out the select transposable elements from gene,
#' family, and class to down-stream analysis, we provide this function to help
#' quickly list all options out. You can run this function first setting show
#' to TRUE to see every possibility. Then you provide a character vector
#' including the name of family/class you want to select. The function will
#' then return a subset of the rmsk dataframe.
#' @param rmskInfo rmsk dataframe, with three columns, gene_id, family_id, and
#' class_id
#' @param gene a vector including the gene names you want
#' @param family a vector including the family names you want
#' @param class a vector including the class names you want
#' @param show if you want to first see all possible family/class, set this as
#' TRUE
#'
#' @return a subset of rmsk dataframe including three columns, gene, family and
#' class
#' @export
#'
#' @examples
#' df <- data(hg19rmsk_info)
#'
#' #list all possibilities
#' rmskFilter(df, show=TRUE)
#'
#' # select family
#' rmskFilter(df, family="hAT-Charlie")
#'
#' # select class
#' df_subset <- rmskFilter(df, class= c("LINE", "SINE"))
#'
rmskFilter <- function(rmskInfo, gene=NULL, family=NULL, class=NULL, show=FALSE) {
    if (show==TRUE) {
        print("Family ID")
        print("=========================")
        print(unique(rmskInfo$family_id))
        print('-------------------------')
        print("Class ID")
        print("=========================")
        print(unique(rmskInfo$class_id))
    }

    if (!is.null(gene)) {
        rmskInfo <- rmskInfo[rmskInfo$gene_id %in% gene, ]
    }

    if (!is.null(family)) {
        rmskInfo <- rmskInfo[rmskInfo$family_id %in% family, ]
    }

    if (!is.null(class)) {
        rmskInfo <- rmskInfo[rmskInfo$class_id %in% class, ]
    }

    # rename row names
    rownames(rmskInfo) <- 1:nrow(rmskInfo)
    rmskInfo

}



