#' Values of log10 to interpolate between
#'
#' The data is generated with R, such that the first column are the values from
#' 1 to 100 in steps of 0.01. The second colum is the log10 function from R of
#' the first column.
#'
#' @docType data
#'
#' @usage data(log10data)
#'
#' @format A dataframe with 9901 rows and 2 columns.
#'
#' @keywords datasets
#'
#' @export
#'
#' @examples
#' data(log10data)
#' k <- log10data$k
#' logk <- log10data$logk
#' \donttest{plot(k, logk)}
"log10data"
