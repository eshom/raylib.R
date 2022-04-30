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
#' - `Camera3D` - Camera3D, defines position/orientation in 3D space
NULL

#' @family Raylib objects
#' @title Texture, tex data stored in GPU memory (VRAM)
#' @param id OpenGL texture id. If the rest of the parameters are missing,
#' expecting a vector of length 5 with the following
#' components: id, width, height, mipmaps, format
#' @param width Texture base width
#' @param height Texture base height
#' @param mipmaps Mipmap levels, 1 by default
#' @param format Data format (PixelFormat type)
#' @export
Texture <- function(id, width, height, mipmaps, format) {
        if (missing(width) && missing(height) && missing(mipmaps) && length(format) == 5)
                out <- as.integer(id)
        else
                out <- as.integer(c(id, width, height, mipmaps, format))

        class(out) <- c("Texture", class(out))
        stats::setNames(out, c("id", "width", "height", "mipmaps", "format"))
}

#' @family Raylib objects
#' @rdname Texture
#' @export
Texture2D <- Texture

#' @family Raylib objects
#' @rdname Texture
#' @export
TextureCubemap <- Texture

#' @family Raylib objects
#' @title Rectangle, 4 components
#' @param x Rectangle top-left corner position x. If other parameters
#' are missing, then expecting a vector of length 4 with x, y, width, and
#' height components.
#' @param y Rectangle top-left corner position y
#' @param width Rectangle width
#' @param height Rectangle height
#' @export
Rectangle <- function(x, y, width, height) {
        if (missing(y) && missing(width) && missing(height) && length(x) == 4)
                out <- as.double(x)
        else
                out <- as.double(c(x, y, width, height))

        class(out) <- c("Rectangle", class(out))
        stats::setNames(out, c("x", "y", "width", "height"))
}

#' @family Raylib objects
#' @title Create RGBA values between 0 and 255
#' @param color Two options:
#' 1. Character vector. R color name taken from one of [grDevices::colors()]
#' 2. Integer vector of length 4, defining RGBA values. In this case, `alpha`
#' parameter is ignored.
#' @param alpha Alpha value between 0 and 255. 0 is fully transparent.
#' @export
Color <- function(color, alpha = 255) {
        if (is.character(color)) {
                out <- as.integer(c(grDevices::col2rgb(color), alpha))
                class(out) <- c("Color", class(out))
                return(stats::setNames(out, c("red", "green", "blue", "alpha")))

        } else if (is.numeric(color)) {

                if (length(color) == 3)
                        out <- as.integer(c(color, alpha))
                else
                        out <- as.integer(color)

                class(out) <- c("Color", class(out))
                return(stats::setNames(out, c("red", "green", "blue", "alpha")))
        }

        stop("Unexpected end of function.")
}

#' @family Raylib objects
#' @rdname Color
#' @export
Colour <- Color

#' @family Raylib objects
#' @title Vector with 2 components
#' @param x Vector x component. If `y` is missing, expecting a length 2 vector
#' with x and y components.
#' @param y Vector y component
#' @export
Vector2 <- function(x, y) {
        if (missing(y) && length(x) == 2)
                out <- as.double(x)
        else
                out <- as.double(c(x, y))

        class(out) <- c("Vector2", class(out))
        stats::setNames(out, c("x", "y"))
}

#' @family Raylib objects
#' @title Vector with 3 components
#' @param x Vector x component. If `y` and `z` are missing, expecting a length
#' 3 vector with x, y, and z components.
#' @param y Vector y component
#' @param z Vector z component
#' @export
Vector3 <- function(x, y, z) {
        if (missing(y) && missing(z) && length(x) == 3)
                out <- as.double(x)
        else
                out <- as.double(c(x, y, z))

        class(out) <- c("Vector3", class(out))
        stats::setNames(out, c("x", "y", "z"))
}

#' @family Raylib objects
#' @title Vector with 4 components
#' @param x Vector x component. If `y`, `z`, and `w` are missing, expecting
#' a length 4 vector with x, y, z, and w components.
#' @param y Vector y component
#' @param z Vector z component
#' @param w Vector w component
#' @export
Vector4 <- function(x, y, z, w) {
        if (missing(y) && missing(z) && missing(w) && length(x) == 4)
                out <- as.double(x)
        else
                out <- as.double(c(x, y, z, w))
        class(out) <- c("Vector4", class(out))
        stats::setNames(out, c("x", "y", "z", "w"))
}

#' @family Raylib objects
#' @rdname Vector4
#' @export
Quaternion <- Vector4

#' @family Raylib objects
#' @title Camera2D, defines position/orientation in 2d space
#' @param offset Vector2. Camera offset (displacement from target)
#' @param target Vector2. Camera target (rotation and zoom origin)
#' @param rotation Camera rotation in degrees
#' @param zoom Camera zoom (scaling), should be 1.0f by default
#' @export
Camera2D <- function(offset, target, rotation, zoom) {
        out <- list(offset, target, as.double(rotation), as.double(zoom))
        class(out) <- c("Camera2D", class(out))
        stats::setNames(out, c("offset", "target", "rotation", "zoom"))
}

#' @family Raylib objects
#'
#' @title Camera3D, defines position/orientation in 3D space
#' @param position Vector3. Camera position
#' @param target Vector3. Camera target it looks-at
#' @param up Vector3. Camera up vector (rotation over its axis)
#' @param fovy Double. Camera field-of-view apperture in Y (degrees)
#' in perspective, used as near plane width in orthographic
#' @param projection Camera projection:
#' CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
#' @export
Camera3D <- function(position, target, up, fovy, projection) {
        cam_list <- list(position, target, up, as.double(fovy),
                         as.integer(projection))

        out <- .Call(.C_create_Camera3D_R, cam_list, NULL)
        class(out) <- c("Camera3D", class(out))
        out
}

#' @family Raylib objects
#' @rdname Camera3D
#' @param camera Camera3D object.
#' @param ... Set any of the following parameters: position, target, up, fovy,
#' projection.
#'
#' @export
Camera3D_set <- function(camera, ...) {
        .Call(.C_set_Camera3D_R, camera, list(...))
        invisible()
}

#' @family Raylib objects
#' @rdname Camera3D
#' @param camera Camera3D object.
#'
#' @export
Camera3D_get <- function(camera) {
        .Call(.C_get_Camera3D_R, camera)
}

#' @family Raylib objects
#' @rdname Camera3D
#' @export
Camera <- Camera3D
