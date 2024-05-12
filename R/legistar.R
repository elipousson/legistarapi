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


#' Create a ODATA query using `httr2::req_url_query`
#'
#' `req_odata_query()` provides incomplete support for the ODATA query
#' conventions through the `top`, `skip`, `filter`, `select`, `orderby`, and
#' `inlinecount` parameters. Working examples using the Legistar API
#'
#' Created using the [OData Version 3.0 Core
#' Protocol](https://www.odata.org/documentation/odata-version-3-0/odata-version-3-0-core-protocol/)
#' linked from the Legistar API documentation for reference.
#'
#' @keywords internal
#' @importFrom httr2 req_url_query
req_odata_query <- function(
    .req,
    ...,
    top = NULL,
    skip = NULL,
    filter = NULL,
    select = NULL,
    orderby = NULL,
    direction = NULL,
    count = NULL,
    inlinecount = NULL,
    .multi = "comma",
    error_call = caller_env()) {
  check_string(orderby, allow_empty = FALSE, allow_null = TRUE, call = error_call)
  check_character(select, allow_null = TRUE, call = error_call)

  if (!is.null(direction)) {
    direction <- arg_match0(direction, c("asc", "desc"), error_call = error_call)
    orderby <- paste(orderby, direction)
  }

  if (!is.null(count)) {
    check_logical(count, call = error_call)
    count <- tolower(count)
  }

  if (!is.null(inlinecount)) {
    inlinecount <- arg_match0(
      inlinecount,
      c("allpages", "none"),
      error_call = error_call
    )
  }

  # See examples for syntax https://webapi.legistar.com/Home/Examples
  params <- list2(
    "$top" = top,
    "$skip" = skip,
    "$filter" = filter,
    "$select" = select,
    "$orderby" = orderby,
    "$inlinecount" = inlinecount,
    "$count" = count,
    ...
  )

  if (is_empty(params)) {
    return(.req)
  }

  httr2::req_url_query(
    .req = .req,
    !!!params,
    .multi = .multi
  )
}

#' Parse a Legistar URL and return an ID query parameter
#'
#' @keywords internal
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
#' `req_legistar()` uses `request_legistar()` and `httr2::req_template()` to
#' create a Legistar Web API Request.
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
#' more information. This function is a work in progress. As of May 2024, it
#' returns all results for any query calling itself recursively.
#'
#' @seealso [legistar_template()]
#' @param client String with Legistar client name. Defaults to
#'   `getOption("legistarapi.client")`.
#' @inheritParams req_legistar
#' @inheritParams httr2::req_perform
#' @param top,skip,select,filter,orderby Passed to internal [req_odata_query()]
#'   function.
#' @param direction Default `NULL`. Use `"asc"` for ascending or `"desc"` for
#'   descending sort order based on `orderby` argument. Ignored if `orderby` is
#'   not supplied.
#' @param count,inlinecount Currently unsupported.
#' @param n_max Maximum number of records to return. Currently unsupported.
#' @inheritParams httr2::req_url_query
#' @inheritParams resp_legistar
#' @examples
#' legistar(template = "persons", client = "seattle", top = 5)
#'
#' legistar(template = "bodies", client = "baltimore", top = 5)
#'
#' @export
#' @importFrom rlang list2
legistar <- function(...,
                     template = "actions",
                     client = getOption("legistarapi.client"),
                     top = NULL,
                     skip = NULL,
                     select = NULL,
                     filter = NULL,
                     orderby = NULL,
                     direction = NULL,
                     count = NULL,
                     inlinecount = NULL,
                     .multi = "pipe",
                     simplifyVector = TRUE,
                     n_max = NULL,
                     error_call = caller_env()) {
  req <- req_legistar(
    ...,
    template = template,
    client = client,
    call = error_call
  )

  req <- req_odata_query(
    req,
    top = top,
    skip = skip,
    select = select,
    filter = filter,
    orderby = orderby,
    direction = direction,
    inlinecount = inlinecount,
    count = count,
    error_call = error_call
  )

  resp <- httr2::req_perform(req, error_call = error_call)

  body <- resp_legistar(resp, simplifyVector = simplifyVector)

  if (is_true(count)) {
    return(body)
  }

  # FIXME: Recursive multipage calls currently not supported if `simplifyVector
  # = FALSE`
  if (!is.data.frame(body)) {
    return(body)
  }

  return_body <- nrow(body) < 1000

  if (!is.null(n_max)) {
    stopifnot(is.integer(n_max))
    # TODO: Add support for n_max parameter
  }

  if (return_body) {
    return(body)
  }

  if (!is.null(skip)) {
    skip <- skip + 1000
  } else {
    skip <- 1000
  }

  next_page <- legistar(
    ...,
    template = template,
    client = client,
    top = top,
    skip = skip,
    select = select,
    filter = filter,
    orderby = orderby,
    inlinecount = inlinecount,
    error_call = error_call,
    simplifyVector = simplifyVector
  )

  purrr::list_rbind(
    list(
      body,
      next_page
    )
  )
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
