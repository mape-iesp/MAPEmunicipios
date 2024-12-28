#' Function to download the main data file
#' 
#' The `download_mape_municipios` function downloads the main data file from the
#' [OSF](https://osf.io/3yka9/) main repository. It takes no arguments, downloads the
#' file (named as `mape_municipios.Rda` in the working directory), and returns a tibble 
#' with the main data file. 
#' 
#' @param quiet Logical. If `TRUE`, suppress messages and progress bar. Default is `FALSE`.
#' 
#' @return A tibble with the main data file
#' 
#' @importFrom utils download.file
#' @importFrom tibble as_tibble
#' @importFrom cli cli_alert_info
#' 
#' @examples
#' \dontrun{
#' mape_muns <- download_mape_municipios()
#' }
#' @export 

download_mape_municipios <- function(quiet = FALSE) {

    # File URL
    url <- "https://osf.io/download/5yez7/"

    # Checks if the file exists
    if (!file.exists("mape_municipios.Rda")) {
        # Download the data
        if (!quiet) cli::cli_alert_info("Downloading the dataset...")
        utils::download.file(url, destfile = "mape_municipios.Rda", mode = "wb", quiet = quiet)
    }

    # Load the data
    if (!quiet) cli::cli_alert_info("Loading the dataset...")
    if(!file.exists("mape_municipios.Rda")) {
        stop("The file was not downloaded. Please, check your internet connection and try again.")
    }
    mape_muns <- load_rda("mape_municipios.Rda") |>
        tibble::as_tibble()

    # Return
    return(mape_muns)
}
 

# Function to load Rda file
load_rda <- function(file) {
  tmp <- new.env()
  load(file = file, envir = tmp)
  tmp[[ls(tmp)[1]]]
}
