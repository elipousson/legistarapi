#' @noRd
legistar_url_parse <- function(url) {
  url_parsed <- httr2::url_parse(url)
  url_parsed
}

#' Create Legistar Web API Request
#'
#' @inheritParams httr2::request
#' @keywords internal
request_legistar <- function(base_url = "https://webapi.legistar.com") {
  req <- httr2::request(base_url)
  httr2::req_user_agent(req, "legistarapi (https://github.com/elipousson/legistarapi/)")
}

#' Create Legistar Web API Request with template
#'
#' @inheritParams httr2::req_template
#' @keywords internal
req_legistar <- function(template = "actions", ..., client = getOption("legistarapi.client")) {
  if (!grepl(template, "^GET|^PUT|^DELETE|^POST")) {
    template <- legistar_template(template)
  }

  httr2::req_template(
    req = request_legistar(),
    template = template,
    client = client,
    ...
  )
}

#' Extract Legistar Web API Response Body
#'
#' @inheritParams httr2::resp_body_json
#' @keywords internal
resp_legistar <- function(resp, ..., simplifyVector = FALSE, error_call = rlang::caller_env()) {
  httr2::resp_body_json(resp, ..., simplifyVector = simplifyVector)
}

#' Access data from the Legistar Web API
#'
#' Review the [Legistar Web API](https://webapi.legistar.com/) documentation for
#' more information.
#'
#' @seealso [legistar_template()]
#' @param client String with Legistar client name
#' @inheritParams req_legistar
#' @inheritParams httr2::req_perform
#' @inheritParams resp_legistar
#' @examples
#' legistar(template = "persons", client = "seattle")
#'
#' legistar(template = "bodies", client = "baltimore")
#'
#' @export
legistar <- function(...,
                     template = "actions",
                     client = getOption("legistarapi.client"),
                     simplifyVector = TRUE,
                     error_call = caller_env()) {
  req <- req_legistar(..., template = template, client = client)
  resp <- httr2::req_perform(req, error_call = error_call)
  resp_legistar(resp, simplifyVector = simplifyVector)
}

#' Set and get an option for `legistarapi.client`
#'
#' @param client String with client name
#' @keywords internal
set_legistar_client <- function(client) {
  options("legistarapi.client" = client)
}

#' @rdname set_legistar_client
#' @name get_legistar_client
#' @inheritParams base::getOption
#' @keywords internal
get_legistar_client <- function(default = NULL) {
  getOption("legistarapi.client", default = default)
}
