#' @importFrom glue glue
myzip <- function(dir, name = "report", ...) {
  cmd <- glue::glue(
    "tar -zcvf {dirname(dir_out)}/{name}.tar.gz {dir_out}"
  )

  system(cmd)
}




