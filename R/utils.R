#' @importFrom glue glue
myzip <- function(dir, name = "report", ...) {
  cmd <- glue::glue(
    "tar -zcvf {dirname(dir)}/{name}.tar.gz {dir}"
  )

  system(cmd)
}




