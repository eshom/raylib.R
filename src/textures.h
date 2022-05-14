#ifndef TEXTURES_H
#define TEXTURES_H

#include <R.h>
#include <Rinternals.h>

// Texture drawing functions
SEXP DrawTexture_R(SEXP texture, SEXP pos_x, SEXP pos_y, SEXP tint);

// Color or pixel related functions
SEXP Fade_R(SEXP color, SEXP alpha);

#endif
