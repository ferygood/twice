#' extract the gene/family/class TE information from repeatmasker gtf
#'
#' @description to extract TE id/family/class information and to prepare data
#' for visualize the abundance of TEs using pie chart (refer to pieTE())
#' @param rmskGTF /path/filename of your transposable element rmsk gtf
#' @param fileName provide file name if you want to save your result instead of
#' just returning it.
#'
#' @return a TE reference dataframe include gene_id, family_id and class_id
#' @export
#'
#' @examples
#'
#'
saveTErmsk <- function(rmskGTF, fileName=FALSE) {

    df <- rtracklayer::import(rmskGTF)
    df <- as.data.frame(df)

    # select only column includes id, family, class
    # and removed duplicated rows
    df.info <- df[,c("gene_id", "family_id", "class_id")]
    df.info <- df.info[!duplicated(df.info), ]

    # if users want to save the file in twice
    if (fileName!=FALSE) {
        assign(fileName, df.info)
        usethis::use_data(fileName)
    }

    df.info

}
