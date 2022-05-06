#ifndef _UTILS_H
#define _UTILS_H

#include <R.h>
#include <Rinternals.h>
#include "raylib.h"

Color color_from_sexp(SEXP color);
SEXP sexp_from_color(Color color);
Vector2 vector2_from_sexp(SEXP vec2);
Vector2 *vector2_array_from_sexp(SEXP vec2_list);
SEXP sexp_from_vector2(Vector2 vec);
Vector3 vector3_from_sexp(SEXP vec3);
SEXP sexp_from_vector3(Vector3 vec);
Texture texture_from_sexp(SEXP texture);
RenderTexture render_texture_from_sexp(SEXP render_texture);
Rectangle rectangle_from_sexp(SEXP rectangle);
SEXP sexp_from_rectangle(Rectangle rec);
unsigned int flag_from_sexp(SEXP flag);
Camera2D camera2d_from_sexp(SEXP camera2d);
Camera3D *camera3d_p_from_sexp(SEXP camera3d);
const char *string_from_sexp(SEXP char_vec);
SEXP sexp_from_string(const char *str);
void keyboard_key_valid_else_error(int key);
void general_key_valid_else_error(int key);
void mouse_button_valid_else_error(int button);
void mouse_cursor_valid_else_error(int cursor);
void window_ready_else_error(void);
Image *image_p_from_sexp(SEXP image);

#endif
