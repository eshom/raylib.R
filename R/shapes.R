## Basic shapes drawing functions

#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_shapes_texture <- function(texture, rectangle_source) {
        .Call("SetShapesTexture_R", texture, rectangle_source)
        invisible()
}


#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_pixel <- function(posX, posY, color) {
        .Call("DrawPixel_R", posX, posY, color)
        invisible()
}

#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_pixel_v <- function(vector2_position, color) {
        .Call("DrawPixelV_R", vector2_position, color)
        invisible()
}
