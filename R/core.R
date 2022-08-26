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

#' @family Windows-related functions
#' @title Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
#' @param image Image object. Image data loaded with [Image()]
#'
#' @export
set_window_icon <- function(image) {
        .Call(.C_SetWindowIcon_R, image)
        invisible()
}

#' @family Windows-related functions
#' @title Set title for window (only PLATFORM_DESKTOP)
#' @param title Character vector length 1. Window Title.
#'
#' @export
set_window_title <- function(title) {
        .Call(.C_SetWindowTitle_R, title)
        invisible()
}

#' @family Windows-related functions
#' @title  Set window position on screen (only PLATFORM_DESKTOP)
#' @param x Integer. X position.
#' @param y Integer. Y position.
#'
#' @export
set_window_position <- function(x, y) {
        .Call(.C_SetWindowPosition_R, x, y)
        invisible()
}

#' @family Windows-related functions
#' @title Set monitor for the current window (fullscreen mode)
#' @param monitor Integer. Monitor number.
#'
#' @export
set_window_monitor <- function(monitor) {
        .Call(.C_SetWindowMonitor_R, monitor)
        invisible()
}

#' @family Windows-related functions
#' @title Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
#' @param width Integer. Minimum width.
#' @param height Integer. Minimum height.
#'
#' @export
set_window_min_size <- function(width, height) {
        .Call(.C_SetWindowMinSize_R, width, height)
        invisible()
}

#' @family Windows-related functions
#' @title Set window dimensions
#' @param width Integer. Window width.
#' @param height Integer. Window height.
#'
#' @export
set_window_size <- function(width, height) {
        .Call(.C_SetWindowSize_R, width, height)
        invisible()
}

#' @family Windows-related functions
#' @title Get current screen width
#'
#' @export
get_screen_width <- function() {
        .Call(.C_GetScreenWidth_R)
}

#' @family Windows-related functions
#' @title Get current screen height
#'
#' @export
get_screen_height <- function() {
        .Call(.C_GetScreenHeight_R)
}

#' @family Windows-related functions
#' @title Get number of connected monitors
#'
#' @export
get_monitor_count <- function() {
        .Call(.C_GetMonitorCount_R)
}

#' @family Windows-related functions
#' @title Get current connected monitor
#'
#' @export
get_current_monitor <- function() {
        .Call(.C_GetCurrentMonitor_R)
}

#' @family Windows-related functions
#' @title Get specified monitor position
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_position <- function(monitor) {
        .Call(.C_GetMonitorPosition_R, monitor)
}

#' @family Windows-related functions
#' @title Get specified monitor width (max available by monitor)
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_width <- function(monitor) {
        .Call(.C_GetMonitorWidth_R, monitor)
}

#' @family Windows-related functions
#' @title Get specified monitor height (max available by monitor)
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_height <- function(monitor) {
        .Call(.C_GetMonitorHeight_R, monitor)
}

#' @family Windows-related functions
#' @title Get specified monitor physical width in millimetres
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_physical_width <- function(monitor) {
        .Call(.C_GetMonitorPhysicalWidth_R, monitor)
}

#' @family Windows-related functions
#' @title Get specified monitor physical height in millimetres
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_physical_height <- function(monitor) {
        .Call(.C_GetMonitorPhysicalHeight_R, monitor)
}

#' @family Windows-related functions
#' @title Get specified monitor refresh rate
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_refresh_rate <- function(monitor) {
        .Call(.C_GetMonitorRefreshRate_R, monitor)
}

#' @family Windows-related functions
#' @title Get window position XY on monitor
#' @return Vector2. XY position of window on monitor.
#'
#' @export
get_window_position <- function() {
        .Call(.C_GetWindowPosition_R)
}

#' @family Windows-related functions
#' @title Get window scale DPI factor
#' @return Vector2.
#'
#' @export
get_window_scale_DPI <- function() {
        .Call(.C_GetWindowScaleDPI_R)
}

#' @family Windows-related functions
#' @title Get the human-readable, UTF-8 encoded name of the primary monitor
#' @param monitor Integer. Monitor number.
#'
#' @export
get_monitor_name <- function(monitor) {
        .Call(.C_GetMonitorName_R, monitor)
}

#' @family Windows-related functions
#' @title Set clipboard text content
#' @param text Character vector, length 1.
#'
#' @export
set_clipboard_text <- function(text) {
        .Call(.C_SetClipboardText_R, text)
        invisible()
}

#' @family Windows-related functions
#' @title Get clipboard text content
#'
#' @export
get_clipboard_text <- function() {
        .Call(.C_GetClipboardText_R)
}

##--------------------------##
## Cursor-related functions
##--------------------------##
#' @family Cursor-related functions
#' @title Shows cursor
#'
#' @export
show_cursor <- function() {
        .Call(.C_ShowCursor_R)
        invisible()
}

#' @family Cursor-related functions
#' @title Hides cursor
#'
#' @export
hide_cursor <- function() {
        .Call(.C_HideCursor_R)
        invisible()
}

#' @family Cursor-related functions
#' @title  Check if cursor is not visible
#'
#' @export
is_cursor_hidden <- function() {
        .Call(.C_IsCursorHidden_R)
}

#' @family Cursor-related functions
#' @title Enables cursor (unlock cursor)
#'
#' @export
enable_cursor <- function() {
        .Call(.C_EnableCursor_R)
        invisible()
}

#' @family Cursor-related functions
#' @title Disables cursor (lock cursor)
#'
#' @export
disable_cursor <- function() {
        .Call(.C_DisableCursor_R)
        invisible()
}

#' @family Cursor-related functions
#' @title Check if cursor is on the screen
#'
#' @export
is_cursor_on_screen <- function() {
        .Call(.C_IsCursorOnScreen_R)
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

#' @family Drawing-related functions
#' @title Begin drawing to render texture
#' @param target Texture object.
#'
#' @export
begin_texture_mode <- function(target) {
        .Call(.C_BeginTextureMode_R, target)
        invisible()
}

#' @family Drawing-related functions
#' @title Ends drawing to render texture
#'
#' @export
end_texture_mode <- function() {
        .Call(.C_EndTextureMode_R)
        invisible()
}

#' @family Drawing-related functions
#' @title Begin custom shader drawing
#' @param shader Shader object.
#'
#' @export
begin_shader_mode <- function(shader) {
        .Call(.C_BeginShaderMode_R, shader)
        invisible()
}

#' @family Drawing-related functions
#' @title End custom shader drawing (use default shader)
#'
#' @export
end_shader_mode <- function() {
        .Call(.C_EndShaderMode_R)
        invisible()
}

#' @family Drawing-related functions
#' @title Begin blending mode
#'
#' Begin one of the following modes: alpha, additive, multiplied, subtract, custom.
#' @param mode Integer. Valid blend mode. One of [blend_mode]
#'
#' @export
begin_blend_mode <- function(mode) {
        .Call(.C_BeginBlendMode_R, mode)
        invisible()
}

#' @family Drawing-related functions
#' @title End blending mode (reset to default: alpha blending)
#'
#' @export
end_blend_mode <- function() {
        .Call(.C_EndBlendMode_R)
        invisible()
}

#' @family Drawing-related functions
#' @title Begin scissor mode
#'
#' Define screen area for following drawing
#' @param x Integer. X position.
#' @param y Integer. Y position.
#' @param width Integer.
#' @param height Integer.
#'
#' @export
begin_scissor_mode <- function(x, y, width, height) {
        .Call(.C_BeginScissorMode_R, x, y, width, height)
        invisible()
}

#' @family Drawing-related functions
#' @title End scissor mode
#'
#' @export
end_scissor_mode <- function() {
        .Call(.C_EndScissorMode_R)
        invisible()
}

##-----------------------------------##
## Shader management functions
##-----------------------------------##
#' @family Shader management functions
#' @title Get shader uniform location
#' @param shader Shader object.
#' @param uniform_name Character vector length 1. Name of the input
#' uniform to get location for.
#' @return Integer. The location index of the shader. One of [shader_location_index]
#'
#' @export
get_shader_location <- function(shader, uniform_name) {
        .Call(.C_GetShaderLocation_R, shader, uniform_name)
}

#' @family Shader management functions
#' @title Get shader attribute location
#' @param shader Shader object.
#' @param attrib_name Character vector length 1. Name of the attribute to get location for.
#' @return Integer. The location index of the shader. One of [shader_location_index]
#'
#' @export
get_shader_location_attrib <- function(shader, attrib_name) {
        .Call(.C_GetShaderLocationAttrib_R, shader, attrib_name)
}

#' @family Shader management functions
#' @title Set shader uniform value
#' @param shader Shader object.
#' @param loc_index Shader location index. One of [shader_location_index].
#' @param value Float or Integer vector. Possible lengths: 1 to 4.
#'
#' Sets a shader uniform value. The uniform type is determined from the `value`
#' vector's attributes. Possible uniform types or specified in [shader_uniform_data_type]
#'
#' A vector of double type is automatically cast to a float type. It is
#' recommended to use [as.integer()] and [as.double()] to make sure the selected
#' uniform data type is correct. For example, an integer vector of length 3
#' would get the uniform type `SHADER_UNIFORM_IVEC3`.
#' If you want to set sampler2d, use [set_shader_value_texture()].
#'
#' @export
set_shader_value <- function(shader, loc_index, value) {
        .Call(.C_SetShaderValue_R, shader, loc_index, value)
        invisible()
}

#' @family Shader management functions
#' @title Set shader uniform value vector
#' @param shader Shader object.
#' @param loc_index Shader location index. One of [shader_location_index].
#' @param value Float or Integer vector. Length must be a multiple of the shader
#' uniform type specified in `uniform_type`.
#' @param uniform_type Integer. One of [shader_uniform_data_type]
#'
#' Sets a shader uniform value for a uniform vector.
#' The uniform type must be specified, and the value's length must be a multiple of the type.
#'
#' A vector of double type is automatically cast to a float type. It is
#' recommended to use [as.integer()] and [as.double()] to make sure the selected
#' uniform data type is correct.
#' An example. An integer vector of length 9 and `uniform_type`
#' set to SHADER_UNIFORM_IVEC3 would result in setting
#' If you want to set sampler2d, use [set_shader_value_texture()].
#'
#' @export
set_shader_value_v <- function(shader, loc_index, value, uniform_type) {
        .Call(.C_SetShaderValueV_R, shader, loc_index, value, uniform_type)
        invisible()
}

#' @family Shader management functions
#' @title Set shader uniform value vector
#' @param shader Shader object.
#' @param loc_index Shader location index. One of [shader_location_index].
#' @param mat 4x4 numeric matrix.
#'
#' @export
set_shader_value_matrix <- function(shader, loc_index, mat) {
        .Call(.C_SetShaderValueMatrix_R, shader, loc_index, mat)
        invisible()
}

#' @family Shader management functions
#' @title Set shader uniform value vector
#' @param shader Shader object.
#' @param loc_index Shader location index. One of [shader_location_index].
#' @param texture Texture2D object.
#'
#' @export
set_shader_value_texture <- function(shader, loc_index, texture) {
        .Call(.C_SetShaderValueTexture_R, shader, loc_index, texture)
        invisible()
}
##-----------------------------------##
## Screen-space related functions
##-----------------------------------##
#' @family Screen-space related functions
#' @title Get a ray trace from mouse position
#' @param mouse_position Vector2.
#' @param camera Camera3D object.
#'
#' @export
get_mouse_ray <- function(mouse_position, camera) {
        .Call(.C_GetMouseRay_R, mouse_position, camera)
}

#' @family Screen-space related functions
#' @title Get camera transform matrix (view matrix)
#' @param camera Camera3D object.
#'
#' @export
get_camera_matrix <- function(camera) {
        .Call(.C_GetCameraMatrix_R, camera)
}

#' @family Screen-space related functions
#' @title Get camera 2d transform matrix
#' @param camera Camera2D object.
#'
#' @export
get_camera_matrix_2d <- function(camera) {
        .Call(.C_GetCameraMatrix2D_R, camera)
}

#' @family Screen-space related functions
#' @title Get the screen space position for a 3d world space position
#' @param position Vector3.
#' @param camera Camera3D
#'
#' @export
get_world_to_screen <- function(position, camera) {
        .Call(.C_GetWorldToScreen_R, position, camera)
}

#' @family Screen-space related functions
#' @title Get size position for a 3d world space position
#' @param position Vector3.
#' @param camera Camera3D
#' @param width Integer.
#' @param height Integer.
#'
#' @export
get_world_to_screen_ex <- function(position, camera, width, height) {
        .Call(.C_GetWorldToScreenEx_R, position, camera, width, height)
}

#' @family Screen-space related functions
#' @title Get the screen space position for a 2d camera world space position
#' @param position Vector2.
#' @param camera Camera2D
#'
#' @export
get_world_to_screen_2d <- function(position, camera) {
        .Call(.C_GetWorldToScreen2D_R, position, camera)
}

#' @family Screen-space related functions
#' @title Get the world space position for a 2d camera screen space position
#' @param position Vector2.
#' @param camera Camera2D
#'
#' @export
get_screen_to_world_2d <- function(position, camera) {
        .Call(.C_GetScreenToWorld2D_R, position, camera)
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

#' @family Timing-related functions
#' @title Get current FPS
#'
#' @export
get_fps <- function() {
        .Call(.C_GetFPS_R)
}

#' @family Timing-related functions
#' @title Get time in seconds for last frame drawn (delta time)
#'
#' @export
get_frame_time <- function() {
        .Call(.C_GetFrameTime_R)
}

#' @family Timing-related functions
#' @title Get elapsed time in seconds since InitWindow()
#'
#' @export
get_time <- function() {
        .Call(.C_GetTime_R)
}

##-----------------------------------##
## Misc. functions
##-----------------------------------##
#' @family Misc. functions
#' @title Takes a screenshot of current screen (filename extension defines format)
#' @param filename Character vector length 1. Name of the file. Extention defines format.
#' @export
take_screenshot <- function(filename) {
        .Call(.C_TakeScreenshot_R, filename)
}

#' @family Misc. functions
#' @title Setup init configuration flags (view FLAGS)
#' @param flags Integer. Config flag. One of [config_flags]
#'
#' @export
set_config_flags <- function(flags) {
        .Call(.C_SetConfigFlags_R, flags)
}

#' @family Misc. functions
#' @title Set the current threshold (minimum) log level
#' @param loglevel Integer. Log level, one of [trace_log_level]
#'
#' @export
set_trace_log_level <- function(loglevel) {
        .Call(.C_SetTraceLogLevel_R, loglevel)
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
load_dropped_files <- function() {
        .Call(.C_LoadDroppedFiles_R)
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
