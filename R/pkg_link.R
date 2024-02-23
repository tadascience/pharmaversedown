
#' @importFrom dplyr filter
#' @export
pkg_link <- function(pkg) {
  info <- filter(pharmaverse_universe_data, Package == pkg)

  url <- gsub("\n", "", strsplit(info$URL, ",")[[1]])

  text <- if (identical(url, NA)) {
    glue::glue('`{{{pkg}}}`')
  } else if (length(url) == 1L) {
    glue::glue('[{{{pkg}}}]({url} "{info$Title}")')
  } else {
    glue::glue('[{{{pkg}}}]({url[1]} "{info$Title}")')
  }

  text
}
