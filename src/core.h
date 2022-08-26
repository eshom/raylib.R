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
//SEXP SetWindowOpacity_R(SEXP opacity);
SEXP GetScreenWidth_R(void);
SEXP GetScreenHeight_R(void);
//SEXP GetRenderWidth_R(void);
//SEXP GetRenderHeight_R(void);
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

// Cursor-related functions
SEXP ShowCursor_R(void);
SEXP HideCursor_R(void);
SEXP IsCursorHidden_R(void);
SEXP EnableCursor_R(void);
SEXP DisableCursor_R(void);
SEXP IsCursorOnScreen_R(void);

// Drawing-related functions
SEXP ClearBackground_R(SEXP color);
SEXP BeginDrawing_R(void);
SEXP EndDrawing_R(void);
SEXP BeginMode2D_R(SEXP camera);
SEXP EndMode2D_R(void);
SEXP BeginMode3D_R(SEXP camera);
SEXP EndMode3D_R(void);
SEXP BeginTextureMode_R(SEXP target);
SEXP EndTextureMode_R(void);
SEXP BeginShaderMode_R(SEXP shader);
SEXP EndShaderMode_R(void);
SEXP BeginBlendMode_R(SEXP mode);
SEXP EndBlendMode_R(void);
SEXP BeginScissorMode_R(SEXP x, SEXP y, SEXP width, SEXP height);
SEXP EndScissorMode_R(void);

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1
SEXP GetShaderLocation_R(SEXP shader, SEXP uniform_name);
SEXP GetShaderLocationAttrib_R(SEXP shader, SEXP attrib_name);
SEXP SetShaderValue_R(SEXP shader, SEXP loc_index, SEXP value);
SEXP SetShaderValueV_R(SEXP shader, SEXP loc_index, SEXP value, SEXP uniform_type);
SEXP SetShaderValueMatrix_R(SEXP shader, SEXP loc_index, SEXP mat);
SEXP SetShaderValueTexture_R(SEXP shader, SEXP loc_index, SEXP texture);

// Screen-space-related functions
SEXP GetMouseRay_R(SEXP mouse_position, SEXP camera);
SEXP GetCameraMatrix_R(SEXP camera);
SEXP GetCameraMatrix2D_R(SEXP camera);
SEXP GetWorldToScreen_R(SEXP position, SEXP camera);
SEXP GetWorldToScreenEx_R(SEXP position, SEXP camera, SEXP width, SEXP height);
SEXP GetWorldToScreen2D_R(SEXP position, SEXP camera);
SEXP GetScreenToWorld2D_R(SEXP position, SEXP camera);

// Timing-related functions
SEXP SetTargetFPS_R(SEXP fps);
SEXP GetFPS_R(void);
SEXP GetFrameTime_R(void);
SEXP GetTime_R(void);

// Misc. functions
SEXP TakeScreenshot_R(SEXP filename);
SEXP SetConfigFlags_R(SEXP flags);
SEXP SetTraceLogLevel_R(SEXP loglevel);

// Files management functions
SEXP IsFileDropped_R(void);
SEXP LoadDroppedFiles_R(void);

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
