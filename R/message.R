#' message_standard
#'
#' This is a recreation of the message used in the \code{httr} package.
#'
#' @param x    a request object
#'
#' @return character, single string concerning the request, suitable input to \code{cat()}
#' @examples
#'   x <- httr::GET("http://httpbin.org/status/200")
#'   message_standard(x)
#'
#' @export
#'
message_standard <- function(x){

  status <- httr::status_code(x)
  msg <- httr::http_status(status)$message

  msg
}

#' message_verbose
#'
#' A more-verbose message.
#'
#' This returns a more verbose message that includes:
#'
#' \itemize{
#'   \item standard message
#'   \item date
#'   \item url
#' }
#'
#' @param x    a request object
#'
#' @return single string concerning the request, suitable input to \code{cat()}
#' @examples
#'   x <- httr::GET("http://httpbin.org/status/200")
#'   message_verbose(x)
#'
#' @export
#'
message_verbose <- function(x){

  msg <- paste(
    message_standard(x),
    paste("date", httr::headers(x)$date, sep = ": "),
    paste("url", x$url, sep = ": "),
    sep = "\n"
  )

  msg
}

