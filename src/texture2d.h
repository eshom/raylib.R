#ifndef TEXTURE2D_H
#define TEXTURE2D_H

#include <R.h>
#include <Rinternals.h>

SEXP create_Texture_R(SEXP file_name, SEXP info);
SEXP set_Texture_R(SEXP texture, SEXP what);
SEXP get_Texture_R(SEXP texture);

#endif
