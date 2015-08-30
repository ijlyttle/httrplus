#' message_standard
#'
#' This is a distillation of Hadley Wickham's message used in \code{httr}
#'
#' @param x    a request object
#'
#' @return character, a message concerning the request
#' @examples
#'   x <- httr::GET("http://httpbin.org/status/200")
#'   message_standard(x)
#'
#' @export
#'
message_standard <- function(x){

  status <- httr::status_code(x)
  message <- httr::http_status(status)$message

  message
}

#' message_verbose
#'
#' This returns a more verbose message than before
#'
#' @param x    a request object
#'
#' @return character, a message concerning the request
#' @examples
#'   x <- httr::GET("http://httpbin.org/status/200")
#'   message_verbose(x)
#'
#' @export
#'
message_verbose <- function(x){

  status <- httr::status_code(x)
  message <- httr::http_status(status)$message

  message
}

