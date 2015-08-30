# httrplus

Addon to the `httr` package. 

The intention is for this package to be short-lived, and to serve as a converstation-starter to a pull-request to `httr`.

The purpose is to propose a framework around `httr::stop_for_status()` and `httr::warn_for_status()`. The aim is for you to be able to more-easily customise messsages and error/warning-signalling behaviour when using `httr`.

The central function in this package is `check_for_status()`. Its arguements are:

* `resp` - a `httr::response` object
* `type` - one of `c("error", "warning", "message")`
* `message_function` - a function that takes `resp` as its first arguement, returns message
* `...` - additional arguements to `message_function`

The default `message_function` is `message_standard()` (provided here), a function that replicates the messages returned by `httr::stop_for_status()` and `httr::warn_for_status()`

Hence, the existing `httr` functions could be rewritten:

```R
stop_for_status <- function(x){
  check_for_status(x, type = "error")
}

warn_for_status <- function(x){
  check_for_status(x, type = "warning")
}
```

Another message function is offered: `message_verbose()`.

## Installation

This package is not yet on CRAN (and hopefully won't be).

To get the current development version from github:

```R
# install.packages("devtools")
devtools::install_github("ijlyttle/httrplus")
```

