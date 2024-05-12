legistar_methods <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1Py-Oqyb8kW13x0_BjGJS-fw1EdZzqBeIsjxvQvBV5dM/edit?usp=sharing",
  sheet = "methods"
)

cols <- c("type", "method", "template", "url", "description",
          "response", "modelName", "nm")

legistar_methods <- legistar_methods[, cols]

legistar_methods[["template"]] <- stringr::str_replace_all(
  legistar_methods[["template"]],
  "(?<=\\{)[:alpha:]+(?=\\})",
  janitor::make_clean_names
)

usethis::use_data(legistar_methods, overwrite = TRUE)
