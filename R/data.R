#' Legistar Client Reference
#'
#' A data frame of identified Legistar client sites tested to check if client
#' responded to an API request with [legistar_get_bodies()]. Last updated
#' 2024-05-12.
#'
#' @format A data frame with 286 rows and 2 variables:
#' \describe{
#'   \item{\code{client}}{Client string}
#'   \item{\code{api}}{logical If `TRUE`, client returned an API response}
#'}
"legistar_clients"

#' Legistar API Methods Reference
#'
#' A data frame with reference information from the Legistar Web API
#' documentation: <https://webapi.legistar.com/>. Organized in a Google Sheet
#' for use with this package:
#' <https://docs.google.com/spreadsheets/d/1Py-Oqyb8kW13x0_BjGJS-fw1EdZzqBeIsjxvQvBV5dM/edit?usp=sharing>
#' Last updated 2024-05-12.
#'
#' @format A data frame with 124 rows and 8 variables:
#' \describe{
#'   \item{`type`}{API method type}
#'   \item{`method`}{HTTP Request Method}
#'   \item{`template`}{Template string}
#'   \item{`url`}{Help URL}
#'   \item{`description`}{API method description}
#'   \item{`response`}{Expected API method response}
#'   \item{`modelName`}{Corresponding modelName for response}
#'   \item{`nm`}{Snake case method name}
#'}
#' @source https://webapi.legistar.com/
"legistar_methods"
