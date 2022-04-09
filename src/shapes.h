#ifndef SHAPES_H
#define SHAPES_H

#include <R.h>
#include <Rinternals.h>

// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
SEXP SetShapesTexture_R(SEXP texture, SEXP rectangle_source);

// Basic shapes drawing functions
SEXP DrawPixel_R(SEXP posX, SEXP posY, SEXP color);
SEXP DrawPixelV_R(SEXP vector2_position, SEXP color);
SEXP DrawLine_R(SEXP position, SEXP color);
SEXP DrawLineV_R(SEXP start_pos, SEXP end_pos, SEXP color);
SEXP DrawLineEx_R(SEXP start_pos, SEXP end_pos, SEXP thick, SEXP color);
SEXP DrawLineBezier_R(SEXP start_pos, SEXP end_pos, SEXP thick, SEXP color);
SEXP DrawLineBezierQuad_R(SEXP start_pos, SEXP end_pos, SEXP control_pos, SEXP thick, SEXP color);
SEXP DrawLineBezierCubic_R(SEXP start_pos, SEXP end_pos, SEXP start_control_pos, SEXP end_control_pos, SEXP thick, SEXP color);
SEXP DrawLineStrip_R(SEXP points, SEXP point_count, SEXP color);

#endif
