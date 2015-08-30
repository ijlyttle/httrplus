#' check_for_status
#'
#' @param type character, one of "error", "warning", "message"
#' @param message_function function, builds message,
#'   takes \code{x} as first arguement, \code{...} as additional arguements.
#'   Default is a standard message function.
#' @param ... additional arguements for \code{message_function}
#'
#'
check_for_status <- function(
  x, type = "error", message_function = message_standard, ...){

  # validate type
  type <- match.arg(type, c("error", "warning", "message"))

  # check to see if we can return without doing anything
  if (httr:::successful(x)) return(invisible(TRUE))

  # define the possible actions
  action <- list(error = stop, warning = warning, message = message)

  # build the message
  msg <- message_function(x, ...)

  # act
  action[[type]](httr::http_condition(x, type, message = msg, call = sys.call(-1)))

}
