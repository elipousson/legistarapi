#' Get a Legistar Web API URL GET Template
#'
#' Review the [Legistar Web API](https://webapi.legistar.com/) documentation for
#' more information. See [this reference Google
#' Sheet](https://docs.google.com/spreadsheets/d/1Py-Oqyb8kW13x0_BjGJS-fw1EdZzqBeIsjxvQvBV5dM/edit?usp=sharing)
#' to see the URL patterns. A function to list the templates with definitions
#' for the purpose of each endpoint will be added in the future.
#'
#' @param template Template string corresponding to a template endpoint, e.g.
#'   `actions = "{client}/Actions"`, `bodies = "{client}/Bodies"`,
#'   or `code_sections = "{client}/CodeSections"`
#' @keywords internal
#' @export
legistar_template <- function(template = "actions", method = "GET") {

  template_match <- (legistar_methods[["method"]] == method) &
    (legistar_methods[["nm"]] == template)

  stopifnot(
    sum(template_match) == 1
  )

  legistar_methods[template_match, ][["template"]]
}
