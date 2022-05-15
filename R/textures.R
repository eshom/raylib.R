##--------------------------------------------##
## Texture drawing functions
##--------------------------------------------##

#' @family Texture drawing functions
#' @title Draw a Texture2D
#' @param texture Texture object.
#' @param pos_x Integer.
#' @param pos_y Integer.
#' @param tint Color object. Integer vector with RGBA values between 0 and 255.
#' @return Color object with 4 components: red, green, blue, alpha.
#'
#' @export
draw_texture <- function(texture, pos_x, pos_y, tint) {
        .Call(.C_DrawTexture_R, texture, pos_x, pos_y, tint)
}

##--------------------------------------------##
## Color or pixel related functions
##--------------------------------------------##

#' @family Color or pixel related functions
#' @title Get color with alpha applied
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @param alpha Float. Alpha value between 0 and 1.
#' @return Color object with 4 components: red, green, blue, alpha.
#'
#' @export
fade <- function(color, alpha) {
        Color(.Call(.C_Fade_R, color, alpha))
}
