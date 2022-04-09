#ifndef _UTILS_H
#define _UTILS_H

#include <R.h>
#include <Rinternals.h>
#include <raylib.h>

Color color_from_sexp(SEXP color);
Vector2 vector2_from_sexp(SEXP vec2);
Texture texture_from_sexp(SEXP texture);
Rectangle rectangle_from_sexp(SEXP rectangle);
unsigned int flag_from_sexp(SEXP flag);
Camera2D camera2d_from_sexp(SEXP camera2d);
Camera3D *camera3d_p_from_sexp(SEXP camera3d);

#endif
