#' @family Camera system functions
#' @title Set camera mode
#' @param camera Camera3D object.
#' @param mode Integer. Camera mode, one of [camera_mode]
#'
#' @export
set_camera_mode <- function(camera, mode) {
        .Call(.C_SetCameraMode_R, camera, mode)
        invisible()
}

#' @family Camera system functions
#' @title Set camera pan key to combine with mouse movement (free camera)
#' @param camera Camera3D object.
#'
#' @export
update_camera <- function(camera) {
        .Call(.C_UpdateCamera_R, camera)
        invisible()
}

## The following could be other keys that are not keyboard, update docs when implemented

#' @family Camera system functions
#' @title Set camera pan key to combine with mouse movement (free camera)
#' @param key_pan Integer. A key. One of [keyboard_key]
#'
#' @export
set_camera_pan_controls <- function(key_pan) {
        .Call(.C_SetCameraPanControls_R, key_pan)
        invisible()
}

#' @family Camera system functions
#' @title Set camera alt key to combine with mouse movement (free camera)
#' @param key_alt Integer. A key. One of [keyboard_key]
#'
#' @export
set_camera_alt_controls <- function(key_alt) {
        .Call(.C_SetCameraAltControls_R, key_alt)
        invisible()
}

#' @family Camera system functions
#' @title Set camera alt key to combine with mouse movement (free camera)
#' @param key_smooth_zoom Integer. A key. One of [keyboard_key]
#'
#' @export
set_camera_smooth_zoom_controls <- function(key_smooth_zoom) {
        .Call(.C_SetCameraSmoothZoomControls_R, key_smooth_zoom)
        invisible()
}

#' @family Camera system functions
#' @title Set camera move controls (1st person and 3rd person cameras)
#' @param key_front Integer. A key. One of [keyboard_key]
#' @param key_back Integer. A key. One of [keyboard_key]
#' @param key_right Integer. A key. One of [keyboard_key]
#' @param key_left Integer. A key. One of [keyboard_key]
#' @param key_up Integer. A key. One of [keyboard_key]
#' @param key_down Integer. A key. One of [keyboard_key]
#'
#' @export
set_camera_move_controls <- function(key_front, key_back, key_right, key_left, key_up, key_down) {
        .Call(.C_setCameraMoveControls_R, key_front, key_back, key_right, key_left, key_up, key_down)
        invisible()
}
