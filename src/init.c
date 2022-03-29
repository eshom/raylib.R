#include "core.h"
#include "structs.h"
#include <R_ext/Rdynload.h>

static const R_CallMethodDef callMethods[] = {
        // Window-related functions
        {"InitWindow_R",        (DL_FUNC) &InitWindow_R,        3},
        {"WindowShouldClose_R", (DL_FUNC) &WindowShouldClose_R, 0},
        {"CloseWindow_R",       (DL_FUNC) &CloseWindow_R,       0},

        // Structs-related functions
        {"create_Vector2",      (DL_FUNC) &create_Vector2,      1},
        {"get_Vector2",         (DL_FUNC) &get_Vector2,         1},
        {"set_Vector2",         (DL_FUNC) &set_Vector2,         2},
        {NULL, NULL, 0}};

void R_init_raylib(DllInfo *info) {
        R_registerRoutines(info, NULL, callMethods, NULL, NULL);
        R_useDynamicSymbols(info, FALSE);
}
