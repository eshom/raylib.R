#ifndef CORE_H
#define CORE_H

#include <R.h>
#include <Rinternals.h>

SEXP InitWindow_R(SEXP width, SEXP height, SEXP title);
SEXP WindowShouldClose_R(void);
SEXP CloseWindow_R(void);

#endif
