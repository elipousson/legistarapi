.onLoad <- function(lib, pkg) {
  utils::data(
    list = c(
      "legistar_methods"
    ),
    package = pkg,
    envir = parent.env(environment())
  )
}
