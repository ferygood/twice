% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pieTE.R
\name{pieTE}
\alias{pieTE}
\title{Abundance of TEs using pie chart in class levels}
\usage{
pieTE(teExp, rmsk, fileName = NULL)
}
\arguments{
\item{teExp}{the filter columns of TE expression that you are interested}

\item{rmsk}{the rmsk reference. You can load the built-in one to use}

\item{fileName}{the name of plot if you want to save it}
}
\value{
a ggplot pie chart object
}
\description{
This function takes the expression of transposable elements
table form TEKRABber normalized results. (1) User should filter only the
columns related to the species is interested (2) Calculated the mean from
samples and combined expression level into new dataframe (3) merge them
based on TE class and round the expression in percentages (4) You can
specify the file name with path in a string if you want to save the file
reference tables
}
\examples{
data(hmchimpTE)
data(hg19rmsk_info)

df <- hmchimpTE
dfSelect <- df[,c(1,2,3)] #only select human columns
g <- pieTE(dfSelect, hg19rmsk_info)

}
