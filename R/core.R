## Windows-related functions

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
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_windows_ready <- function() {
        .Call("IsWindowReady_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_windows_ready <- function() {
        .Call("IsWindowReady_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_fullscreen <- function() {
        .Call("IsWindowFullscreen_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_hidden <- function() {
        .Call("IsWindowHidden_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_minimized <- function() {
        .Call("IsWindowMinimized_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_maximized <- function() {
        .Call("IsWindowMaximized_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_focused <- function() {
        .Call("IsWindowFocused_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_resized <- function() {
        .Call("IsWindowResized_R")
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_state <- function(flag) {
        stopifnot(is.numeric(flag))
        .Call("IsWindowState_R", as.integer(flag))
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_window_state <- function(flags) {
        stopifnot(is.numeric(flags))
        .Call("SetWindowState_R", as.integer(flags))
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
clear_window_state <- function(flags) {
        stopifnot(is.numeric(flags))
        .Call("ClearWindowState_R", as.integer(flags))
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
toggle_fullscreen <- function() {
        .Call("ToggleFullscreen_R")
        invisible()
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

#' @useDynLib raylib.R, .registration = TRUE
#' @name mode2d_init
#' @rdname mode2d_init
#' @title Functions to start and stop 2D mode
#' @description 
#' - `begin_mode_2d` - Begin 2D mode with custom camera (2D)
#' - `end_mode_2d` - Ends 2D mode with custom camera
#' @aliases begin_mode_2d
#' @aliases end_mode_2d
NULL

#' @useDynLib raylib.R, .registration = TRUE
#' @family Drawing-related functions 
#' @param camera Object created with Camera2D
#' @rdname mode2d_init
#' @export
begin_mode_2d <- function(camera) {
  if (class(camera) != "Camera2D") stop("Object passed to the 'camera' argument should be of 'Camera2D' class.")
  .Call("BeginMode2D_R", 
        camera[[1]][1], camera[[1]][2], 
        camera[[2]][1], camera[[2]][2],
        camera[[3]], camera[[4]])
}

#' @useDynLib raylib.R, .registration = TRUE
#' @family Drawing-related functions
#' @rdname mode2d_init
#' @export
end_mode_2d <- function() {
  .Call("EndMode2D_R")
}
