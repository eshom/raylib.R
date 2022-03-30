#include "core.h"
#include <R_ext/Rdynload.h>

static const R_CallMethodDef callMethods[] = {
        // Window-related functions
        {"InitWindow_R",        (DL_FUNC) &InitWindow_R,        3},
        {"WindowShouldClose_R", (DL_FUNC) &WindowShouldClose_R, 0},
        {"CloseWindow_R",       (DL_FUNC) &CloseWindow_R,       0},

        {NULL, NULL, 0}};

void R_init_raylib(DllInfo *info) {
        R_registerRoutines(info, NULL, callMethods, NULL, NULL);
        R_useDynamicSymbols(info, FALSE);
}
