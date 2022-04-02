## Windows-related functions

#' @family Windows-related functions
#' @title Initialize window and OpenGL context
#' @param width Width of the window
#' @param height Height of the window
#' @param title Title of the window
#' @export
init_window <- function(width, height, title = "raylib.R") {
        stopifnot(is.numeric(width), is.numeric(height), is.character(title))
        .Call("InitWindow_R", as.integer(width), as.integer(height), title)
        invisible()
}

#' @family Windows-related functions
#' @title Check if KEY_ESCAPE pressed or Close icon pressed
#' @useDynLib raylib.R, .registration = TRUE
#' @export
window_should_close <- function() {
        .Call("WindowShouldClose_R")
}

#' @family Windows-related functions
#' @title Close window and unload OpenGL context
#' @useDynLib raylib.R, .registration = TRUE
#' @export
close_window <- function() {
        .Call("CloseWindow_R")
        invisible()
}

#' @family Windows-related functions
#' @title Check if window has been initialized successfully
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_ready <- function() {
        .Call("IsWindowReady_R")
}

#' @family Windows-related functions
#' @title Check if window is currently fullscreen
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_fullscreen <- function() {
        .Call("IsWindowFullscreen_R")
}

#' @family Windows-related functions
#' @title Check if window is currently hidden (only PLATFORM_DESKTOP)
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_hidden <- function() {
        .Call("IsWindowHidden_R")
}

#' @family Windows-related functions
#' @title Check if window is currently minimized (only PLATFORM_DESKTOP)
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_minimized <- function() {
        .Call("IsWindowMinimized_R")
}

#' @family Windows-related functions
#' @title Check if window is currently maximized (only PLATFORM_DESKTOP)
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_maximized <- function() {
        .Call("IsWindowMaximized_R")
}

#' @family Windows-related functions
#' @title Check if window is currently maximized (only PLATFORM_DESKTOP)
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_focused <- function() {
        .Call("IsWindowFocused_R")
}

#' @family Windows-related functions
#' @title Check if window has been resized last frame
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_resized <- function() {
        .Call("IsWindowResized_R")
}

#' @family Windows-related functions
#' @title Check if one specific window flag is enabled
#' @param flag One of System/Window config flags. See: [config_flags]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_window_state <- function(flag) {
        stopifnot(is.numeric(flag))
        .Call("IsWindowState_R", as.integer(flag))
}

#' @family Windows-related functions
#' @title Set window configuration state using flags (only PLATFORM_DESKTOP)
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_window_state <- function(flags) {
        stopifnot(is.numeric(flags))
        .Call("SetWindowState_R", as.integer(flags))
        invisible()
}

#' @family Windows-related functions
#' @title Clear window configuration state flags
#' @useDynLib raylib.R, .registration = TRUE
#' @export
clear_window_state <- function(flags) {
        stopifnot(is.numeric(flags))
        .Call("ClearWindowState_R", as.integer(flags))
        invisible()
}

#' @family Windows-related functions
#' @title Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
#' @useDynLib raylib.R, .registration = TRUE
#' @export
toggle_fullscreen <- function() {
        .Call("ToggleFullscreen_R")
        invisible()
}

## Drawing-related functions

#' @name drawing_init
#' @rdname drawing_init
#' @title Functions To Start And Stop Canvas Drawing
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
