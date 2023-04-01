#' Download WRSI data from https://edcftp.cr.usgs.gov/project/fews/dekadal/.
#' @param year_start start year.
#' @param year_end end year.
#' @param month_start start month.
#' @param month_end end month.
#' @param path path in which downloaded data will be stored.
#' @export
#' @return `wrsi_data_extract()` download all the GEOTIFF files for the period between year_start and year_end from https://edcftp.cr.usgs.gov/project/fews/dekadal.
#' @examples
#'\dontrun{
#' wrsi_data_extract (year_start = 20,year_end = 22,month_start=13,month_end=33, region="west_africa", path="./data-clean")
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip

#path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/fews_net/WRSI"
#region <- "africa_west"
#year_start <- 2
#year_end <- 20
#month_start <- 13
#month_end <- 33
#pacman::p_load(dplyr, stringr, raster, sf, httr, exactextractr)
wrsi_data_extract <- function(year_start,year_end,month_start,month_end,region,path) {
setwd(path)
for(y in year_start:year_end) {
for(m in month_start:month_end) {
  #y <- 22
  #m <- 13
  if(y < 10) {
    url <- paste0("https://edcftp.cr.usgs.gov/project/fews/dekadal/",region,"/historical/w0",y,m,"w1.zip")
  }
  if(y >= 10 & y <20) {
    url <- paste0("https://edcftp.cr.usgs.gov/project/fews/dekadal/",region,"/historical/w",y,m,"w1.zip")
  }
  if(y >= 20) {
    url <- paste0("https://edcftp.cr.usgs.gov/project/fews/dekadal/",region,"/w",y,m,"w1.zip")
  }
  fileName <- gsub(".zip","",basename(url))
  #download.file(url_S_C, tmpFile)
  httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url), overwrite=TRUE)))
  utils::unzip(paste0(path,"/",basename(url)), overwrite=TRUE, exdir = ".")
  #name <- r %>% stringr::str_subset(., ".tif", negate = FALSE)
  #for(n in name){
  #  raster <- raster::raster(basename(n))
  #  raster::writeRaster(raster, paste0(path,"/",basename(n)), overwrite=TRUE)
  #}
  }
}
}
