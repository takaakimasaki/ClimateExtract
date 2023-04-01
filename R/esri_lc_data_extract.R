#' CHIRPS data download.
#' @param year Year.
#' @param utm_id UTM ID.
#' @param path path in which downloaded data will be stored.
#' @export
#' @return `chirps_data_extract()` download all the GEOTIFF files for the period between year_start and year_end from https://data.chc.ucsb.edu/products/CHIRPS-2.0/global_monthly/tifs/.
#' @examples
#'\dontrun{
#' esri_lc_data_extract(year,utm_id,path)
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip
#' @importFrom R.utils gunzip

#path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/chirps"
esri_lc_data_extract <- function(year,utm_id,path){
  #year <- 2017
  #utm_id <- "36N"
  year2 <- year+1
  url <- paste0("https://lulctimeseries.blob.core.windows.net/lulctimeseriespublic/lc",year,"/",utm_id,"_",year,"0101-",year2,"0101.tif")
  fileName <- gsub(".gz","",basename(url))
  #download.file(url_S_C, tmpFile)
  httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url)), overwrite=TRUE))
  #R.utils::gunzip(paste0(path,"/",basename(url)), overwrite=TRUE)
}

