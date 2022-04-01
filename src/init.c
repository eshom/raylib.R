#include "core.h"
#include "shapes.h"
#include <R_ext/Rdynload.h>

static const R_CallMethodDef callMethods[] = {
        // Core module

        // Window-related functions
        {"InitWindow_R",         (DL_FUNC) &InitWindow_R,         3},
        {"WindowShouldClose_R",  (DL_FUNC) &WindowShouldClose_R,  0},
        {"CloseWindow_R",        (DL_FUNC) &CloseWindow_R,        0},
        {"IsWindowReady_R",      (DL_FUNC) &IsWindowReady_R,      0},
        {"IsWindowFullscreen_R", (DL_FUNC) &IsWindowFullscreen_R, 0},
        {"IsWindowHidden_R",     (DL_FUNC) &IsWindowHidden_R,     0},
        {"IsWindowMinimized_R",  (DL_FUNC) &IsWindowMinimized_R,  0},
        {"IsWindowMaximized_R",  (DL_FUNC) &IsWindowMaximized_R,  0},
        {"IsWindowFocused_R",    (DL_FUNC) &IsWindowFocused_R,    0},
        {"IsWindowResized_R",    (DL_FUNC) &IsWindowResized_R,    0},
        {"IsWindowState_R",      (DL_FUNC) &IsWindowState_R,      1},
        {"SetWindowState_R",     (DL_FUNC) &SetWindowState_R,     1},
        {"ClearWindowState_R",   (DL_FUNC) &ClearWindowState_R,   1},
        {"ToggleFullscreen_R",   (DL_FUNC) &ToggleFullscreen_R,   0},

        // Basic shapes drawing functions
        {"SetShapesTexture_R", (DL_FUNC) &SetShapesTexture_R, 2},
        {"DrawPixel_R",        (DL_FUNC) &DrawPixel_R,        3},
        {"DrawPixelV_R",       (DL_FUNC) &DrawPixelV_R,       2},

        {NULL, NULL, 0}};

void R_init_raylib(DllInfo *info) {
        R_registerRoutines(info, NULL, callMethods, NULL, NULL);
        R_useDynamicSymbols(info, FALSE);
}
