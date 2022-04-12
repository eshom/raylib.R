#' System/Window config flags
#'
#' NOTE: Every bit registers one state (use it with bit masks)
#' By default all flags are set to 0
"config_flags"

#' Trace log level
#'
#' NOTE: Organized by priority level
"trace_log_level"

#' Keyboard keys (US keyboard layout)
#'
#' NOTE: Use GetKeyPressed() to allow redefining
#' required keys for alternative layouts
"keyboard_key"

#' Mouse buttons
#'
#' Mouse buttons codes
"mouse_button"

#' Camera system modes
"camera_mode"

#' Camera projection
"camera_projection"

#' Raylib color
"raylib_color"

#' Mouse cursors
#'
#' @format An object of class ‘list’ of length 11.
#' \describe{
#'         \item{MOUSE_CURSOR_DEFAULT}{Default pointer shape}
#'         \item{MOUSE_CURSOR_ARROW}{Arrow shape}
#'         \item{MOUSE_CURSOR_IBEAM}{Text writing cursor shape}
#'         \item{MOUSE_CURSOR_CROSSHAIR}{Cross shape}
#'         \item{MOUSE_CURSOR_POINTING_HAND}{Pointing hand cursor}
#'         \item{MOUSE_CURSOR_RESIZE_EW}{Horizontal resize/move arrow shape}
#'         \item{MOUSE_CURSOR_RESIZE_NS}{Vertical resize/move arrow shape}
#'         \item{MOUSE_CURSOR_RESIZE_NWSE}{Top-left to bottom-right diagonal resize/move arrow shape}
#'         \item{MOUSE_CURSOR_RESIZE_NESW}{The top-right to bottom-left diagonal resize/move arrow shape}
#'         \item{MOUSE_CURSOR_RESIZE_ALL}{The omni-directional resize/move cursor shape}
#'         \item{MOUSE_CURSOR_NOT_ALLOWED}{The operation-not-allowed shape}
#' }
"mouse_cursor"
