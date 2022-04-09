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
#' @param posY Integer. Y position.
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

#' @family Basic shapes drawing functions
#' @title Draw a line
#' @param position Integer Vector with 4 components:
#' x start position, y start_position, x end position, y end position
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line <- function(position, color) {
        .Call("DrawLine_R", position, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line (Vector version)
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line_v <- function(start_pos, end_pos, color) {
        .Call("DrawLineV_R", start_pos, end_pos, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line defining thickness
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line_ex <- function(start_pos, end_pos, thick, color) {
        .Call("DrawLineEx_R", start_pos, end_pos, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line using cubic-bezier curves in-out
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line_bezier <- function(start_pos, end_pos, thick, color) {
        .Call("DrawLineBezier_R", start_pos, end_pos, thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw line using quadratic bezier curves with a control point
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param control_pos Vector2. Control points.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line_bezier_quad <- function(start_pos, end_pos, control_pos, thick, color) {
        .Call("DrawLineBezierQuad_R", start_pos, end_pos, control_pos, thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw line using cubic bezier curves with 2 control points
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param control_pos Vector2. Control points.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line_bezier_cubic <- function(start_pos, end_pos, control_pos, thick, color) {
        .Call("DrawLineBezierCubic_R", start_pos, end_pos, control_pos, thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw lines sequence
#' @param points List with Vector2 elements.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_line_strip <- function(points, color) {
        .Call("DrawLineStrip_R", points, length(points), color)
        invisible()
}
