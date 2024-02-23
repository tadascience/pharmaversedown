#' @importFrom rlang on_load run_on_load
#' @importFrom jsonlite fromJSON
.onLoad <- function(lib, pkg) {
  run_on_load()
}

pharmaverse_universe_data <- NULL

on_load(
  pharmaverse_universe_data <- fromJSON("https://pharmaverse.r-universe.dev/api/packages/")
)
