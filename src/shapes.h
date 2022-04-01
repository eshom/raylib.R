#ifndef SHAPES_H
#define SHAPES_H

#include <R.h>
#include <Rinternals.h>

SEXP SetShapesTexture_R(SEXP texture, SEXP rectangle_source);
SEXP DrawPixel_R(SEXP posX, SEXP posY, SEXP color);
SEXP DrawPixelV_R(SEXP vector2_position, SEXP color);

#endif
