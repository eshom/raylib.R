% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/example_core_3d_camera.R
\name{core_3d_camera}
\alias{core_3d_camera}
\title{3D Camera}
\description{
3D Camera
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
####################
## Initialization ##
####################
screen_width <- 800
screen_height <- 450

init_window(screen_width, screen_height, "raylib [core] example - 3d camera mode")

## Define the camera to look into our 3d world
camera <- Camera3D(position = Vector3(0, 10, 10),
                  target = Vector3(0, 0, 0),
                  up = Vector3(0, 1, 0),
                  fovy = 45,
                  projection = camera_projection$CAMERA_PERSPECTIVE)

cube_position <- Vector3(0, 0, 0)

set_target_fps(60) # Set our game to run at 60 frames-per-second

####################
## Main game loop ##
####################
while (!window_should_close()) { # Detect window close button or ESC key
       ############
       ## Update ##
       ############

       ##########
       ## Draw ##
       ##########
       begin_drawing()
       {
               clear_background(raylib_color$RAYWHITE)

               begin_mode_3d(camera)
               {
                       draw_cube(cube_position, 2, 2, 2, raylib_color$RED)
                       draw_cube_wires(cube_position, 2, 2, 2, raylib_color$MAROON)

                       draw_grid(10, 1)
               }
               end_mode_3d()

               draw_text("Welcome to the third dimension!", 10, 40, 20, raylib_color$DARKGRAY)

               draw_fps(10, 10)
       }
       end_drawing()

}

#######################
## De-Initialization ##
#######################
close_window() # Close window and OpenGL context
\dontshow{\}) # examplesIf}
}
\seealso{
Other Core examples: 
\code{\link{core_2d_camera}},
\code{\link{core_3d_camera_first_person}},
\code{\link{core_3d_camera_free}},
\code{\link{core_basic_window}},
\code{\link{core_drop_files}},
\code{\link{core_input_keys}},
\code{\link{core_input_mouse}}
}
\concept{Core examples}
