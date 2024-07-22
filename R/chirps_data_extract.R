#' CHIRPS data download.
#' @param year Year.
#' @param month Month.
#' @param path path in which downloaded data will be stored.
#' @export
#' @return `chirps_data_extract()` download all the GEOTIFF files for the period between year_start and year_end from https://data.chc.ucsb.edu/products/CHIRPS-2.0/global_monthly/tifs/.
#' @examples
#'\dontrun{
#' path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/chirps"
#' y <- 1981
#' m <- "01"
#' chirps_data_extract(year_start = 20,year_end = 22,month_start=13,month_end=33, region="west_africa", path="./data-clean")
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip
#' @importFrom R.utils gunzip

chirps_data_extract <- function(year,month,path){
  if(month<10){
    month <- paste0("0",month)
  }
  if(month>=11){
    month <- paste0(month)
  }
  url <- paste0("https://data.chc.ucsb.edu/products/CHIRPS-2.0/global_monthly/tifs/chirps-v2.0.",year,".",month,".tif.gz")
  httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url)), overwrite=TRUE))
  R.utils::gunzip(paste0(path,"/",basename(url)), overwrite=TRUE)
}
