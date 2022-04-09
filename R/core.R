##--------------------------##
## Windows-related functions
##--------------------------##

#' @family Windows-related functions
#' @title Initialize window and OpenGL context
#' @param width Width of the window
#' @param height Height of the window
#' @param title Title of the window
#' @export
#' @examplesIf interactive()
#'## Initialization
#'screen_width <- 800
#'screen_height <- 450
#'
#'init_window(screen_width, screen_height, "raylib [core] example - basic window")
#'
#'set_target_fps(60) # Set our game to run at 60 frames-per-second
#'
#'## Main game loop
#'while (!window_should_close()) { # Detect window close button or ESC key
#'        ## Draw
#'        begin_drawing()
#'
#'        clear_background(Color("white"))
#'        draw_text("Congrats! You created your first window!", 190, 200, 20, Color("lightgray"))
#'
#'        end_drawing()
#'}
#'
#'## De-Initialization
#'close_window()
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
#' @param flags One of System/Window config flags. See: [config_flags]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_window_state <- function(flags) {
        stopifnot(is.numeric(flags))
        .Call("SetWindowState_R", as.integer(flags))
        invisible()
}

#' @family Windows-related functions
#' @title Clear window configuration state flags
#' @param flags One of System/Window config flags. See: [config_flags]
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

        .Call("ClearBackground_R", as.integer(color))
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
        stopifnot(inherits(camera, "Camera2D"))

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
        stopifnot(inherits(camera, "Camera3D"))

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
        stopifnot(key %in% raylib.R::keyboard_key)

        .Call("IsKeyPressed_R", key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key is being pressed
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
#' @examplesIf interactive()
#'## Initialization
#'screen_width <- 800
#'screen_height <- 450
#'
#'init_window(screen_width, screen_height, "raylib [core] example - keyboard input")
#'
#'ball_position <- c(x = screen_width / 2, y = screen_height / 2)
#'
#'set_target_fps(60) # Set our game to run at 60 frames-per-second
#'
#'## Main game loop
#'while (!window_should_close()) { # Detect window close button or ESC key
#'        ## Update
#'        if (is_key_down(keyboard_key$KEY_RIGHT))
#'                ball_position["x"] <- ball_position["x"] + 2
#'
#'        if (is_key_down(keyboard_key$KEY_LEFT))
#'                ball_position["x"] <- ball_position["x"] - 2
#'
#'        if (is_key_down(keyboard_key$KEY_UP))
#'                ball_position["y"] <- ball_position["y"] - 2
#'
#'        if (is_key_down(keyboard_key$KEY_DOWN))
#'                ball_position["y"] <- ball_position["y"] + 2
#'
#'        ## Draw
#'        begin_drawing()
#'
#'        clear_background(Color("white"))
#'        draw_text("Congrats! You created your first window!", 10, 10, 20, Color("darkgray"))
#'        draw_circle_v(ball_position, 50, Color("maroon"))
#'
#'        end_drawing()
#'}
#'
#'## De-Initialization
#'close_window()
is_key_down <- function(key) {
        stopifnot(key %in% raylib.R::keyboard_key)

        .Call("IsKeyDown_R", key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key has been released once
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_key_released <- function(key) {
        stopifnot(key %in% raylib.R::keyboard_key)

        .Call("IsKeyReleased_R", key)
}

#' @family Input-related functions: keyboard
#' @title Check if a key is NOT being pressed
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
is_key_up <- function(key) {
        stopifnot(key %in% raylib.R::keyboard_key)

        .Call("IsKeyUp_R", key)
}

#' @family Input-related functions: keyboard
#' @title Set a custom key to exit program (default is ESC)
#' @param key Keyboard key code. One of [keyboard_key]
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_exit_key <- function(key) {
        stopifnot(key %in% raylib.R::keyboard_key)

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
