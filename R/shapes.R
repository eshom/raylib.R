## Basic shapes drawing functions

#' @family Basic shapes drawing functions
#' @description
#' NOTE: It can be useful when using basic shapes and one single font,
#' defining a font char white rectangle would allow drawing everything
#' in a single draw call
#' @title Set texture and rectangle to be used on shapes drawing
#' @param texture Texture2D object. Integer vector of with 5 elements:
#' id, width, height, mipmaps, format
#' @param rectangle_source Rectangle object, Double vector with 4 elements:
#' x, y, width, height
#' @useDynLib raylib.R, .registration = TRUE
#' @export
set_shapes_texture <- function(texture, rectangle_source) {
        .Call("SetShapesTexture_R", texture, rectangle_source)
        invisible()
}


#' @family Basic shapes drawing functions
#' @title Draw a pixel
#' @param posX Integer. X position.
#' @param posY Iteger. Y position.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_pixel <- function(posX, posY, color) {
        .Call("DrawPixel_R", posX, posY, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a pixel (Vector version)
#' @param vector2_position Vector2 object. Integer vector with 2 elements:
#' x, y
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_pixel_v <- function(vector2_position, color) {
        .Call("DrawPixelV_R", vector2_position, color)
        invisible()
}
