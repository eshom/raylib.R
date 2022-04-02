## Raylib objects (corresponds to structure definitions)

#' @name raylib_objects
#' @rdname raylib_objects
#' @title Constructors for object used in Raylib functions
#' @description
#' These objects are used in Raylib functions. The constructors
#' make it easy to create objects that are aligned with
#' Raylib API specifications
NULL

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Texture <- function(id, width, height, mipmaps, format) {
        out <- as.integer(c(id, width, height, mipmaps, format))
        class(out) <- c("Texture", class(out))
        out
}

#' @family Raylib objects
#' @rdname raylib_objects
#' @rdname Texture
#' @export
Texture2D <- Texture

#' @family Raylib objects
#' @rdname raylib_objects
#' @rdname Texture
#' @export
TextureCubemap <- Texture

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Rectangle <- function(x, y, width, height) {
        out <- as.double(c(x, y, width, height))
        class(out) <- c("Rectangle", class(out))
        out
}

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Color <- function(color_name, alpha = 255) {
        out <- as.integer(c(grDevices::col2rgb(color_name), alpha))
        class(out) <- c("Color", class(out))
        out
}

#' @family Raylib objects
#' @rdname raylib_objects
#' @rdname Color
#' @export
Colour <- Color

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Vector2 <- function(x, y) {
        out <- as.double(c(x, y))
        class(out) <- c("Vector2", class(out))
        out
}

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Vector3 <- function(x, y, z) {
        out <- as.double(c(x, y, z))
        class(out) <- c("Vector3", class(out))
        out
}

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Vector4 <- function(x, y, z, w) {
        out <- as.double(c(x, y, z, w))
        class(out) <- c("Vector4", class(out))
        out
}

#' @family Raylib objects
#' @rdname raylib_objects
#' @rdname Vector4
#' @export
Quaternion <- Vector4

#' @family Raylib objects
#' @rdname raylib_objects
# Camera2D, defines position/orientation in 2d space
#' @export
Camera2D <- function(offset, target, rotation, zoom) {
        out <- list(offset, target, as.double(rotation), as.double(zoom))
        class(out) <- c("Camera2D", class(out))
        out
}
