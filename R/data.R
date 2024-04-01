#' Legistar Client Reference
#'
#' A data frame of identified Legistar client sites tested to check if client
#' responded to an API request with [legistar_get_bodies()]. Last updated
#' 2024-03-31.
#'
#' @format A data frame with 286 rows and 2 variables:
#' \describe{
#'   \item{\code{client}}{Client string}
#'   \item{\code{api}}{logical If `TRUE`, client returned an API response}
#'}
"legistar_clients"
