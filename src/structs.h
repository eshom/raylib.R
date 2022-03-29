#ifndef STRUCTS_H
#define STRUCTS_H

#include <R.h>
#include <Rinternals.h>

SEXP create_Vector2(SEXP info);
SEXP get_Vector2(SEXP ext);
SEXP set_Vector2(SEXP ext, SEXP vec_dbl);

#endif
