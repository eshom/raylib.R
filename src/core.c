#define R_NO_REMAP
#include "core.h"
#include <raylib.h>
#include <R.h>
#include <Rinternals.h>

// Windows-related functions

SEXP InitWindow_R(SEXP width, SEXP height,  SEXP title)
{
        InitWindow(Rf_asInteger(width), Rf_asInteger(height), CHAR(Rf_asChar(title)));
        return R_NilValue;
}

SEXP WindowShouldClose_R(void)
{
        return Rf_ScalarLogical(WindowShouldClose());
}

SEXP CloseWindow_R(void)
{
        CloseWindow();
        return R_NilValue;
}
