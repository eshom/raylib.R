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

#' Camera2D object
#' @param offset Vector2: Camera offset (displacement from target)
#' @param target Vector2: Camera target (rotation and zoom origin)
#' @param rotation numeric: Camera rotation in degrees
#' @param zoom numeric: Camera zoom (scaling), 1 by default
#' @export
Camera2D <- function(offset, target, rotation, zoom = 1) {
  
  stopifnot(is.numeric(offset), 
            is.numeric(target), 
            is.numeric(rotation), 
            is.numeric(zoom))
  
  output <- list(offset,
                 target,
                 as.double(rotation),
                 as.double(zoom))
  
  class(output) <- "Camera2D"
  
  return(output)
  
}
