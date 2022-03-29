#' @useDynLib raylib.R, .registration = TRUE
#' @export
init_window <- function(width, height, title = "raylib.R") {
        stopifnot(is.numeric(width), is.numeric(height), is.character(title))
        .Call("InitWindow_R", as.integer(width), as.integer(height), title)
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
window_should_close <- function() {
        .Call("WindowShouldClose_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
close_window <- function() {
        .Call("CloseWindow_R")
}
