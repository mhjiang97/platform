#' Render Single-Cell RNA-seq Report
#' @description This function is to generate scReport.
#' @name report_sc
#' @aliases report_sc
#' @param dir_out the directory of the report.
#' @param name_out the name of the report, default: QC_sc.html.
#' @param dir_html the top/father directory of cell ranger outputs.
#' @param dir_qc the top/father directory of QC figures.
#' @param zip if use tar to zip the out directory, default: FALSE.
#' @param ... out name of the zipped file, default: name = "report".
#' @importFrom rmarkdown render
#' @importFrom glue glue
#' @export
#' @return NULL
#' @examples
#' \dontrun{
#' report_sc(dir_out = "./", dir_html = "/my/html/", dir_qc = "/my/qc/")
#' }
report_sc <- function(
  dir_out, name_out = "QC_sc.html", dir_html, dir_qc, zip = F, ...
) {
  checkVersion()
  if (!dir.exists(dir_out)) dir.create(dir_out, recursive = T)
  png_na <- system.file("extdata", "NA.png", package = "platform")
  rmd <- system.file("rmd", "QC_sc.Rmd", package = "platform")
  rmarkdown::render(
    rmd,
    output_format = "html_document",
    output_file = glue::glue("{dir_out}/{name_out}"),
    output_options = list(
      toc = T,
      toc_float = T,
      number_sections = T,
      center = T,
      theme = "bootstrap",
      highlight = "zenburn"
    )
  )

  if (zip) myzip(dir = dir_out, ...)
}


#' Render Bulk RNA-seq Report
#' @description This function is to generate bulk Report.
#' @name report_bulk
#' @aliases report_bulk
#' @param dir_out the directory of the report.
#' @param name_out the name of the report, default: QC_bulk.html.
#' @param files_meta a list, first meta file.
#' @param files_meta2 a list, second meta file.
#' @param dir_qc the top/father directory of QC figures.
#' @param dir_qc_fastq the top/father directory of FastQC results.
#' @param multiqc to specify an executable multiqc, default: multiqc.
#' @param zip if use tar to zip the out directory, default: FALSE.
#' @param ... out name of the zipped file, default: name = "report".
#' @importFrom rmarkdown render
#' @importFrom glue glue
#' @export
#' @return NULL
#' @examples
#' \dontrun{
#' report_bulk(
#'   dir_out = "./", files_meta = "/my/meta/", files_meta2 = "/my/meta2/",
#'   dir_qc = "/my/qc/", dir_qc_fastq = "/my/fastqc/"
#' )
#' }
report_bulk <- function(
  dir_out, name_out = "QC_bulk.html", files_meta, files_meta2, dir_qc,
  dir_qc_fastq, multiqc = "multiqc", zip = F, ...
) {
  checkVersion()
  if (!dir.exists(dir_out)) dir.create(dir_out, recursive = T)
  png_na <- system.file("extdata", "NA.png", package = "platform")
  rmd <- system.file("rmd", "QC.Rmd", package = "platform")
  rmarkdown::render(
    rmd,
    output_format = "html_document",
    output_file = glue::glue("{dir_out}/{name_out}"),
    output_options = list(
      toc = T,
      toc_float = T,
      number_sections = F,
      center = T,
      theme = "bootstrap",
      highlight = "zenburn"
    )
  )

  if (zip) myzip(dir = dir_out, ...)
}


#' Render Single-Cell RNA-seq Report (Total-seq)
#' @description This function is to generate scReport (Total-seq).
#' @name report_tt
#' @aliases report_tt
#' @param dir_out the directory of the report.
#' @param name_out the name of the report, default: QC_tt.html.
#' @param dir_html the top/father directory of cell ranger outputs.
#' @param dir_ref the top/father directory of feature_ref files.
#' @param dir_qc the top/father directory of QC figures.
#' @param zip if use tar to zip the out directory, default: FALSE.
#' @param ... out name of the zipped file, default: name = "report".
#' @importFrom rmarkdown render
#' @importFrom glue glue
#' @export
#' @return NULL
#' @examples
#' \dontrun{
#' report_tt(
#'   dir_out = "./", dir_html = "/my/html/", dir_ref = "/my/ref/",
#'   dir_qc = "/my/qc/"
#' )
#' }
report_tt <- function(
  dir_out, name_out = "QC_tt.html", dir_html, dir_ref, dir_qc, zip = F, ...
) {
  checkVersion()
  if (!dir.exists(dir_out)) dir.create(dir_out, recursive = T)
  png_na <- system.file("extdata", "NA.png", package = "platform")
  rmd <- system.file("rmd", "QC_tt.Rmd", package = "platform")
  rmarkdown::render(
    rmd,
    output_format = "html_document",
    output_file = glue::glue("{dir_out}/{name_out}"),
    output_options = list(
      toc = T,
      toc_float = T,
      number_sections = T,
      center = T,
      theme = "bootstrap",
      highlight = "zenburn"
    )
  )

  if (zip) myzip(dir = dir_out, ...)
}




