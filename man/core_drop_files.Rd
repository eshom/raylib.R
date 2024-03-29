% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/example_core_drop_files.R
\name{core_drop_files}
\alias{core_drop_files}
\title{Drop files to window}
\description{
Drop files to window
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
####################
## Initialization ##
####################
screen_width <- 800
screen_height <- 450

init_window(screen_width, screen_height, "raylib [core] example - drop files")

dropped_files <- character(0)

set_target_fps(60) # Set our game to run at 60 frames-per-second

####################
## Main game loop ##
####################
while (!window_should_close()) { # Detect window close button or ESC key
       ############
       ## Update ##
       ############

       if (is_file_dropped())
               dropped_files <- get_dropped_files()

       ##########
       ## Draw ##
       ##########
       begin_drawing()
       {
               clear_background(raylib_color$RAYWHITE)

               if (length(dropped_files) == 0) {
                       draw_text("Drop your files to this window!", 100, 40, 20,
                                 raylib_color$DARKGRAY)
               } else {
                       for (i in seq_len(length(dropped_files))) {
                               if (i \%\% 2) {
                                       draw_rectangle(0, 85 + 40 * i, screen_width, 40,
                                                      fade(raylib_color$LIGHTGRAY, 0.5))
                               } else {
                                       draw_rectangle(0, 85 + 40 * i, screen_width, 40,
                                                      fade(raylib_color$LIGHTGRAY, 0.3))
                               }
                               draw_text(dropped_files[i], 120, 100 + 40*i, 10,
                                         raylib_color$GRAY)
                       }

                       draw_text("Drop new files...", 100, 110 + 60 * length(dropped_files),
                                 20, raylib_color$DARKGRAY)
               }
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
\code{\link{core_3d_camera}},
\code{\link{core_basic_window}},
\code{\link{core_input_keys}},
\code{\link{core_input_mouse}}
}
\concept{Core examples}
