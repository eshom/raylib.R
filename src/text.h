#ifndef TEXT_H
#define TEXT_H

#include <R.h>
#include <Rinternals.h>

SEXP DrawFPS_R(SEXP pos_x, SEXP pos_y);
SEXP DrawText_R(SEXP text, SEXP pos_x, SEXP pos_y, SEXP font_size, SEXP color);

#endif
