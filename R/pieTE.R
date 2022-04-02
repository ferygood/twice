#' Abundance of TEs using pie chart in class levels
#'
#' @description This function takes the expression of transposable elements
#' table form TEKRABber normalized results. (1) User should filter only the
#' columns related to the species is interested (2) Calculated the mean from
#' samples and combined expression level into new dataframe (3) merge them
#' based on TE class and round the expression in percentages (4) You can
#' specify the file name with path in a string if you want to save the file
#' reference tables
#' @param teExp the filter columns of TE expression that you are interested
#' @param rmsk the rmsk reference. You can load the built-in one to use
#' @param fileName the name of plot if you want to save it
#'
#' @importFrom ggrepel geom_label_repel
#' @importFrom forcats fct_inorder
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom dplyr mutate
#' @return a ggplot pie chart object
#' @export
#'
#' @examples
#' #df <- read.csv("../kap1/hmchimp_results/teDESeq2Log2.csv")
#' #load('data/hg19rmsk_info.rda')
#'
#' #dfSelect <- df[,c(1,2,3)] #only select human columns
#' #g <- pieTE(dfSelect, hg19rmsk_info)
#'
pieTE <- function(teExp, rmsk, fileName=NULL) {

    `%!in%` <- Negate(`%in%`)

    df <- teExp
    df$mean <- rowMeans(teExp)
    df$gene_id <- rownames(teExp)
    df <- df[,c("mean", "gene_id")]

    dfPie <- merge(df, rmsk, by.x="gene_id", by.y="gene_id")
    dfPie <- dfPie[,c("mean", "class_id")]

    dfPieSum <- aggregate(.~class_id, data=dfPie, FUN=sum)
    dfPieSum <- dfPieSum %>%
        mutate(mean = round(mean/sum(mean)*100, 2))

    major <- c("DNA", "LINE", "SINE", "LTR", "Satellite")
    other <- list("Others",
                  with(dfPieSum, sum(mean[class_id %!in% major])))
    dfSelect <- dfPieSum[dfPieSum$class_id %in% major, ]
    dfSelect <- rbind(dfSelect, other)

    dfSelectPie <- dfSelect %>%
        mutate(csum = rev(cumsum(rev(mean))),
               pos = mean/2 + lead(csum, 1),
               pos = if_else(is.na(pos), mean/2, pos))

    g <- ggplot(dfSelectPie,
                aes(x = "" , y = mean, fill = fct_inorder(class_id))) +
        geom_col(width = 1, color = 1) +
        coord_polar(theta = "y") +
        scale_fill_brewer(palette = "Pastel2") +
        geom_label_repel(data = dfSelectPie,
                         aes(y = pos, label = paste0(mean, "%")),
                         size = 4.5, nudge_x = 1, show.legend = FALSE) +
        guides(fill = guide_legend(title = "Class")) +
        theme_void()


    if (!is.null(fileName)){
        ggsave(
            fileName,
            plot=g,
            width = 5,
            height = 5,
            units = c("in"),
            dpi=400,
            bg="white"
        )
    }

    g
}
