##--------------------------##
## Windows-related functions
##--------------------------##

#' @family Windows-related functions
#' @title Initialize window and OpenGL context
#' @param width Width of the window
#' @param height Height of the window
#' @param title Title of the window
#' @export
init_window <- function(width, height, title = "raylib.R") {
        .Call("InitWindow_R", width, height, title)
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
        .Call("IsWindowState_R", flag)
}

#' @family Windows-related functions
#' @title Set window configuration state using flags (only PLATFORM_DESKTOP)
#' @param flags One of System/Window config flags. See: [config_flags]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_window_state <- function(flags) {
        .Call("SetWindowState_R", flags)
        invisible()
}

#' @family Windows-related functions
#' @title Clear window configuration state flags
#' @param flags One of System/Window config flags. See: [config_flags]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
clear_window_state <- function(flags) {
        .Call("ClearWindowState_R", flags)
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

##--------------------------##
## Drawing-related functions
##--------------------------##

#' @useDynLib raylib.R, .registration = TRUE
#' @name clear_background
#' @title Set background color (framebuffer clear color)
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @export
#' @family Drawing-related functions
clear_background <- function(color) {

        .Call("ClearBackground_R", color)
        invisible()

}

#' @useDynLib raylib.R, .registration = TRUE
#' @name drawing
#' @rdname drawing
#' @title Functions To Start And Stop Canvas Drawing
#' @description
#' - `begin_drawing` - Setup canvas (framebuffer) to start drawing
#' - `end_drawing` - End canvas drawing and swap buffers (double buffering)
#' @aliases begin_drawing
#' @aliases end_drawing
NULL

#' @useDynLib raylib.R, .registration = TRUE
#' @family Drawing-related functions
#' @rdname drawing
#' @export
begin_drawing <- function() {
        .Call("BeginDrawing_R")
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @family Drawing-related functions
#' @rdname drawing
#' @export
end_drawing <- function() {
        .Call("EndDrawing_R")
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @name mode2d
#' @rdname mode2d
#' @title Functions to start and stop 2D mode
#' @description
#' - `begin_mode_2d` - Begin 2D mode with custom camera (2D)
#' - `end_mode_2d` - Ends 2D mode with custom camera
#' @aliases begin_mode_2d
#' @aliases end_mode_2d
#' @family Drawing-related functions
NULL

#' @useDynLib raylib.R, .registration = TRUE
#' @param camera Camera2D object
#' @rdname mode2d
#' @export
begin_mode_2d <- function(camera) {
        .Call("BeginMode2D_R", camera)
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @rdname mode2d
#' @export
end_mode_2d <- function() {
        .Call("EndMode2D_R")
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @name mode3d
#' @rdname mode3d
#' @title Functions to start and stop 3D mode
#' @description
#' - `begin_mode_3d` - Begin 3D mode with custom camera (3D)
#' - `end_mode_3d` - Ends 3D mode with custom camera
#' @family Drawing-related functions
NULL

#' @useDynLib raylib.R, .registration = TRUE
#' @param camera Camera3D object
#' @rdname mode3d
#' @export
begin_mode_3d <- function(camera) {
        .Call("BeginMode3D_R", camera)
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @rdname mode3d
#' @export
end_mode_3d <- function() {
        .Call("EndMode3D_R")
        invisible()
}

##-----------------------------------##
## Timing-related functions
##-----------------------------------##
#' @family Timing-related functions
#' @title Set target FPS (maximum)
#' @param fps Integer. Target FPS.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_target_fps <- function(fps) {
        .Call("SetTargetFPS_R", fps)
        invisible()
}

##-----------------------------------##
## Input-related functions: keyboard
##-----------------------------------##

#' @family Input-related functions: keyboard
#' @title Check if a key has been pressed once
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_key_pressed <- function(key) {
        .Call("IsKeyPressed_R", key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key is being pressed
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_key_down <- function(key) {
        .Call("IsKeyDown_R", key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key has been released once
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_key_released <- function(key) {
        .Call("IsKeyReleased_R", key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key is NOT being pressed
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_key_up <- function(key) {
        .Call("IsKeyUp_R", key)
}

#' @family Input-related functions: keyboard
#' @title Set a custom key to exit program (default is ESC)
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_exit_key <- function(key) {
        .Call("SetExitKey_R", key)
        invisible()
}

#' @family Input-related functions: keyboard
#' @title  get key pressed (keycode)
#'
#' call it multiple times for keys queued,
#' returns "KEY_NULL" when the queue is empty
#' @return One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_key_pressed <- function() {
        keycode <- .Call("GetKeyPressed_R")

        names(raylib.R::keyboard_key)[which(raylib.R::keyboard_key %in% keycode)]
}

#' @family Input-related functions: keyboard
#' @title  get key pressed (unicode)
#'
#' call it multiple times for keys queued,
#' returns empty character when the queue is empty
#' @return UTF-8 encoded character
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_char_pressed <- function() {
        intToUtf8(.Call("GetCharPressed_R"))
}

##-----------------------------------##
## Input-related functions: mouse
##-----------------------------------##
#' @family Input-related functions: mouse
#' @title Check if a mouse button has been pressed once
#' @param button Integer. One of [mouse_button]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_mouse_button_pressed <- function(button) {
        .Call("IsMouseButtonPressed_R", button)
}

#' @family Input-related functions: mouse
#' @title Check if a mouse button is being pressed
#' @param button Integer. One of [mouse_button]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_mouse_button_down <- function(button) {
        .Call("IsMouseButtonDown_R", button)
}

#' @family Input-related functions: mouse
#' @title Check if a mouse button has been released once
#' @param button Integer. One of [mouse_button]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_mouse_button_released <- function(button) {
        .Call("IsMouseButtonReleased_R", button)
}

#' @family Input-related functions: mouse
#' @title Check if a mouse button is NOT being pressed
#' @param button Integer. One of [mouse_button]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_mouse_button_up <- function(button) {
        .Call("IsMouseButtonUp_R", button)
}

#' @family Input-related functions: mouse
#' @title Get mouse position X
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_mouse_x <- function() {
        .Call("GetMouseX_R")
}

#' @family Input-related functions: mouse
#' @title Get mouse position Y
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_mouse_y <- function() {
        .Call("GetMouseY_R")
}

#' @family Input-related functions: mouse
#' @title Get mouse position XY
#' @return Numeric vector with 2 elements: X position and Y position.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_mouse_position <- function() {
        .Call("GetMousePosition_R")
}

#' @family Input-related functions: mouse
#' @title Get mouse delta between frames
#' @return Numeric vector with 2 elements
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_mouse_delta <- function() {
        .Call("GetMouseDelta_R")
}

#' @family Input-related functions: mouse
#' @title Set mouse position XY
#' @param x Integer. X position.
#' @param y Integer. Y position.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_mouse_position <- function(x, y) {
        .Call("SetMousePosition_R", x, y)
        invisible()
}

#' @family Input-related functions: mouse
#' @title Set mouse offset
#' @param offset_x Integer
#' @param offset_y Integer
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_mouse_offset <- function(offset_x, offset_y) {
        .Call("SetMouseOffset_R", offset_x, offset_y)
        invisible()
}

#' @family Input-related functions: mouse
#' @title Set mouse scaling
#' @param scale_x Float
#' @param scale_y Float
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_mouse_scale <- function(scale_x, scale_y) {
        .Call("SetMouseScale_R", scale_x, scale_y)
        invisible()
}

#' @family Input-related functions: mouse
#' @title Get mouse wheel movement Y
#' @useDynLib raylib.R, .registration = TRUE
#' @export
get_mouse_wheel_move <- function() {
        .Call("GetMouseWheelMove_R")
}

#' @family Input-related functions: mouse
#' @title Set mouse cursor
#' @param cursor Integer. One of [mouse_cursor]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_mouse_cursor <- function(cursor) {
        .Call("SetMouseCursor_R", cursor)
        invisible()
}
