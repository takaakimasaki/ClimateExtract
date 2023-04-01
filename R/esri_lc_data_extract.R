#' ESRI landcover data download.
#' @param year Year.
#' @param utm_id UTM ID.
#' @param path path in which downloaded data will be stored.
#' @export
#' @return `esri_lc_data_extract()` download GEOTIFF tile (utm_id) from https://livingatlas.arcgis.com/landcoverexplorer/#mapCenter=-121.64%2C39.371%2C11&mode=step&timeExtent=2017%2C2022&year=2022. 
#' @examples
#'\dontrun{
#' path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/chirps"
#' year <- 2017
#' utm_id <- "36N"
#' esri_lc_data_extract(year,utm_id,path)
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip
#' @importFrom R.utils gunzip

esri_lc_data_extract <- function(year,utm_id,path){
  year2 <- year+1
  url <- paste0("https://lulctimeseries.blob.core.windows.net/lulctimeseriespublic/lc",year,"/",utm_id,"_",year,"0101-",year2,"0101.tif")
  #fileName <- gsub(".gz","",basename(url))
  #download.file(url_S_C, tmpFile)
  httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url)), overwrite=TRUE))
  #R.utils::gunzip(paste0(path,"/",basename(url)), overwrite=TRUE)
}

