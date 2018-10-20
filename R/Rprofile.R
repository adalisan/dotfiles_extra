options(
  # set editor
  editor = "vim",
  
  # disable tcl/tk
  menu.graphics = FALSE,
  
  # no fancy quotes
  useFancyQuotes = FALSE, 
  
  # warn on partial matches
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE
)

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
		cat("package(s) not found in R libs: ", 
			paste0(libs[!status], collapse = ", "), sep = "\n")
	}
})
suppressMessages(attach(.Rprofile))
suppressPackageStartupMessages({
invisible({
		unlist(lapply(.Rprofile$libs, require, character.only = TRUE))
	})
})

## pkg description options
options(
  devtools.name = "Metin Yazici",
  devtools.desc.author = 'person("Metin", "Yazici", email = "email@example.com", role = c("aut", "cre"))',
  devtools.desc.license = "GPL-3",
  covr.gcov = Sys.which("gcov")
)
