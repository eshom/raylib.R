##--------------------------##
## Windows-related functions
##--------------------------##

#' @family Windows-related functions
#' @title Initialize window and OpenGL context
#' @param width Width of the window
#' @param height Height of the window
#' @param title Title of the window
#'
#' @export
init_window <- function(width, height, title = "raylib.R") {
        .Call(.C_InitWindow_R, width, height, title)
        invisible()
}

#' @family Windows-related functions
#' @title Check if KEY_ESCAPE pressed or Close icon pressed
#'
#' @export
window_should_close <- function() {
        .Call(.C_WindowShouldClose_R)
}

#' @family Windows-related functions
#' @title Close window and unload OpenGL context
#'
#' @export
close_window <- function() {
        .Call(.C_CloseWindow_R)
        invisible()
}

#' @family Windows-related functions
#' @title Check if window has been initialized successfully
#'
#' @export
is_window_ready <- function() {
        .Call(.C_IsWindowReady_R)
}

#' @family Windows-related functions
#' @title Check if window is currently fullscreen
#'
#' @export
is_window_fullscreen <- function() {
        .Call(.C_IsWindowFullscreen_R)
}

#' @family Windows-related functions
#' @title Check if window is currently hidden (only PLATFORM_DESKTOP)
#'
#' @export
is_window_hidden <- function() {
        .Call(.C_IsWindowHidden_R)
}

#' @family Windows-related functions
#' @title Check if window is currently minimized (only PLATFORM_DESKTOP)
#'
#' @export
is_window_minimized <- function() {
        .Call(.C_IsWindowMinimized_R)
}

#' @family Windows-related functions
#' @title Check if window is currently maximized (only PLATFORM_DESKTOP)
#'
#' @export
is_window_maximized <- function() {
        .Call(.C_IsWindowMaximized_R)
}

#' @family Windows-related functions
#' @title Check if window is currently maximized (only PLATFORM_DESKTOP)
#'
#' @export
is_window_focused <- function() {
        .Call(.C_IsWindowFocused_R)
}

#' @family Windows-related functions
#' @title Check if window has been resized last frame
#'
#' @export
is_window_resized <- function() {
        .Call(.C_IsWindowResized_R)
}

#' @family Windows-related functions
#' @title Check if one specific window flag is enabled
#' @param flag One of System/Window config flags. See: [config_flags]
#'
#' @export
is_window_state <- function(flag) {
        .Call(.C_IsWindowState_R, flag)
}

#' @family Windows-related functions
#' @title Set window configuration state using flags (only PLATFORM_DESKTOP)
#' @param flags One of System/Window config flags. See: [config_flags]
#'
#' @export
set_window_state <- function(flags) {
        .Call(.C_SetWindowState_R, flags)
        invisible()
}

#' @family Windows-related functions
#' @title Clear window configuration state flags
#' @param flags One of System/Window config flags. See: [config_flags]
#'
#' @export
clear_window_state <- function(flags) {
        .Call(.C_ClearWindowState_R, flags)
        invisible()
}

#' @family Windows-related functions
#' @title Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
#'
#' @export
toggle_fullscreen <- function() {
        .Call(.C_ToggleFullscreen_R)
        invisible()
}

#' @family Windows-related functions
#' @title Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
#'
#' @export
maximize_window <- function() {
        .Call(.C_MaximizeWindow_R)
        invisible()
}

#' @family Windows-related functions
#' @title Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
#'
#' @export
minimize_window <- function() {
        .Call(.C_MinimizeWindow_R)
        invisible()
}

#' @family Windows-related functions
#' @title Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
#'
#' @export
restore_window <- function() {
        .Call(.C_RestoreWindow_R)
        invisible()
}

##--------------------------##
## Drawing-related functions
##--------------------------##

#'
#' @name clear_background
#' @title Set background color (framebuffer clear color)
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @export
#' @family Drawing-related functions
clear_background <- function(color) {

        .Call(.C_ClearBackground_R, color)
        invisible()

}

#' @title Setup canvas (framebuffer) to start drawing
#'
#' @family Drawing-related functions
#' @export
begin_drawing <- function() {
        .Call(.C_BeginDrawing_R)
        invisible()
}

#' @title End canvas drawing and swap buffers (double buffering)
#'
#' @family Drawing-related functions
#' @export
end_drawing <- function() {
        .Call(.C_EndDrawing_R)
        invisible()
}

#' @family Drawing-related functions
#' @title Begin 2D mode with custom camera (2D)
#'
#' @param camera Camera2D object
#' @export
begin_mode_2d <- function(camera) {
        .Call(.C_BeginMode2D_R, camera)
        invisible()
}

#' @family Drawing-related functions
#' @title Ends 2D mode with custom camera (2D)
#'
#' @export
end_mode_2d <- function() {
        .Call(.C_EndMode2D_R)
        invisible()
}

#' @family Drawing-related functions
#'
#' @title Begin 3D mode with custom camera (3D)
#' @param camera Camera3D object
#' @export
begin_mode_3d <- function(camera) {
        .Call(.C_BeginMode3D_R, camera)
        invisible()
}

#' @family Drawing-related functions
#' @title End 3D mode with custom camera (3D)
#'
#' @export
end_mode_3d <- function() {
        .Call(.C_EndMode3D_R)
        invisible()
}

##-----------------------------------##
## Timing-related functions
##-----------------------------------##
#' @family Timing-related functions
#' @title Set target FPS (maximum)
#' @param fps Integer. Target FPS.
#'
#' @export
set_target_fps <- function(fps) {
        .Call(.C_SetTargetFPS_R, fps)
        invisible()
}

##-----------------------------------##
## File management functions
##-----------------------------------##

#' @family File management functions
#' @title Check if a file has been dropped into window
#'
#' @export
is_file_dropped <- function() {
        .Call(.C_IsFileDropped_R)
}

#' @family File management functions
#' @title Get dropped files names
#' @return Character vector of paths to the dropped files
#'
#' @export
get_dropped_files <- function() {
        .Call(.C_GetDroppedFiles_R)
}

##-----------------------------------##
## Input-related functions: keyboard
##-----------------------------------##

#' @family Input-related functions: keyboard
#' @title Check if a key has been pressed once
#' @param key Keyboard key code. One of [keyboard_key]
#'
#' @export
is_key_pressed <- function(key) {
        .Call(.C_IsKeyPressed_R, key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key is being pressed
#' @param key Keyboard key code. One of [keyboard_key]
#'
#' @export
is_key_down <- function(key) {
        .Call(.C_IsKeyDown_R, key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key has been released once
#' @param key Keyboard key code. One of [keyboard_key]
#'
#' @export
is_key_released <- function(key) {
        .Call(.C_IsKeyReleased_R, key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key is NOT being pressed
#' @param key Keyboard key code. One of [keyboard_key]
#'
#' @export
is_key_up <- function(key) {
        .Call(.C_IsKeyUp_R, key)
}

#' @family Input-related functions: keyboard
#' @title Set a custom key to exit program (default is ESC)
#' @param key Keyboard key code. One of [keyboard_key]
#'
#' @export
set_exit_key <- function(key) {
        .Call(.C_SetExitKey_R, key)
        invisible()
}

#' @family Input-related functions: keyboard
#' @title  get key pressed (keycode)
#'
#' call it multiple times for keys queued,
#' returns "KEY_NULL" when the queue is empty
#' @return One of [keyboard_key]
#'
#' @export
get_key_pressed <- function() {
        keycode <- .Call(.C_GetKeyPressed_R)

        names(raylib.R::keyboard_key)[which(raylib.R::keyboard_key %in% keycode)]
}

#' @family Input-related functions: keyboard
#' @title  get key pressed (unicode)
#'
#' call it multiple times for keys queued,
#' returns empty character when the queue is empty
#' @return UTF-8 encoded character
#'
#' @export
get_char_pressed <- function() {
        intToUtf8(.Call(.C_GetCharPressed_R))
}

##-----------------------------------##
## Input-related functions: mouse
##-----------------------------------##
#' @family Input-related functions: mouse
#' @title Check if a mouse button has been pressed once
#' @param button Integer. One of [mouse_button]
#'
#' @export
is_mouse_button_pressed <- function(button) {
        .Call(.C_IsMouseButtonPressed_R, button)
}

#' @family Input-related functions: mouse
#' @title Check if a mouse button is being pressed
#' @param button Integer. One of [mouse_button]
#'
#' @export
is_mouse_button_down <- function(button) {
        .Call(.C_IsMouseButtonDown_R, button)
}

#' @family Input-related functions: mouse
#' @title Check if a mouse button has been released once
#' @param button Integer. One of [mouse_button]
#'
#' @export
is_mouse_button_released <- function(button) {
        .Call(.C_IsMouseButtonReleased_R, button)
}

#' @family Input-related functions: mouse
#' @title Check if a mouse button is NOT being pressed
#' @param button Integer. One of [mouse_button]
#'
#' @export
is_mouse_button_up <- function(button) {
        .Call(.C_IsMouseButtonUp_R, button)
}

#' @family Input-related functions: mouse
#' @title Get mouse position X
#'
#' @export
get_mouse_x <- function() {
        .Call(.C_GetMouseX_R)
}

#' @family Input-related functions: mouse
#' @title Get mouse position Y
#'
#' @export
get_mouse_y <- function() {
        .Call(.C_GetMouseY_R)
}

#' @family Input-related functions: mouse
#' @title Get mouse position XY
#' @return Numeric vector with 2 elements: X position and Y position.
#'
#' @export
get_mouse_position <- function() {
        .Call(.C_GetMousePosition_R)
}

#' @family Input-related functions: mouse
#' @title Get mouse delta between frames
#' @return Numeric vector with 2 elements
#'
#' @export
get_mouse_delta <- function() {
        .Call(.C_GetMouseDelta_R)
}

#' @family Input-related functions: mouse
#' @title Set mouse position XY
#' @param x Integer. X position.
#' @param y Integer. Y position.
#'
#' @export
set_mouse_position <- function(x, y) {
        .Call(.C_SetMousePosition_R, x, y)
        invisible()
}

#' @family Input-related functions: mouse
#' @title Set mouse offset
#' @param offset_x Integer
#' @param offset_y Integer
#'
#' @export
set_mouse_offset <- function(offset_x, offset_y) {
        .Call(.C_SetMouseOffset_R, offset_x, offset_y)
        invisible()
}

#' @family Input-related functions: mouse
#' @title Set mouse scaling
#' @param scale_x Float
#' @param scale_y Float
#'
#' @export
set_mouse_scale <- function(scale_x, scale_y) {
        .Call(.C_SetMouseScale_R, scale_x, scale_y)
        invisible()
}

#' @family Input-related functions: mouse
#' @title Get mouse wheel movement Y
#'
#' @export
get_mouse_wheel_move <- function() {
        .Call(.C_GetMouseWheelMove_R)
}

#' @family Input-related functions: mouse
#' @title Set mouse cursor
#' @param cursor Integer. One of [mouse_cursor]
#'
#' @export
set_mouse_cursor <- function(cursor) {
        .Call(.C_SetMouseCursor_R, cursor)
        invisible()
}
