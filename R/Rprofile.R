library(BiocInstaller)
options("repos" = c(CRAN = "http://cran.rstudio.com/"))
options(
  # set editor
  editor = "nano",
  
  # disable tcl/tk
  menu.graphics = FALSE,
  
  # no fancy quotes
  useFancyQuotes = FALSE, 
  
  # warn on partial matches
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE
)


options(max.print=300)
## more scrolling up in .Rhistory
Sys.setenv(R_HISTSIZE = "100000")

## install.packages() default package repo
local({
	r <- getOption("repos")
	r["CRAN"] <- "https://cloud.r-project.org/"
	options(repos = r)
})

## Pre-loaded packages
# a new hidden environment for the profile
.Rprofile <- new.env()
with(.Rprofile, {
	     # add required libraries here
	     libs <- c("devtools", "usethis", "testthat", "microbenchmark")
	     status <- libs %in% utils::installed.packages()
	     if (!all(status)) {
		     message(sprintf("package(s) not found in R library paths:\n%s",
				     paste0(libs[!status], collapse = ", ")))

	     }
s <- base::summary
h <- utils::head

## ht==headtail, i.e., show the first and last 10 items of an object
ht <- function(d) rbind(head(d,10),tail(d,10))


})

## Single character shortcuts for summary() and head().

suppressMessages(attach(.Rprofile))
suppressWarnings({
	suppressPackageStartupMessages({
		invisible(unlist(lapply(.Rprofile$libs, require, character.only = TRUE)))
	})
})

## pkg description options
options(
  devtools.name = "Sancar Adali",
  devtools.desc.author = 'person("Sancar", "Adali", email = "sadali@gmail.com", role = c("aut", "cre"))',
  devtools.desc.license = "GPL-3",
  covr.gcov = Sys.which("gcov")
)


options(prompt="> ")
options(continue="... ")
 
options(width = 80)

## .First() run at the start of every R session. 
## Use to load commonly used packages? 
.First <- function() {
	# library(ggplot2)
	cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}
