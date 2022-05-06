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

#' Color blending modes (pre-defined)
#'
#' @format An object of class ‘list’ of length 7.
#' \describe{
#'        \item{BLEND_ALPHA}{Blend textures considering alpha (default)}
#'        \item{BLEND_ADDITIVE}{Blend textures adding colors}
#'        \item{BLEND_MULTIPLIED}{Blend textures multiplying colors}
#'        \item{BLEND_ADD_COLORS}{Blend textures adding colors (alternative)}
#'        \item{BLEND_SUBTRACT_COLORS}{Blend textures subtracting colors (alternative)}
#'        \item{BLEND_ALPHA_PREMUL}{Blend premultiplied textures considering alpha}
#'        \item{BLEND_CUSTOM}{Blend textures using custom src/dst factors (use rlSetBlendMode())}
#' }
"blend_mode"

#' Shader uniform data type
"shader_uniform_data_type"

#' Shader attribute data type
"shader_attribute_data_type"

#' Shader location index
"shader_location_index"

#' Material map index
"material_map_index"

#' Pixel formats
#'
#' Note: Support depends on OpenGL version and platform
"pixel_format"

#' Texture parameters: filter mode
#'
#' Note 1: Filtering considers mipmaps if available in the texture
#' Note 2: Filter is accordingly set for minification and magnification
"texture_filter"

#' Texture parameters: wrap mode
"texture_wrap"

#' Cubemap layouts
"cubemap_layout"

#' Font type, defines generation method
"font_type"

#' N-patch layout
"npatch_layout"
