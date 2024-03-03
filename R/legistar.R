#' @noRd
legistar_url_parse <- function(url, params = NULL, part = "query") {
  url_parsed <- httr2::url_parse(url)

  if (is.null(params)) {
    if (is.null(part)) {
      return(url_parsed)
    }

    return(url_parsed[[part]])
  }

  unlist(url_parsed[[part]][params])
}

#' @noRd
#' @examples
#'
#' url <- "https://baltimore.legistar.com/LegislationDetail.aspx?ID=6555833&GUID=693FE27B-A165-480F-AD19-56784438224B&Options=ID|Text|&Search="
#'
#' legistar_url_id(url)
#'
legistar_url_id <- function(url) {
  legistar_url_parse(url, "ID")
}

#' Create Legistar Web API Request
#'
#' @inheritParams httr2::request
#' @keywords internal
request_legistar <- function(base_url = "https://webapi.legistar.com") {
  req <- httr2::request(base_url)
  httr2::req_user_agent(
    req,
    "legistarapi (https://github.com/elipousson/legistarapi/)"
  )
}

#' @noRd
starts_with_method <- function(
    x,
    allowed_method = c("GET", "PUT", "DELETE", "POST")) {
  grepl(
    pattern = paste0("^", allowed_method, collapse = "|"),
    x = x
  )
}

#' Create Legistar Web API Request with template
#'
#' @inheritParams httr2::req_template
#' @keywords internal
req_legistar <- function(
    ...,
    template = "actions",
    client = getOption("legistarapi.client"),
    call = caller_env()) {
  params <- list2(...)

  check_string(client, call = call)

  if (!starts_with_method(template)) {
    template <- legistar_template(template)
  }

  httr2::req_template(
    req = request_legistar(),
    template = template,
    client = client,
    !!!params
  )
}

#' Extract Legistar Web API Response Body
#'
#' @inheritParams httr2::resp_body_json
#' @keywords internal
resp_legistar <- function(
    resp,
    ...,
    simplifyVector = FALSE,
    error_call = rlang::caller_env()) {
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
#' @param top,skip Passed to [httr2::req_url_query()]
#' @inheritParams httr2::req_url_query
#' @inheritParams resp_legistar
#' @examples
#' legistar(template = "persons", client = "seattle")
#'
#' legistar(template = "bodies", client = "baltimore")
#'
#' @export
#' @importFrom rlang list2
legistar <- function(...,
                     top = NULL,
                     skip = NULL,
                     .multi = "pipe",
                     template = "actions",
                     client = getOption("legistarapi.client"),
                     simplifyVector = TRUE,
                     error_call = caller_env()) {
  req <- req_legistar(
    ...,
    template = template,
    client = client,
    call = error_call
  )

  # See examples for syntax https://webapi.legistar.com/Home/Examples
  params <- list(top = top, skip = skip)

  params <- set_names(params, paste0("$", names(params)))

  req <- httr2::req_url_query(
    .req = req,
    !!!params,
    .multi = .multi
  )

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
