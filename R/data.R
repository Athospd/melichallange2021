#' @keywords internal
download_file <- function(file, path, force = FALSE) {

  path <- file.path(path, "melichallange2021")

  if(!fs::dir_exists(path)) fs::dir_create(path)

  file_path <- file.path(path, file)
  file_url <- file.path("https://meli-data-challenge.s3.amazonaws.com/2021", file)

  if(!fs::file_exists(file_path) | force) {
    download.file(file_url, destfile = file_path)
  } else {
    message(glue::glue("File {file_path} already exists, download aborted. Use `force = TRUE` to force the download."))
  }

  file_path
}

#' test_data.csv
#'
#' Download and load of test_data.csv
#'
#' @param path (string) chosen dir to store the data
#' @param force (boolean) If file already exists, should it be downloaded again anyway?
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#'
#' test_data <- test_data()
#'
test_data <- function(path = "../datasets", force = FALSE) {
  file_path <- download_file(
    file = "test_data.csv",
    path = path,
    force = force
  )
  read.csv(file_path)
}

#' train_data.parquet
#'
#' Download and load of train_data.parquet
#'
#' @param path (string) chosen dir to store the data
#' @param force (boolean) If file already exists, should it be downloaded again anyway?
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#'
#' train_data <- train_data()
#'
train_data <- function(path = "../datasets", force = FALSE) {
  file_path <- download_file(
    file = "train_data.parquet",
    path = path,
    force = force
  )
  arrow::read_parquet(file_path)
}

#' sample_submission.csv.gz
#'
#' Download and load of sample_submission.csv.gz
#'
#' @param path (string) chosen dir to store the data
#' @param force (boolean) If file already exists, should it be downloaded again anyway?
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#'
#' sample_submission <- sample_submission()
#'
sample_submission <- function(path = "../datasets", force = FALSE) {
  file_path <- download_file(
    file = "sample_submission.csv.gz",
    path = path,
    force = force
  )
  read.csv(file_path, header = FALSE)
}

#' items_static_metadata_full.jl
#'
#' Download and load of items_static_metadata_full.jl
#'
#' @param path (string) chosen dir to store the data
#' @param force (boolean) If file already exists, should it be downloaded again anyway?
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#'
#' items_static_metadata_full <- items_static_metadata_full()
#'
items_static_metadata_full <- function(path = "../datasets", force = FALSE) {
  file_path <- download_file(
    file = "items_static_metadata_full.jl",
    path = path,
    force = force
  )
  tibble::as_tibble(jsonlite::stream_in(file(file_path)))
}
