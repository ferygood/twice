#' Title
#'
#' @param resGene
#' @param resTE
#' @param fileName
#'
#' @return
#' @export
#'
#' @examples
volGeneTE <- function(resGene, resTE, fileName=NULL) {

    #convert ensembl ID to gene name
    resGene <- ensIDtoName(resGene)

    # custom volcano func.
    vol <- function(df){
        EnhancedVolcano(df,
                        lab = rownames(df),
                        x = 'log2FoldChange',
                        y = 'pvalue',
                        labSize = 3.0,
                        FCcutoff = 1.0,
                        pCutoff = 0.05,
                        legendPosition = 'none',
                        legendLabSize = 10,
                        title = "",
                        subtitle = "",
                        caption = "")
    }

    geneVol <- vol(resGene)
    teVol <- vol(resTE)

    g <- ggarrange(geneVol, teVol)

    if (!is.null(fileName)) {
        ggsave(fileName,g, dpi=500, width=8.4, height=5.99)
    }

    g
}
