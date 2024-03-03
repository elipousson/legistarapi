#' Get Legistar records
#'
#' @name legistar_get
#' @inheritParams legistar
NULL

#' @rdname legistar_get
#' @name legistar_get_actions
#' @export
legistar_get_actions <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "actions",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_bodies
#' @export
legistar_get_persons <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "persons",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_bodies
#' @export
legistar_get_bodies <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "bodies",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_body_types
#' @export
legistar_get_body_types <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "body_types",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_code_sections
#' @export
legistar_get_code_sections <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "code_sections",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_events
#' @export
legistar_get_events <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "events",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_indexes
#' @export
legistar_get_indexes <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "indexes",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_matter_requesters
#' @export
legistar_get_matter_requesters <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "matter_indexes",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_matter_requesters
#' @export
legistar_get_matter_requesters <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "matter_requesters",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_matters
#' @export
legistar_get_matters <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "matters",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_matter_statuses
#' @export
legistar_get_matter_statuses <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "matter_statuses",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_matter_types
#' @export
legistar_get_matter_types <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "matter_types",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_office_records
#' @export
legistar_get_office_records <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "office_records",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legistar_get
#' @name legistar_get_vote_types
#' @export
legistar_get_vote_types <- function(
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    client = client,
    template = "vote_types",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}
