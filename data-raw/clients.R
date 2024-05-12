clients_list <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1Py-Oqyb8kW13x0_BjGJS-fw1EdZzqBeIsjxvQvBV5dM/edit?usp=sharing",
  sheet = "clients"
)

clients_list <- clients_list$clients

client_responses <- purrr::map(
  clients_list,
  \(x) {
    rlang::try_fetch(
      legistar_get_bodies(client = x),
      error = function(cnd) {
        return(NA_character_)
      }
    )
  }
)

client_had_response <- purrr::map_lgl(
  client_responses,
  \(x) {
    is.data.frame(x)
  }
)

legistar_clients <- data.frame(
  "client" = clients_list,
  "api" = client_had_response
)

usethis::use_data(legistar_clients, overwrite = TRUE)
