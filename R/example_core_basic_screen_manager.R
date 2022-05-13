#' @name core_basic_screen_manager
#' @rdname core_basic_screen_manager
#' @family Core examples
#' @title Basic Screen Manager
#' 
#' @description 
#' Example showing possibility to menage different screen types in main
#' game loop
#'
#' @examplesIf interactive()
#' 
#' play_game <- function() {
#' 
#'   ##################
#'   # Initialization #
#'   ##################
#' 
#'   screen_width <- 800
#'   screen_height <- 450
#' 
#'   init_window(screen_width, screen_height, "raylib [core] example - basic screen manager")
#' 
#'   # deinitialization of the window
#'   on.exit(close_window())
#' 
#'   current_screen <- "LOGO"
#' 
#'   frames_counter <- 0
#' 
#'   set_target_fps(60)
#' 
#'   ##################
#'   # Main game loop #
#'   ##################
#' 
#'   while(!window_should_close()) {
#' 
#'     # menage screen switches during this part
#'     switch(current_screen,
#' 
#'            LOGO = {
#' 
#'              frames_counter <- frames_counter + 1 # count frames
#' 
#'              # Wait for 2 seconds (120 frames) before jumping to TITLE screen
#'              if (frames_counter > 120)
#'                current_screen <- "TITLE"
#'            },
#' 
#'            TITLE = {
#' 
#'              if (is_key_pressed(keyboard_key$KEY_ENTER))
#'                current_screen <- "GAMEPLAY"
#' 
#'            },
#' 
#'            GAMEPLAY = {
#' 
#'              if (is_key_pressed(keyboard_key$KEY_ENTER))
#'                current_screen <- "ENDING"
#' 
#'            },
#' 
#'            ENDING = {
#' 
#'              if (is_key_pressed(keyboard_key$KEY_ENTER))
#'                current_screen <- "TITLE"
#' 
#'            })
#' 
#'     begin_drawing()
#' 
#'     clear_background(raylib_color$RAYWHITE)
#' 
#'     # draw differently depending on the current screen
#'     switch (current_screen,
#' 
#'             LOGO = {
#' 
#'               draw_text("LOGO SCREEN", 20, 20, 40, raylib_color$LIGHTGRAY)
#'               draw_text("WAIT for 2 SECONDS...", 290, 220, 20, raylib_color$GRAY)
#' 
#'             },
#' 
#'             TITLE = {
#' 
#'               draw_rectangle(0, 0, screen_width, screen_height, raylib_color$GREEN)
#'               draw_text("TITLE SCREEN", 20, 20, 40, raylib_color$DARKGREEN)
#'               draw_text("PRESS ENTER to JUMP to GAMEPLAY SCREEN", 120, 220, 20, raylib_color$DARKGREEN)
#' 
#'             },
#' 
#'             GAMEPLAY = {
#' 
#'               draw_rectangle(0, 0, screen_width, screen_height, raylib_color$PURPLE)
#'               draw_text("GAMEPLAY SCREEN", 20, 20, 40, raylib_color$MAROON)
#'               draw_text("PRESS ENTER to JUMP to ENDING SCREEN", 120, 220, 20, raylib_color$MAROON)
#' 
#'             },
#' 
#'             ENDING = {
#' 
#'               draw_rectangle(0, 0, screen_width, screen_height, raylib_color$BLUE)
#'               draw_text("ENDNG SCREEN", 20, 20, 40, raylib_color$DARKBLUE)
#'               draw_text("PRESS ENTER to JUMP to ENDING SCREEN", 120, 220, 20, raylib_color$DARKBLUE)
#' 
#'             })
#' 
#'     end_drawing()
#' 
#'   }
#' }
#' 
#' # run the game
#' 
#' play_game()
NULL