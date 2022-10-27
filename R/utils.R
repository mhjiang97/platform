#' @importFrom glue glue
myzip <- function(dir, name = "report") {
  cmd <- glue::glue(
    "tar -zcvf {dirname(dir)}/{name}.tar.gz {dir}"
  )

  system(cmd)
}

#' @importFrom glue glue
#' @importFrom rmarkdown pandoc_version
#' @importFrom stringr str_split str_count
checkVersion <- function() {
  v <- as.character(rmarkdown::pandoc_version())
  if (stringr::str_count(v, "\\.") > 1) {
    v <- as.numeric(paste(unlist(stringr::str_split(v, "\\."))[1:2], collapse = "."))
  }

  if (v < 2.19) stop(glue::glue("Pandoc version must >2.19, but your pandoc version is {v}."))
}




