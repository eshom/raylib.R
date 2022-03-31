#' @export
Texture <- function(id, width, height, mipmaps, format) {
        as.integer(c(id, width, height, mipmaps, format))
}

#' @rdname Texture
#' @export
Texture2D <- Texture

#' @rdname Texture
#' @export
TextureCubemap <- Texture

#' @export
Rectangle <- function(x, y, width, height) {
        as.double(c(x, y, width, height))
}

#' @export
Color <- function(color_name, alpha = 255) {
        as.integer(c(grDevices::col2rgb(color_name), alpha))
}

#' @export
Vector2 <- function(x, y) {
        as.double(c(x, y))
}

#' @export
Vector3 <- function(x, y, z) {
        as.double(c(x, y, z))
}

#' @export
Vector4 <- function(x, y, z, w) {
        as.double(c(x, y, z, w))
}

#' @rdname Vector4
#' @export
Quaternion <- Vector4
