
#' Write the pkg_info for the pkg shortcode
#'
#' @importFrom jsonlite fromJSON
#' @export
write_pkg_info <- function() {
  pharmaverse_universe_data <- fromJSON("https://pharmaverse.r-universe.dev/api/packages/")
  pkgs <- pharmaverse_universe_data$Package
  titles <- gsub("\n", " ", pharmaverse_universe_data$Title)

  urls <- strsplit(pharmaverse_universe_data$URL, ",")
  urls <- sapply(urls, function(url) {
    url <- gsub("\n", "", url)
    if (identical(url, NA_character_)) {
      ""
    } else if (length(url) == 1L) {
      url
    } else {
      not_github <- !grepl("^https[:]//github[.]com/", url)
      idx <- if (any(not_github)) {
        which(not_github)[1L]
      } else {
        1L
      }
      url[idx]
    }
  })

  writeLines("pkg_info = {}")
  writeLines(glue::glue('pkg_info["{pkgs}"] = {{ url = "{urls}", title = "{titles}" }}'))
}
