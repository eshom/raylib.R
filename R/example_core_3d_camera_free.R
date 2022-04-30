#' @name core_3d_camera_free
#' @rdname core_3d_camera_free
#' @family Core examples
#' @title 3D Camera free
#'
#' @examplesIf interactive()
#'####################
#'## Initialization ##
#'####################
#'screen_width <- 800
#'screen_height <- 450
#'
#'init_window(screen_width, screen_height, "raylib [core] example - 3d camera free")
#'
#'## Define the camera to look into our 3d world
#'camera <- Camera3D(position = Vector3(10, 10, 10),
#'                   target = Vector3(0, 0, 0),
#'                   up = Vector3(0, 1, 0),
#'                   fovy = 45,
#'                   projection = camera_projection$CAMERA_PERSPECTIVE)
#'
#'cube_position <- Vector3(0, 0, 0)
#'
#'set_camera_mode(camera, camera_mode$CAMERA_FREE)
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
#'        update_camera(camera)
#'
#'        if (is_key_down(keyboard_key$KEY_Z))
#'                Camera3D_set(camera, target = Vector3(0, 0, 0))
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
#'                draw_rectangle(10, 10, 320, 133, fade(raylib_color$SKYBLUE, 0.5))
#'                draw_rectangle_lines(10, 10, 320, 133, raylib_color$BLUE)
#'
#'                draw_text("Free camera default controls:", 20, 20, 10,
#'                          raylib_color$BLACK)
#'                draw_text("- Mouse Wheel to Zoom in-out", 40, 40, 10,
#'                          raylib_color$DARKGRAY)
#'                draw_text("- Mouse Wheel Pressed to Pan", 40, 60, 10,
#'                          raylib_color$DARKGRAY)
#'                draw_text("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10,
#'                          raylib_color$DARKGRAY)
#'                draw_text("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom",
#'                          40, 100, 10, raylib_color$DARKGRAY)
#'                draw_text("- Z to zoom to (0, 0, 0)", 40, 120, 10,
#'                          raylib_color$DARKGRAY)
#'
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
