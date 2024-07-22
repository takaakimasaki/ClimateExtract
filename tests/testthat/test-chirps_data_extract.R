test_that("chirps download works",{
  expect_equal({
    year <- 2022
    month <- 9
    if(month<10){
      month <- paste0("0",month)
    }
    if(month>=11){
      month <- paste0(month)
    }
    path <- tempdir()
    filename <- paste0(path, "\\","chirps-v2.0.", year,".", month,".tif")
    chirps_data_extract(year, month, path)
    r <- raster::raster(filename)
    dim(r)[1]
  }, 2000)
  })
