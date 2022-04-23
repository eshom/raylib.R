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
