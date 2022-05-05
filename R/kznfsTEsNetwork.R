#' Generate KRAB-ZNFs and TEs regulatory network
#'
#' @description Use CoDiNA to generate gene regulatory network to combine
#' KRAB-ZNFs and TEs network between two species.
#' @param ... add CorrResult Network dataframe from TEKRABber result
#' @param code name of your network
#'
#' @return a list including DiffNet, Graph, network, znfName, teName
#' @export
#'
#' @examples
#' data(hmCorrResult)
#' data(chimpCorrResult)
#' kznfsTEsNetwork(hmCorrResult, chimpCorrResult, code=c("net1", "net2"))
#'
kznfsTEsNetwork <- function(..., code){

    dfList <- list()
    znfName <- c()
    teName <- c()

    for (df in list(...)) {
        df <- df %>%
            filter(pvalue < 0.05)
        df <- df[,c("geneName", "teName", "pvalue")]
        znfName <- c(df[,"geneName"])
        teName <- c(df[,"teName"])
        list1 <- list(df)
        dfList <- append(dfList, list1)
    }

    # remove duplicated
    znfName = unique(znfName)
    teName = unique(teName)

    DiffNet <- CoDiNA::MakeDiffNet(
        Data = dfList,
        Code = code
    )

    Graph <- plot(
        x = DiffNet,
        layout = NULL,
        smooth.edges = TRUE,
        path = NULL,
        MakeGroups=FALSE,
        Cluster = FALSE,
        legend = TRUE,
        manipulation = FALSE,
        sort.by.Phi = FALSE
    )

    # convert to an igraph object
    network <- CoDiNA::as.igraph(Graph)

    output <- list(
        DiffNet = DiffNet,
        Graph = Graph,
        network = network,
        znfName = znfName,
        teName = teName
    )

    output

}

