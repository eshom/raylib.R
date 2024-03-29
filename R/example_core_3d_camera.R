#' @name core_3d_camera
#' @rdname core_3d_camera
#' @family Core examples
#' @title 3D Camera
#'
#' @examplesIf interactive()
#'####################
#'## Initialization ##
#'####################
#'screen_width <- 800
#'screen_height <- 450
#'
#'init_window(screen_width, screen_height, "raylib [core] example - 3d camera mode")
#'
#'## Define the camera to look into our 3d world
#'camera <- Camera3D(position = Vector3(0, 10, 10),
#'                   target = Vector3(0, 0, 0),
#'                   up = Vector3(0, 1, 0),
#'                   fovy = 45,
#'                   projection = camera_projection$CAMERA_PERSPECTIVE)
#'
#'cube_position <- Vector3(0, 0, 0)
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
#'        ##########
#'        ## Draw ##
#'        ##########
#'        begin_drawing()
#'        {
#'                clear_background(raylib_color$RAYWHITE)
#'
#'                begin_mode_3d(camera)
#'                {
#'                        draw_cube(cube_position, 2, 2, 2, raylib_color$RED)
#'                        draw_cube_wires(cube_position, 2, 2, 2, raylib_color$MAROON)
#'
#'                        draw_grid(10, 1)
#'                }
#'                end_mode_3d()
#'
#'                draw_text("Welcome to the third dimension!", 10, 40, 20, raylib_color$DARKGRAY)
#'
#'                draw_fps(10, 10)
#'        }
#'        end_drawing()
#'
#'}
#'
#'#######################
#'## De-Initialization ##
#'#######################
#'close_window() # Close window and OpenGL context
NULL
