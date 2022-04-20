#' @name core_basic_window
#' @rdname core_basic_window
#' @family Core examples
#' @title Basic window
#'
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
NULL

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

#' @name core_input_mouse
#' @rdname core_input_mouse
#' @family Core examples
#' @title Input mouse
#'
#' @examplesIf interactive()
#'## Initialization
#'screen_width <- 800
#'screen_height <- 450
#'
#'init_window(screen_width, screen_height, "raylib [core] example - mouse input")
#'
#'ball_position <- c(-100, -100)
#'ball_color <- Color("darkblue")
#'
#'set_target_fps(60) # Set our game to run at 60 frames-per-second
#'
#'## Main game loop
#'while (!window_should_close()) { # Detect window close button or ESC key
#'        ## Update
#'        ball_position <- get_mouse_position()
#'
#'        if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_LEFT))
#'                ball_color <- Color("maroon")
#'        else if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_MIDDLE))
#'                ball_color <- raylib_color$LIME
#'        else if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_RIGHT))
#'                ball_color <- Color("darkblue")
#'        else if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_SIDE))
#'                ball_color <- Color("purple")
#'        else if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_EXTRA))
#'                ball_color <- Color("yellow")
#'        else if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_FORWARD))
#'                ball_color <- Color("orange")
#'        else if (is_mouse_button_pressed(mouse_button$MOUSE_BUTTON_BACK))
#'                ball_color <- Color("beige")
#'
#'        ## Draw
#'        begin_drawing()
#'
#'        clear_background(Color("white"))
#'
#'        draw_circle_v(ball_position, 40, ball_color)
#'
#'        draw_text("move ball with mouse and click mouse button to change color",
#'                  10, 10, 20, Color("darkgray"))
#'
#'
#'        end_drawing()
#'}
#'
#'## De-Initialization
#'close_window() # Close window and OpenGL context
NULL
