config_flags <- list(
        FLAG_VSYNC_HINT         = 0x00000040,
        FLAG_FULLSCREEN_MODE    = 0x00000002,
        FLAG_WINDOW_RESIZABLE   = 0x00000004,
        FLAG_WINDOW_UNDECORATED = 0x00000008,
        FLAG_WINDOW_HIDDEN      = 0x00000080,
        FLAG_WINDOW_MINIMIZED   = 0x00000200,
        FLAG_WINDOW_MAXIMIZED   = 0x00000400,
        FLAG_WINDOW_UNFOCUSED   = 0x00000800,
        FLAG_WINDOW_TOPMOST     = 0x00001000,
        FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,
        FLAG_WINDOW_TRANSPARENT = 0x00000010,
        FLAG_WINDOW_HIGHDPI     = 0x00002000,
        FLAG_MSAA_4X_HINT       = 0x00000020,
        FLAG_INTERLACED_HINT    = 0x00010000
)
usethis::use_data(config_flags, overwrite = TRUE)

trace_log_level <- list(
        LOG_ALL = 0,
        LOG_TRACE = 1,
        LOG_DEBUG = 2,
        LOG_INFO = 3,
        LOG_WARNING = 4,
        LOG_ERROR = 5,
        LOG_FATAL = 6,
        LOG_NONE = 7
)
usethis::use_data(trace_log_level, overwrite = TRUE)

keyboard_key <- list(
        KEY_NULL            = 0,
        KEY_APOSTROPHE      = 39,
        KEY_COMMA           = 44,
        KEY_MINUS           = 45,
        KEY_PERIOD          = 46,
        KEY_SLASH           = 47,
        KEY_ZERO            = 48,
        KEY_ONE             = 49,
        KEY_TWO             = 50,
        KEY_THREE           = 51,
        KEY_FOUR            = 52,
        KEY_FIVE            = 53,
        KEY_SIX             = 54,
        KEY_SEVEN           = 55,
        KEY_EIGHT           = 56,
        KEY_NINE            = 57,
        KEY_SEMICOLON       = 59,
        KEY_EQUAL           = 61,
        KEY_A               = 65,
        KEY_B               = 66,
        KEY_C               = 67,
        KEY_D               = 68,
        KEY_E               = 69,
        KEY_F               = 70,
        KEY_G               = 71,
        KEY_H               = 72,
        KEY_I               = 73,
        KEY_J               = 74,
        KEY_K               = 75,
        KEY_L               = 76,
        KEY_M               = 77,
        KEY_N               = 78,
        KEY_O               = 79,
        KEY_P               = 80,
        KEY_Q               = 81,
        KEY_R               = 82,
        KEY_S               = 83,
        KEY_T               = 84,
        KEY_U               = 85,
        KEY_V               = 86,
        KEY_W               = 87,
        KEY_X               = 88,
        KEY_Y               = 89,
        KEY_Z               = 90,
        KEY_LEFT_BRACKET    = 91,
        KEY_BACKSLASH       = 92,
        KEY_RIGHT_BRACKET   = 93,
        KEY_GRAVE           = 96,
        KEY_SPACE           = 32,
        KEY_ESCAPE          = 256,
        KEY_ENTER           = 257,
        KEY_TAB             = 258,
        KEY_BACKSPACE       = 259,
        KEY_INSERT          = 260,
        KEY_DELETE          = 261,
        KEY_RIGHT           = 262,
        KEY_LEFT            = 263,
        KEY_DOWN            = 264,
        KEY_UP              = 265,
        KEY_PAGE_UP         = 266,
        KEY_PAGE_DOWN       = 267,
        KEY_HOME            = 268,
        KEY_END             = 269,
        KEY_CAPS_LOCK       = 280,
        KEY_SCROLL_LOCK     = 281,
        KEY_NUM_LOCK        = 282,
        KEY_PRINT_SCREEN    = 283,
        KEY_PAUSE           = 284,
        KEY_F1              = 290,
        KEY_F2              = 291,
        KEY_F3              = 292,
        KEY_F4              = 293,
        KEY_F5              = 294,
        KEY_F6              = 295,
        KEY_F7              = 296,
        KEY_F8              = 297,
        KEY_F9              = 298,
        KEY_F10             = 299,
        KEY_F11             = 300,
        KEY_F12             = 301,
        KEY_LEFT_SHIFT      = 340,
        KEY_LEFT_CONTROL    = 341,
        KEY_LEFT_ALT        = 342,
        KEY_LEFT_SUPER      = 343,
        KEY_RIGHT_SHIFT     = 344,
        KEY_RIGHT_CONTROL   = 345,
        KEY_RIGHT_ALT       = 346,
        KEY_RIGHT_SUPER     = 347,
        KEY_KB_MENU         = 348,
        KEY_KP_0            = 320,
        KEY_KP_1            = 321,
        KEY_KP_2            = 322,
        KEY_KP_3            = 323,
        KEY_KP_4            = 324,
        KEY_KP_5            = 325,
        KEY_KP_6            = 326,
        KEY_KP_7            = 327,
        KEY_KP_8            = 328,
        KEY_KP_9            = 329,
        KEY_KP_DECIMAL      = 330,
        KEY_KP_DIVIDE       = 331,
        KEY_KP_MULTIPLY     = 332,
        KEY_KP_SUBTRACT     = 333,
        KEY_KP_ADD          = 334,
        KEY_KP_ENTER        = 335,
        KEY_KP_EQUAL        = 336,
        KEY_BACK            = 4,
        KEY_MENU            = 82,
        KEY_VOLUME_UP       = 24,
        KEY_VOLUME_DOWN     = 25
)
usethis::use_data(keyboard_key, overwrite = TRUE)

mouse_button <- list(
        MOUSE_BUTTON_LEFT    = 0,
        MOUSE_BUTTON_RIGHT   = 1,
        MOUSE_BUTTON_MIDDLE  = 2,
        MOUSE_BUTTON_SIDE    = 3,
        MOUSE_BUTTON_EXTRA   = 4,
        MOUSE_BUTTON_FORWARD = 5,
        MOUSE_BUTTON_BACK    = 6
)
usethis::use_data(mouse_button, overwrite = TRUE)

camera_mode <- list(
    CAMERA_CUSTOM = 0,
    CAMERA_FREE = 1,
    CAMERA_ORBITAL = 2,
    CAMERA_FIRST_PERSON = 3,
    CAMERA_THIRD_PERSON = 4
)
usethis::use_data(camera_mode, overwrite = TRUE)

camera_projection <- list(
        CAMERA_PERSPECTIVE = 0,
        CAMERA_ORTHOGRAPHIC = 1
)
usethis::use_data(camera_projection, overwrite = TRUE)

raylib_color <- list(
        LIGHTGRAY  = c(200, 200, 200, 255),
        RAYWHITE   = c(245, 245, 245, 255),
        LIGHTGRAY  = c(200, 200, 200, 255),
        GRAY       = c(130, 130, 130, 255),
        DARKGRAY   = c(80,  80,  80,  255),
        YELLOW     = c(253, 249, 0,   255),
        GOLD       = c(255, 203, 0,   255),
        ORANGE     = c(255, 161, 0,   255),
        PINK       = c(255, 109, 194, 255),
        RED        = c(230, 41,  55,  255),
        MAROON     = c(190, 33,  55,  255),
        GREEN      = c(0,   228, 48,  255),
        LIME       = c(0,   158, 47,  255),
        DARKGREEN  = c(0,   117, 44,  255),
        SKYBLUE    = c(102, 191, 255, 255),
        BLUE       = c(0,   121, 241, 255),
        DARKBLUE   = c(0,   82,  172, 255),
        PURPLE     = c(200, 122, 255, 255),
        VIOLET     = c(135, 60,  190, 255),
        DARKPURPLE = c(112, 31,  126, 255),
        BEIGE      = c(211, 176, 131, 255),
        BROWN      = c(127, 106, 79,  255),
        DARKBROWN  = c(76,  63,  47,  255),
        WHITE      = c(255, 255, 255, 255),
        BLACK      = c(0,   0,   0,   255),
        BLANK      = c(0,   0,   0,   0),
        MAGENTA    = c(255, 0,   255, 255),
        RAYWHITE   = c(245, 245, 245, 255)
)
usethis::use_data(raylib_color, overwrite = TRUE)

mouse_cursor <- list(
        MOUSE_CURSOR_DEFAULT       = 0,
        MOUSE_CURSOR_ARROW         = 1,
        MOUSE_CURSOR_IBEAM         = 2,
        MOUSE_CURSOR_CROSSHAIR     = 3,
        MOUSE_CURSOR_POINTING_HAND = 4,
        MOUSE_CURSOR_RESIZE_EW     = 5,
        MOUSE_CURSOR_RESIZE_NS     = 6,
        MOUSE_CURSOR_RESIZE_NWSE   = 7,
        MOUSE_CURSOR_RESIZE_NESW   = 8,
        MOUSE_CURSOR_RESIZE_ALL    = 9,
        MOUSE_CURSOR_NOT_ALLOWED   = 10
)
usethis::use_data(mouse_cursor, overwrite = TRUE)

blend_mode <- list(
        BLEND_ALPHA           = 0,
        BLEND_ADDITIVE        = 1,
        BLEND_MULTIPLIED      = 2,
        BLEND_ADD_COLORS      = 3,
        BLEND_SUBTRACT_COLORS = 4,
        BLEND_ALPHA_PREMUL    = 5,
        BLEND_CUSTOM          = 6
)
usethis::use_data(blend_mode, overwrite = TRUE)

shader_uniform_data_type <- list(
        SHADER_UNIFORM_FLOAT     = 0,
        SHADER_UNIFORM_VEC2      = 1,
        SHADER_UNIFORM_VEC3      = 2,
        SHADER_UNIFORM_VEC4      = 3,
        SHADER_UNIFORM_INT       = 4,
        SHADER_UNIFORM_IVEC2     = 5,
        SHADER_UNIFORM_IVEC3     = 6,
        SHADER_UNIFORM_IVEC4     = 7,
        SHADER_UNIFORM_SAMPLER2D = 8
)
usethis::use_data(shader_uniform_data_type, overwrite = TRUE)

shader_attribute_data_type <- list(
        SHADER_ATTRIB_FLOAT = 0,
        SHADER_ATTRIB_VEC2  = 1,
        SHADER_ATTRIB_VEC3  = 2,
        SHADER_ATTRIB_VEC4  = 3
)
usethis::use_data(shader_attribute_data_type, overwrite = TRUE)

shader_location_index <- list(
        SHADER_LOC_VERTEX_POSITION   = 0,
        SHADER_LOC_VERTEX_TEXCOORD01 = 1,
        SHADER_LOC_VERTEX_TEXCOORD02 = 2,
        SHADER_LOC_VERTEX_NORMAL     = 3,
        SHADER_LOC_VERTEX_TANGENT    = 4,
        SHADER_LOC_VERTEX_COLOR      = 5,
        SHADER_LOC_MATRIX_MVP        = 6,
        SHADER_LOC_MATRIX_VIEW       = 7,
        SHADER_LOC_MATRIX_PROJECTION = 8,
        SHADER_LOC_MATRIX_MODEL      = 9,
        SHADER_LOC_MATRIX_NORMAL     = 10,
        SHADER_LOC_VECTOR_VIEW       = 11,
        SHADER_LOC_COLOR_DIFFUSE     = 12,
        SHADER_LOC_COLOR_SPECULAR    = 13,
        SHADER_LOC_COLOR_AMBIENT     = 14,
        SHADER_LOC_MAP_ALBEDO        = 12,
        SHADER_LOC_MAP_METALNESS     = 13,
        SHADER_LOC_MAP_NORMAL        = 17,
        SHADER_LOC_MAP_ROUGHNESS     = 18,
        SHADER_LOC_MAP_OCCLUSION     = 19,
        SHADER_LOC_MAP_EMISSION      = 20,
        SHADER_LOC_MAP_HEIGHT        = 21,
        SHADER_LOC_MAP_CUBEMAP       = 22,
        SHADER_LOC_MAP_IRRADIANCE    = 23,
        SHADER_LOC_MAP_PREFILTER     = 24,
        SHADER_LOC_MAP_BRDF          = 25
)
usethis::use_data(shader_location_index, overwrite = TRUE)

material_map_index <- list(
        MATERIAL_MAP_ALBEDO     = 0,
        MATERIAL_MAP_DIFFUSE    = 0,
        MATERIAL_MAP_METALNESS  = 1,
        MATERIAL_MAP_SPECULAR   = 1,
        MATERIAL_MAP_NORMAL     = 2,
        MATERIAL_MAP_ROUGHNESS  = 3,
        MATERIAL_MAP_OCCLUSION  = 4,
        MATERIAL_MAP_EMISSION   = 5,
        MATERIAL_MAP_HEIGHT     = 6,
        MATERIAL_MAP_CUBEMAP    = 7,
        MATERIAL_MAP_IRRADIANCE = 8,
        MATERIAL_MAP_PREFILTER  = 9,
        MATERIAL_MAP_BRDF       = 10
)
usethis::use_data(material_map_index, overwrite = TRUE)

pixel_format <- list(
        PIXELFORMAT_UNCOMPRESSED_GRAYSCALE    = 1,
        PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA   = 2,
        PIXELFORMAT_UNCOMPRESSED_R5G6B5       = 3,
        PIXELFORMAT_UNCOMPRESSED_R8G8B8       = 4,
        PIXELFORMAT_UNCOMPRESSED_R5G5B5A1     = 5,
        PIXELFORMAT_UNCOMPRESSED_R4G4B4A4     = 6,
        PIXELFORMAT_UNCOMPRESSED_R8G8B8A8     = 7,
        PIXELFORMAT_UNCOMPRESSED_R32          = 8,
        PIXELFORMAT_UNCOMPRESSED_R32G32B32    = 9,
        PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10,
        PIXELFORMAT_COMPRESSED_DXT1_RGB       = 11,
        PIXELFORMAT_COMPRESSED_DXT1_RGBA      = 12,
        PIXELFORMAT_COMPRESSED_DXT3_RGBA      = 13,
        PIXELFORMAT_COMPRESSED_DXT5_RGBA      = 14,
        PIXELFORMAT_COMPRESSED_ETC1_RGB       = 15,
        PIXELFORMAT_COMPRESSED_ETC2_RGB       = 16,
        PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA  = 17,
        PIXELFORMAT_COMPRESSED_PVRT_RGB       = 18,
        PIXELFORMAT_COMPRESSED_PVRT_RGBA      = 19,
        PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA  = 20,
        PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA  = 21
)
usethis::use_data(pixel_format, overwrite = TRUE)

texture_filter <- list(
        TEXTURE_FILTER_POINT           = 0,
        TEXTURE_FILTER_BILINEAR        = 1,
        TEXTURE_FILTER_TRILINEAR       = 2,
        TEXTURE_FILTER_ANISOTROPIC_4X  = 3,
        TEXTURE_FILTER_ANISOTROPIC_8X  = 4,
        TEXTURE_FILTER_ANISOTROPIC_16X = 5
)
usethis::use_data(texture_filter, overwrite = TRUE)

texture_wrap <- list(
        TEXTURE_WRAP_REPEAT        = 0,
        TEXTURE_WRAP_CLAMP         = 1,
        TEXTURE_WRAP_MIRROR_REPEAT = 2,
        TEXTURE_WRAP_MIRROR_CLAMP  = 3
)
usethis::use_data(texture_wrap, overwrite = TRUE)

cubemap_layout <- list(
        CUBEMAP_LAYOUT_AUTO_DETECT         = 0,
        CUBEMAP_LAYOUT_LINE_VERTICAL       = 1,
        CUBEMAP_LAYOUT_LINE_HORIZONTAL     = 2,
        CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3,
        CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4,
        CUBEMAP_LAYOUT_PANORAMA            = 5
)
usethis::use_data(cubemap_layout, overwrite = TRUE)

font_type <- list(
    FONT_DEFAULT = 0,
    FONT_BITMAP = 1,
    FONT_SDF = 2
)
usethis::use_data(font_type, overwrite = TRUE)

npatch_layout <- list(
        NPATCH_NINE_PATCH             = 0,
        NPATCH_THREE_PATCH_VERTICAL   = 1,
        NPATCH_THREE_PATCH_HORIZONTAL = 2
)
usethis::use_data(npatch_layout, overwrite = TRUE)
