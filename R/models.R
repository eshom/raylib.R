##--------------------------------------------##
## Basic geometric 3D shapes drawing functions
##--------------------------------------------##

#' @family Basic geometric 3D shapes drawing functions
#' @title Draw cube
#' @param position Vector3. Cube position in 3D space.
#' @param width Float. Width of the cube.
#' @param height Float. Height of the cube.
#' @param length Float. Length of the cube.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_cube <- function(position, width, height, length, color) {
        .Call(.C_DrawCube_R, position, width, height, length, color)
        invisible()
}

#' @family Basic geometric 3D shapes drawing functions
#' @title Draw cube (Vector version)
#' @param position Vector3. Cube position in 3D space.
#' @param size Vector3. Size of the cube defined by
#' 3 components: width, height, length.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_cube_v <- function(position, size, color) {
        .Call(.C_DrawCubeV_R, position, size, color)
        invisible()
}

#' @family Basic geometric 3D shapes drawing functions
#' @title Draw cube wires
#' @param position Vector3. Cube position in 3D space.
#' @param width Float. Width of the cube.
#' @param height Float. Height of the cube.
#' @param length Float. Length of the cube.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_cube_wires <- function(position, width, height, length, color) {
        .Call(.C_DrawCubeWires_R, position, width, height, length, color)
        invisible()
}

#' @family Basic geometric 3D shapes drawing functions
#' @title Draw cube wires (Vector version)
#' @param position Vector3. Cube position in 3D space.
#' @param size Vector3. Size of the cube defined by
#' 3 components: width, height, length.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_cube_wires_v <- function(position, size, color) {
        .Call(.C_DrawCubeWiresV_R, position, size, color)
        invisible()
}

#' @family Basic geometric 3D shapes drawing functions
#' @title Draw a plane XZ
#' @param center_pos  Vector3. Plane position in 3d space.
#' @param size Vector2. X and Z dimensions for the plane in 3d space.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_plane <- function(center_pos, size, color) {
        .Call(.C_DrawPlane_R, center_pos, size, color)
        invisible()
}

#' @family Basic geometric 3D shapes drawing functions
#' @title Draw a grid
#'
#' The grid is centered at position`c(0, 0, 0)`
#' @param slices Integer.
#' @param spacing Float.
#'
#' @export
draw_grid <- function(slices, spacing) {
        .Call(.C_DrawGrid_R, slices, spacing)
        invisible()
}
