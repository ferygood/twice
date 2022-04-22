#' Integrate correlation pairs of KZNFs and TEs
#'
#' @param df
#' @param rmsk
#' @param title
#' @param fileName
#'
#' @import dplyr flextable
#' @importFrom tidyr unnest
#' @return a KZNFs TEs pairs table
#' @export
#'
#' @examples
#'
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
        df1, df2,
        by=c("KRAB-ZNFs" = "KRAB-ZNFs", "Family" = "Family", "Class"="Class")
    )

    set_flextable_defaults(
        font.size=12, font.family="Cambria"
    )

    ft <- flextable(df.all)
    ft <- width(ft, width=2)
    if (!is.null(title) && !is.null(fileNmae)) {
        save_as_html(title=ft, path=fileName)
    }

    df.all
}
