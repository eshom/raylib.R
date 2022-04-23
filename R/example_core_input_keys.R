#' @name core_input_keys
#' @rdname core_input_keys
#' @family Core examples
#' @title Input keys
#'
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
NULL
