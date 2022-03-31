#ifndef CORE_H
#define CORE_H

#include <R.h>
#include <Rinternals.h>

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

#endif
