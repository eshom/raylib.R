##-----------------------------------##
## Text-drawing functions
##-----------------------------------##
#' @family Text-drawing functions
#' @title Draw text (using default font)
#' @param text Length one character vector. The text to draw.
#' @param pos_x Integer. X position.
#' @param pos_y Integer. Y position.
#' @param font_size Integer. Font size.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
draw_text <- function(text, pos_x, pos_y, font_size, color) {
        .Call("DrawText_R", text, pos_x, pos_y, font_size, color)
        invisible()
}
