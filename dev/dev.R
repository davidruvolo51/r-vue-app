#'////////////////////////////////////////////////////////////////////////////
#' FILE: dev.R
#' AUTHOR: David Ruvolo
#' CREATED: 2021-02-26
#' MODIFIED: 2021-02-26
#' PURPOSE: workspace management
#' STATUS: in.progress
#' PACKAGES: NA
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# renv -- manually add packages via `renv::install`
renv::init(bare = TRUE)
renv::install("palmerpenguins")
renv::install("plumber")
renv::install("jsonlite")