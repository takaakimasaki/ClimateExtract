#' CHIRPS data download.
#' @param year_start start year.
#' @param year_end end year.
#' @param path path in which downloaded data will be stored.
#' @export
#' @return `download_wrsi()` download all the GEOTIFF files for the period between year_start and year_end from https://edcftp.cr.usgs.gov/project/fews/dekadal.
#' @examples
#'\dontrun{
#' download_wrsi(year_start = 20,year_end = 22,month_start=13,month_end=33, region="west_africa", path="./data-clean")
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip
#' @importFrom R.utils gunzip

#path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/chirps"
chirps_data_extract <- function(year_start,year_end,path){
m_list <- c("01","02","03","04","05","06","07","08","09","10","11","12")
for(y in 1981:2022) {
for(m in m_list) {
  #y <- 1981
  #m <- "01"
  url <- paste0("https://data.chc.ucsb.edu/products/CHIRPS-2.0/global_monthly/tifs/chirps-v2.0.",y,".",m,".tif.gz")
  tmpFile <- tempfile()
  fileName <- gsub(".gz","",basename(url))
  #download.file(url_S_C, tmpFile)
  httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url), overwrite=TRUE)))
  R.utils::gunzip(paste0(path,"/",basename(url)), overwrite=TRUE)
  }
}
}

##check if worked...
#r <- raster(paste0("C:/Users/WB495141/Downloads/chirps-v2.0.2022.01.tif"))
#cellStats(r,stat="sum")
#r <- raster(paste0("C:/Users/WB495141/OneDrive - WBG/poverty/data/global/chirps/chirps-v2.0.2022.01.tif"))
#cellStats(r,stat="sum")
