#ifndef MODELS_H
#define MODELS_H

#include <R.h>
#include <Rinternals.h>

SEXP DrawCube_R(SEXP position, SEXP width, SEXP height, SEXP length, SEXP color);
SEXP DrawCubeV_R(SEXP position, SEXP size, SEXP color);
SEXP DrawCubeWires_R(SEXP position, SEXP width, SEXP height, SEXP length, SEXP color);
SEXP DrawCubeWiresV_R(SEXP position, SEXP size, SEXP color);
SEXP DrawPlane_R(SEXP center_pos, SEXP size, SEXP color);
SEXP DrawGrid_R(SEXP slices, SEXP spacing);

#endif
