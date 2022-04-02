## Raylib objects (corresponds to structure definitions)

#' @name raylib_objects
#' @rdname raylib_objects
#' @title Constructors For Object Used in Raylib Functions
#' @description
#' These objects are used in Raylib functions. The constructors
#' make it easy to create objects that are aligned with
#' Raylib API specifications.
#' - `Texture` - Texture, tex data stored in GPU memory (VRAM)
#' - `Texture2D` - alias for `Texture`
#' - `TextureCubemap` - alias for `Texture`
#' - `Rectangle` - Rectangle, 4 components
#' - `Color` - Color, 4 components, R8G8B8A8 (32bit). `color_name` corresponds
#' to R color names. see: [grDevices::colors()]
#' - `Vector2` - Vector2, 2 components
#' - `Vector3` - Vector3, 3 components
#' - `Vector4` - Vector4, 4 components
#' - `Quaternion` - alias to `Vector4`
#' - `Camera2D` - Camera2D, defines position/orientation in 2d space
#' @aliases Texture
#' @aliases Texture2D
#' @aliases TextureCubemap
#' @aliases Rectangle
#' @aliases Color
#' @aliases Colour
#' @aliases Vector2
#' @aliases Vector3
#' @aliases Vector4
#' @aliases Quaternion
#' @aliases Camera2D
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
#' @export
Texture2D <- Texture

#' @family Raylib objects
#' @rdname raylib_objects
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
#' @export
Quaternion <- Vector4

#' @family Raylib objects
#' @rdname raylib_objects
#' @export
Camera2D <- function(offset, target, rotation, zoom) {
        out <- list(offset, target, as.double(rotation), as.double(zoom))
        class(out) <- c("Camera2D", class(out))
        out
}
