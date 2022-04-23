##--------------------------------------------##
## Color or pixel related functions
##--------------------------------------------##

#' @family Color or pixel related functions
#' @title Get color with alpha applied
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#' @param alpha Float. Alpha value between 0 and 1.
#' @return Color object with 4 components: red, green, blue, alpha.
#' @useDynLib raylib.R, .registration = TRUE
#' @export
fade <- function(color, alpha) {
        Color(.Call("Fade_R", color, alpha))
}
