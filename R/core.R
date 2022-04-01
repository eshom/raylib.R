#' @useDynLib raylib.R, .registration = TRUE
#' @title Initialize the graphic window
#' @param width Width of the window
#' @param height Height of the window
#' @param title Title of the window
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

## Drawing-related functions

#' @useDynLib raylib.R, .registration = TRUE
#' @name drawing_init
#' @rdname drawing_init
#' @title Functions to start and stop canvas drawing
#' @description 
#' - `begin_drawing` - Setup canvas (framebuffer) to start drawing
#' - `end_drawing` - End canvas drawing and swap buffers (double buffering)
#' @aliases begin_drawing
#' @aliases end_drawing
NULL

#' @useDynLib raylib.R, .registration = TRUE
#' @family Drawing-related functions 
#' @rdname drawing_init
#' @export
begin_drawing <- function() {
        .Call("BeginDrawing_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @family Drawing-related functions
#' @rdname drawing_init
#' @export
end_drawing <- function() {
         .Call("EndDrawing_R")
}
