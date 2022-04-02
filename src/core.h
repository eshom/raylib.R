#ifndef CORE_H
#define CORE_H

#include <R.h>
#include <Rinternals.h>

// Window-related functions
SEXP InitWindow_R(SEXP width, SEXP height, SEXP title);
SEXP WindowShouldClose_R(void);
SEXP CloseWindow_R(void);
SEXP IsWindowReady_R(void);
SEXP IsWindowFullscreen_R(void);
SEXP IsWindowHidden_R(void);
SEXP IsWindowMinimized_R(void);
SEXP IsWindowMaximized_R(void);
SEXP IsWindowFocused_R(void);
SEXP IsWindowResized_R(void);
SEXP IsWindowState_R(SEXP flag);
SEXP SetWindowState_R(SEXP flags);
SEXP ClearWindowState_R(SEXP flags);
SEXP ToggleFullscreen_R(void);

// Drawing-related functions
SEXP ClearBackground_R(SEXP color);
SEXP BeginDrawing_R(void);
SEXP EndDrawing_R(void);
SEXP BeginMode2D_R(SEXP offset, SEXP target, SEXP rotation, SEXP zoom);
SEXP EndMode2D_R(void);
SEXP BeginMode3D_R(SEXP position, SEXP target, SEXP up, SEXP fovy, SEXP projection);
SEXP EndMode3D_R(void);
#endif
