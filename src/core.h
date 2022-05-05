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
SEXP MaximizeWindow_R(void);
SEXP MinimizeWindow_R(void);
SEXP RestoreWindow_R(void);
SEXP SetWindowIcon_R(SEXP image);
SEXP SetWindowTitle_R(SEXP title);
SEXP SetWindowPosition_R(SEXP x, SEXP y);
SEXP SetWindowMonitor_R(SEXP monitor);
SEXP SetWindowMinSize_R(SEXP width, SEXP height);
SEXP SetWindowSize_R(SEXP width, SEXP height);
SEXP SetWindowOpacity_R(SEXP opacity);
SEXP GetScreenWidth_R(void);
SEXP GetScreenHeight_R(void);
SEXP GetRenderWidth_R(void);
SEXP GetRenderHeight_R(void);
SEXP GetMonitorCount_R(void);
SEXP GetCurrentMonitor_R(void);
SEXP GetMonitorPosition_R(SEXP monitor);
SEXP GetMonitorWidth_R(SEXP monitor);
SEXP GetMonitorHeight_R(SEXP monitor);
SEXP GetMonitorPhysicalWidth_R(SEXP monitor);
SEXP GetMonitorPhysicalHeight_R(SEXP monitor);
SEXP GetMonitorRefreshRate_R(SEXP monitor);
SEXP GetWindowPosition_R(void);
SEXP GetWindowScaleDPI_R(void);
SEXP GetMonitorName_R(SEXP monitor);
SEXP SetClipboardText_R(SEXP text);
SEXP GetClipboardText_R(void);

// Drawing-related functions
SEXP ClearBackground_R(SEXP color);
SEXP BeginDrawing_R(void);
SEXP EndDrawing_R(void);
SEXP BeginMode2D_R(SEXP camera);
SEXP EndMode2D_R(void);
SEXP BeginMode3D_R(SEXP camera);
SEXP EndMode3D_R(void);

// Timing-related functions

// Set target FPS (maximum)
SEXP SetTargetFPS_R(SEXP fps);

// Files management functions
SEXP IsFileDropped_R(void);
SEXP GetDroppedFiles_R(void);

// Input-related functions: keyboard
SEXP IsKeyPressed_R(SEXP key);
SEXP IsKeyDown_R(SEXP key);
SEXP IsKeyReleased_R(SEXP key);
SEXP IsKeyUp_R(SEXP key);
SEXP SetExitKey_R(SEXP key);
SEXP GetKeyPressed_R(void);
SEXP GetCharPressed_R(void);

// Input-related functions: mouse
SEXP IsMouseButtonPressed_R(SEXP button);
SEXP IsMouseButtonDown_R(SEXP button);
SEXP IsMouseButtonReleased_R(SEXP button);
SEXP IsMouseButtonUp_R(SEXP button);
SEXP GetMouseX_R(void);
SEXP GetMouseY_R(void);
SEXP GetMousePosition_R(void);
SEXP GetMouseDelta_R(void);
SEXP SetMousePosition_R(SEXP x, SEXP y);
SEXP SetMouseOffset_R(SEXP offset_x, SEXP offset_y);
SEXP SetMouseScale_R(SEXP scale_x, SEXP scale_y);
SEXP GetMouseWheelMove_R(void);
SEXP SetMouseCursor_R(SEXP cursor);

#endif
