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

#' @name core_2d_camera
#' @rdname core_2d_camera
#' @family Core examples
#' @title Interactive 2D Camera
#'
#' @examplesIf interactive()
#'MAX_BUILDINGS <- 100
#'
#'####################
#'## Initialization ##
#'####################
#'screen_width <- 800
#'screen_height <- 450
#'
#'init_window(screen_width, screen_height, "raylib [core] example - 2d camera")
#'
#'player <- Rectangle(400, 280, 40, 40)
#'
#'construct_building <- function(screen_width, screen_height, spacing) {
#'        build <- Rectangle(0, 0, 0, 0)
#'
#'        build["width"] <- runif(1, 50, 200)
#'        build["height"] <- runif(1, 100, 800)
#'        build["y"] <- screen_height - 130 - build["height"]
#'        build["x"] <- -6000 + spacing
#'
#'        build
#'}
#'
#'spacing <- 0
#'buildings <- vector("list", MAX_BUILDINGS)
#'for (i in seq_len(length(buildings))) {
#'        buildings[[i]] <- construct_building(screen_width, screen_height, spacing)
#'        spacing <- spacing + buildings[[i]]["width"]
#'}
#'
#'random_colors <- function(n) {
#'        cols <- data.frame(red = runif(n, 200, 240), green = runif(n, 200, 240),
#'                           blue = runif(n, 200, 250), alpha = 255)
#'
#'        as.list(as.data.frame(t(cols)))
#'}
#'
#'build_colors <- random_colors(MAX_BUILDINGS)
#'
#'camera <- Camera2D(target = Vector2(player["x"] + 20, player["y"] + 20),
#'                   offset = Vector2(screen_width / 2, screen_height / 2),
#'                   rotation = 0,
#'                   zoom = 1)
#'
#'set_target_fps(60) # Set our game to run at 60 frames-per-second
#'
#'####################
#'## Main game loop ##
#'####################
#'while (!window_should_close()) { # Detect window close button or ESC key
#'        ############
#'        ## Update ##
#'        ############
#'
#'        ## Player movement
#'        if (is_key_down(keyboard_key$KEY_RIGHT))
#'                player["x"] <- player["x"] + 2
#'        else if (is_key_down(keyboard_key$KEY_LEFT))
#'                player["x"] <- player["x"] - 2
#'
#'        ## Camera target follows player
#'        camera$target <- c(player["x"] + 20, player["y"] + 20)
#'
#'        ## Camera rotation controls
#'        if (is_key_down(keyboard_key$KEY_A))
#'                camera$rotation <- camera$rotation - 1
#'        else if (is_key_down(keyboard_key$KEY_S))
#'                camera$rotation <- camera$rotation + 1
#'
#'        ## Camera zoom controls
#'        camera$zoom <- camera$zoom + get_mouse_wheel_move() * 0.05
#'
#'        if (camera$zoom > 3)
#'                camera$zoom <- 3
#'        else if (camera$zoom < 0.1)
#'                camera$zoom <- 0.1
#'
#'        ## Camera reset (zoom and rotation)
#'
#'        if (is_key_pressed(keyboard_key$KEY_R)) {
#'                camera$zoom <- 1
#'                camera$rotation <- 0
#'        }
#'
#'        ##########
#'        ## Draw ##
#'        ##########
#'        begin_drawing()
#'        {
#'                clear_background(raylib_color$RAYWHITE)
#'
#'                begin_mode_2d(camera)
#'                {
#'                        draw_rectangle(-6000, 320, 13000, 8000, raylib_color$DARKGRAY)
#'
#'                        Map(draw_rectangle_rec, buildings, build_colors)
#'
#'                        draw_rectangle_rec(player, raylib_color$RED)
#'
#'                        draw_line(c(camera$target["x"], -screen_height * 10, camera$target["x"],
#'                                  screen_height * 10), raylib_color$GREEN)
#'                        draw_line(c(-screen_width * 10, camera$target["y"], screen_width * 10,
#'                                  camera$target["y"]), raylib_color$GREEN)
#'                }
#'                end_mode_2d()
#'
#'                draw_text("SCREEN AREA", 640, 10, 20, raylib_color$RED)
#'
#'                draw_rectangle(0, 0, screen_width, 5, raylib_color$RED)
#'                draw_rectangle(0, 5, 5, screen_height - 10, raylib_color$RED)
#'                draw_rectangle(screen_width - 5, 5, 5, screen_height - 10, raylib_color$RED)
#'                draw_rectangle(0, screen_height - 5, screen_width, 5, raylib_color$RED)
#'
#'                ## not implemented yet
#'                ##draw_rectangle(10, 10, 250, 113, fade(raylib_color$SKYBLUE, 0.5))
#'                draw_rectangle(10, 10, 250, 113, Color("skyblue", 255 / 2))
#'                draw_rectangle_lines(10, 10, 250, 113, raylib_color$BLUE)
#'
#'                draw_text("Free 2d camera controls:", 20, 20, 10, raylib_color$BLACK)
#'                draw_text("- Right/Left to move Offset", 40, 40, 10, raylib_color$DARKGRAY)
#'                draw_text("- Mouse Wheel to Zoom in-out", 40, 60, 10, raylib_color$DARKGRAY)
#'                draw_text("- A / S to Rotate", 40, 80, 10, raylib_color$DARKGRAY)
#'                draw_text("- R to reset Zoom and Rotation", 40, 100, 10, raylib_color$DARKGRAY)
#'        }
#'        end_drawing()
#'}
#'
#'#######################
#'## De-Initialization ##
#'#######################
#'close_window() # Close window and OpenGL context
NULL
