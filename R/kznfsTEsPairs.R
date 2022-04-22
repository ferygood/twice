#' Integrate correlation pairs of KZNFs and TEs
#'
#' @description This function takes the correlation result from TEKRABber and
#' repeatmasker annotation to integrate a table include positive and negative
#' correlation pairs of KRAB-ZNFs and TEs with their TE families and classes
#' information. You can specify filename and title to save as html file or
#' assign to a variable to get the csv file.
#' @param df a correlation result dataframe from TEKRABber
#' @param rmsk a transposable elements repeatmasker annotation
#' @param title title when open html file
#' @param fileName name for saving html files
#'
#' @import dplyr flextable
#' @importFrom tidyr unnest
#' @return a KZNFs TEs pairs table
#' @export
#'
#' @examples
#' data(hmCorrResult)
#' data(hg19rmsk_info)
#'
#' df <- kznfsTEsPairs(
#'     hmCorrResult,
#'     hg19rmsk_info,
#'     title="human KZNFsTEsPairs",
#'     fileName="hmKZNFsTEsPairs.html"
#' )
#'
kznfsTEsPairs <- function(df, rmsk, title=NULL, fileName=NULL) {

    colnames(rmsk) <- c("teName", "teFamily", "teClass")

    # filter only significant pairs
    df.sig <- df %>% filter(padj < 0.05)
    df.sig.positive <- df.sig %>%
        filter(coef > 0) %>%
        select(c(1,2)) %>%
        left_join(rmsk)
    df.sig.negative <- df.sig %>%
        filter(coef < 0) %>%
        select(c(1,2)) %>%
        left_join(rmsk)

    # aggregate data
    df.positive <- df.sig.positive %>%
        mutate(teName = strsplit(teName, ",")) %>%
        unnest(cols=c(teName)) %>%
        distinct(geneName, teName, teFamily, teClass) %>%
        group_by(geneName, teFamily, teClass) %>%
        summarise(teName = toString(teName))

    colnames(df.positive) <- c("KRAB-ZNFs", "Family", "Class", "positive TEs")

    df.negative <- df.sig.negative %>%
        mutate(teName = strsplit(teName, ",")) %>%
        unnest(cols=c(teName)) %>%
        distinct(geneName, teName, teFamily, teClass) %>%
        group_by(geneName, teFamily, teClass) %>%
        summarise(teName = toString(teName))

    colnames(df.negative) <- c("KRAB-ZNFs", "Family", "Class", "negative TEs")

    df.all <- full_join(
        df.positive, df.negative,
        by=c("KRAB-ZNFs" = "KRAB-ZNFs", "Family" = "Family", "Class"="Class")
    )

    set_flextable_defaults(
        font.size=12, font.family="Cambria"
    )

    ft <- flextable(df.all)
    ft <- width(ft, width=2)
    if (!is.null(title) && !is.null(fileName)) {
        save_as_html(ft, title=title, path=fileName)
    }

    df.all
}
