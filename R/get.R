#' Get actions from a Legistar site
#'
#' [legis_get_actions()] lists actions and [legis_get_action()] gets a single
#' action by ID.
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_actions <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "actions",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legis_get_actions
#' @param id Action ID. Required for [legis_get_action()].
#' @export
legis_get_action <- function(
    id,
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    id = id,
    ...,
    client = client,
    template = "actions_action_id",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get bodies from a Legistar site
#'
#' [legis_get_bodies()] lists actions and [legis_get_body()] gets a single
#' body by ID.
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_bodies <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "bodies",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @name legis_get_bodies
#' @param body_id Body ID. Required for [legis_get_body()].
#' @export
legis_get_body <- function(
    body_id,
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "bodies_body_id",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get persons from a Legistar site
#'
#' See [Adding a New
#' Person](https://support.granicus.com/s/article/Adding-a-New-Person) for more
#' information on persons in Legistar.
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_persons <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "persons",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @name legis_get_persons
#' @param person_id Person ID. Required for [legis_get_person()].
#' @export
legis_get_person <- function(
    person_id,
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    person_id = person_id,
    ...,
    client = client,
    template = "persons_person_id",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}


#' Get body types from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_body_types <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "body_types",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legis_get_body_types
#' @param body_type_id Body type ID. Required for [legis_get_body_type()].
#' @export
legis_get_body_type <- function(
    body_type_id,
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    body_type_id = body_type_id,
    ...,
    client = client,
    template = "body_types_body_type_id",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}



#' Get code sections from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_code_sections <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "code_sections",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @param code_section_id Code section ID. Required for
#'   [legis_get_code_section()].
#' @rdname legis_get_code_sections
#' @export
legis_get_code_section <- function(
    code_section_id,
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    code_section_id = code_section_id,
    ...,
    client = client,
    template = "code_sections_code_section_id",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get events from a Legistar site
#'
#' [legis_get_event()] also requires `event_items`, `agenda_note`,
#' `minutes_note`, and `event_item_attachments` parameters. These likely should
#' be optional so the function should be considered non-functional at present.

#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_events <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "events",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' @rdname legis_get_events
#' @param event_id Event ID. Required for [legis_get_event()].
#' @export
legis_get_event <- function(
    event_id,
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    event_id = event_id,
    ...,
    client = client,
    template = "events",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get indexes from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_indexes <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "indexes",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get matter indexes from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_matter_indexes <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "matter_indexes",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}


#' Get matter requesters from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_matter_requesters <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "matter_requesters",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get matters from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_matters <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "matters",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}


#' Get matter statuses from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_matter_statuses <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "matter_statuses",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}


#' Get matter types from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_matter_types <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "matter_types",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get office records from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_office_records <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "office_records",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}

#' Get vote types from a Legistar site
#'
#' @inheritParams legistar
#' @inheritDotParams legistar -template
#' @export
legis_get_vote_types <- function(
    ...,
    client = getOption("legistarapi.client"),
    simplifyVector = TRUE,
    error_call = caller_env()) {
  legistar(
    ...,
    client = client,
    template = "vote_types",
    simplifyVector = simplifyVector,
    error_call = error_call
  )
}
