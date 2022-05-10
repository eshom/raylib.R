#include "raylib.R.h"
#include <R_ext/Rdynload.h>
#include <R_ext/Visibility.h>

// R_CallMethodDef quick reminder:
// {<name of function>, (DL_FUNC) &<name of function>, <number of arguments>}

static const R_CallMethodDef callMethods[] = {
        // Core module

        // Window-related functions
        {"InitWindow_R",               (DL_FUNC) &InitWindow_R,               3},
        {"WindowShouldClose_R",        (DL_FUNC) &WindowShouldClose_R,        0},
        {"CloseWindow_R",              (DL_FUNC) &CloseWindow_R,              0},
        {"IsWindowReady_R",            (DL_FUNC) &IsWindowReady_R,            0},
        {"IsWindowFullscreen_R",       (DL_FUNC) &IsWindowFullscreen_R,       0},
        {"IsWindowHidden_R",           (DL_FUNC) &IsWindowHidden_R,           0},
        {"IsWindowMinimized_R",        (DL_FUNC) &IsWindowMinimized_R,        0},
        {"IsWindowMaximized_R",        (DL_FUNC) &IsWindowMaximized_R,        0},
        {"IsWindowFocused_R",          (DL_FUNC) &IsWindowFocused_R,          0},
        {"IsWindowResized_R",          (DL_FUNC) &IsWindowResized_R,          0},
        {"IsWindowState_R",            (DL_FUNC) &IsWindowState_R,            1},
        {"SetWindowState_R",           (DL_FUNC) &SetWindowState_R,           1},
        {"ClearWindowState_R",         (DL_FUNC) &ClearWindowState_R,         1},
        {"ToggleFullscreen_R",         (DL_FUNC) &ToggleFullscreen_R,         0},
        {"MaximizeWindow_R",           (DL_FUNC) &MaximizeWindow_R,           0},
        {"MinimizeWindow_R",           (DL_FUNC) &MinimizeWindow_R,           0},
        {"RestoreWindow_R",            (DL_FUNC) &RestoreWindow_R,            0},
        {"SetWindowIcon_R",            (DL_FUNC) &SetWindowIcon_R,            1},
        {"SetWindowTitle_R",           (DL_FUNC) &SetWindowTitle_R,           1},
        {"SetWindowPosition_R",        (DL_FUNC) &SetWindowPosition_R,        2},
        {"SetWindowMonitor_R",         (DL_FUNC) &SetWindowMonitor_R,         1},
        {"SetWindowMinSize_R",         (DL_FUNC) &SetWindowMinSize_R,         2},
        {"SetWindowSize_R",            (DL_FUNC) &SetWindowSize_R,            2},
//        {"SetWindowOpacity_R",         (DL_FUNC) &SetWindowOpacity_R,         1},
        {"GetScreenWidth_R",           (DL_FUNC) &GetScreenWidth_R,           0},
        {"GetScreenHeight_R",          (DL_FUNC) &GetScreenHeight_R,          0},
//        {"GetRenderWidth_R",           (DL_FUNC) &GetRenderWidth_R,           0},
//        {"GetRenderHeight_R",          (DL_FUNC) &GetRenderHeight_R,          0},
        {"GetMonitorCount_R",          (DL_FUNC) &GetMonitorCount_R,          0},
        {"GetCurrentMonitor_R",        (DL_FUNC) &GetCurrentMonitor_R,        0},
        {"GetMonitorPosition_R",       (DL_FUNC) &GetMonitorPosition_R,       1},
        {"GetMonitorWidth_R",          (DL_FUNC) &GetMonitorWidth_R,          1},
        {"GetMonitorHeight_R",         (DL_FUNC) &GetMonitorHeight_R,         1},
        {"GetMonitorPhysicalWidth_R",  (DL_FUNC) &GetMonitorPhysicalWidth_R,  1},
        {"GetMonitorPhysicalHeight_R", (DL_FUNC) &GetMonitorPhysicalHeight_R, 1},
        {"GetMonitorRefreshRate_R",    (DL_FUNC) &GetMonitorRefreshRate_R,    1},
        {"GetWindowPosition_R",        (DL_FUNC) &GetWindowPosition_R,        0},
        {"GetWindowScaleDPI_R",        (DL_FUNC) &GetWindowScaleDPI_R,        0},
        {"GetMonitorName_R",           (DL_FUNC) &GetMonitorName_R,           1},
        {"SetClipboardText_R",         (DL_FUNC) &SetClipboardText_R,         1},
        {"GetClipboardText_R",         (DL_FUNC) &GetClipboardText_R,         0},

        // Cursor-related functions
        {"ShowCursor_R",       (DL_FUNC) &ShowCursor_R,       0},
        {"HideCursor_R",       (DL_FUNC) &HideCursor_R,       0},
        {"IsCursorHidden_R",   (DL_FUNC) &IsCursorHidden_R,   0},
        {"EnableCursor_R",     (DL_FUNC) &EnableCursor_R,     0},
        {"DisableCursor_R",    (DL_FUNC) &DisableCursor_R,    0},
        {"IsCursorOnScreen_R", (DL_FUNC) &IsCursorOnScreen_R, 0},

        // Drawing-related functions
        {"ClearBackground_R",  (DL_FUNC) &ClearBackground_R,  1},
        {"BeginDrawing_R",     (DL_FUNC) &BeginDrawing_R,     0},
        {"EndDrawing_R",       (DL_FUNC) &EndDrawing_R,       0},
        {"BeginMode2D_R",      (DL_FUNC) &BeginMode2D_R,      1},
        {"EndMode2D_R",        (DL_FUNC) &EndMode2D_R,        0},
        {"BeginMode3D_R",      (DL_FUNC) &BeginMode3D_R,      1},
        {"EndMode3D_R",        (DL_FUNC) &EndMode3D_R,        0},
        {"BeginTextureMode_R", (DL_FUNC) &BeginTextureMode_R, 1},
        {"EndTextureMode_R",   (DL_FUNC) &EndTextureMode_R,   0},
        {"BeginShaderMode_R",  (DL_FUNC) &BeginShaderMode_R,  1},
        {"EndShaderMode_R",    (DL_FUNC) &EndShaderMode_R,    0},
        {"BeginBlendMode_R",   (DL_FUNC) &BeginBlendMode_R,   1},
        {"EndBlendMode_R",     (DL_FUNC) &EndBlendMode_R,     0},
        {"BeginScissorMode_R", (DL_FUNC) &BeginScissorMode_R, 4},
        {"EndScissorMode_R",   (DL_FUNC) &EndScissorMode_R,   0},

        // Shader management functions
        {"GetShaderLocation_R",       (DL_FUNC) &GetShaderLocation_R,       2},
        {"GetShaderLocationAttrib_R", (DL_FUNC) &GetShaderLocationAttrib_R, 2},
        {"SetShaderValue_R",          (DL_FUNC) &SetShaderValue_R,          4},
        {"SetShaderValueV_R",         (DL_FUNC) &SetShaderValueV_R,         5},
        {"SetShaderValueMatrix_R",    (DL_FUNC) &SetShaderValueMatrix_R,    3},
        {"SetShaderValueTexture_R",   (DL_FUNC) &SetShaderValueTexture_R,   3},

        // Screen-space-related functions
        {"GetMouseRay_R",        (DL_FUNC) &GetMouseRay_R,        2},
        {"GetCameraMatrix_R",    (DL_FUNC) &GetCameraMatrix_R,    1},
        {"GetCameraMatrix2D_R",  (DL_FUNC) &GetCameraMatrix2D_R,  1},
        {"GetWorldToScreen_R",   (DL_FUNC) &GetWorldToScreen_R,   2},
        {"GetWorldToScreenEx_R", (DL_FUNC) &GetWorldToScreenEx_R, 4},
        {"GetWorldToScreen2D_R", (DL_FUNC) &GetWorldToScreen2D_R, 2},
        {"GetScreenToWorld2D_R", (DL_FUNC) &GetScreenToWorld2D_R, 2},

        // Timing-related functions
        {"SetTargetFPS_R", (DL_FUNC) &SetTargetFPS_R, 1},
        {"GetFPS_R",       (DL_FUNC) &GetFPS_R,       0},
        {"GetFrameTime_R", (DL_FUNC) &GetFrameTime_R, 0},
        {"GetTime_R",      (DL_FUNC) &GetTime_R,      0},

        // Misc. functions
        {"TakeScreenshot_R",   (DL_FUNC) &TakeScreenshot_R,   1},
        {"SetConfigFlags_R",   (DL_FUNC) &SetConfigFlags_R,   1},
        {"SetTraceLogLevel_R", (DL_FUNC) &SetTraceLogLevel_R, 1},

        // Camera system functions
        {"SetCameraMode_R",              (DL_FUNC) &SetCameraMode_R,              2},
        {"UpdateCamera_R",               (DL_FUNC) &UpdateCamera_R,               1},
        {"SetCameraPanControl_R",        (DL_FUNC) &SetCameraPanControl_R,        1},
        {"SetCameraAltControl_R",        (DL_FUNC) &SetCameraAltControl_R,        1},
        {"SetCameraSmoothZoomControl_R", (DL_FUNC) &SetCameraSmoothZoomControl_R, 1},
        {"SetCameraMoveControls_R",      (DL_FUNC) &SetCameraMoveControls_R,      6},

        // Input-related functions: keyboard
        {"IsKeyPressed_R",   (DL_FUNC) &IsKeyPressed_R,   1},
        {"IsKeyDown_R",      (DL_FUNC) &IsKeyDown_R,      1},
        {"IsKeyReleased_R",  (DL_FUNC) &IsKeyReleased_R,  1},
        {"IsKeyUp_R",        (DL_FUNC) &IsKeyUp_R,        1},
        {"SetExitKey_R",     (DL_FUNC) &SetExitKey_R,     1},
        {"GetKeyPressed_R",  (DL_FUNC) &GetKeyPressed_R,  0},
        {"GetCharPressed_R", (DL_FUNC) &GetCharPressed_R, 0},

        // Input-related functions: mouse
        {"IsMouseButtonPressed_R",  (DL_FUNC) &IsMouseButtonPressed_R,  1},
        {"IsMouseButtonDown_R",     (DL_FUNC) &IsMouseButtonDown_R,     1},
        {"IsMouseButtonReleased_R", (DL_FUNC) &IsMouseButtonReleased_R, 1},
        {"IsMouseButtonUp_R",       (DL_FUNC) &IsMouseButtonUp_R,       1},
        {"GetMouseX_R",             (DL_FUNC) &GetMouseX_R,             0},
        {"GetMouseY_R",             (DL_FUNC) &GetMouseY_R,             0},
        {"GetMousePosition_R",      (DL_FUNC) &GetMousePosition_R,      0},
        {"GetMouseDelta_R",         (DL_FUNC) &GetMouseDelta_R,         0},
        {"SetMousePosition_R",      (DL_FUNC) &SetMousePosition_R,      2},
        {"SetMouseOffset_R",        (DL_FUNC) &SetMouseOffset_R,        2},
        {"SetMouseScale_R",         (DL_FUNC) &SetMouseScale_R,         2},
        {"GetMouseWheelMove_R",     (DL_FUNC) &GetMouseWheelMove_R,     0},
        {"SetMouseCursor_R",        (DL_FUNC) &SetMouseCursor_R,        1},

        // Files management functions
        {"IsFileDropped_R",   (DL_FUNC) &IsFileDropped_R,   0},
        {"GetDroppedFiles_R", (DL_FUNC) &GetDroppedFiles_R, 0},

        // Shapes module

        // Basic shapes drawing functions
        {"SetShapesTexture_R",          (DL_FUNC) &SetShapesTexture_R,          2},
        {"DrawPixel_R",                 (DL_FUNC) &DrawPixel_R,                 3},
        {"DrawPixelV_R",                (DL_FUNC) &DrawPixelV_R,                2},
        {"DrawLine_R",                  (DL_FUNC) &DrawLine_R,                  5},
        {"DrawLineV_R",                 (DL_FUNC) &DrawLineV_R,                 3},
        {"DrawLineEx_R",                (DL_FUNC) &DrawLineEx_R,                3},
        {"DrawLineBezier_R",            (DL_FUNC) &DrawLineBezier_R,            4},
        {"DrawLineBezierQuad_R",        (DL_FUNC) &DrawLineBezierQuad_R,        5},
        {"DrawLineBezierCubic_R",       (DL_FUNC) &DrawLineBezierCubic_R,       5},
        {"DrawLineStrip_R",             (DL_FUNC) &DrawLineStrip_R,             3},
        {"DrawCircle_R",                (DL_FUNC) &DrawCircle_R,                4},
        {"DrawCircleSector_R",          (DL_FUNC) &DrawCircleSector_R,          6},
        {"DrawCircleSectorLines_R",     (DL_FUNC) &DrawCircleLines_R,           6},
        {"DrawCircleGradient_R",        (DL_FUNC) &DrawCircleGradient_R,        5},
        {"DrawCircleV_R",               (DL_FUNC) &DrawCircleV_R,               3},
        {"DrawCircleLines_R",           (DL_FUNC) &DrawCircleLines_R,           4},
        {"DrawEllipse_R",               (DL_FUNC) &DrawEllipse_R,               5},
        {"DrawEllipseLines_R",          (DL_FUNC) &DrawEllipseLines_R,          5},
        {"DrawRing_R",                  (DL_FUNC) &DrawRing_R,                  7},
        {"DrawRingLines_R",             (DL_FUNC) &DrawRingLines_R,             7},
        {"DrawRectangle_R",             (DL_FUNC) &DrawRectangle_R,             5},
        {"DrawRectangleV_R",            (DL_FUNC) &DrawRectangleV_R,            3},
        {"DrawRectangleRec_R",          (DL_FUNC) &DrawRectangleRec_R,          2},
        {"DrawRectanglePro_R",          (DL_FUNC) &DrawRectanglePro_R,          4},
        {"DrawRectangleGradientV_R",    (DL_FUNC) &DrawRectangleGradientV_R,    6},
        {"DrawRectangleGradientH_R",    (DL_FUNC) &DrawRectangleGradientH_R,    6},
        {"DrawRectangleGradientEx_R",   (DL_FUNC) &DrawRectangleGradientEx_R,   5},
        {"DrawRectangleLines_R",        (DL_FUNC) &DrawRectangleLines_R,        5},
        {"DrawRectangleLinesEx_R",      (DL_FUNC) &DrawRectangleLinesEx_R,      3},
        {"DrawRectangleRounded_R",      (DL_FUNC) &DrawRectangleRounded_R,      4},
        {"DrawRectangleRoundedLines_R", (DL_FUNC) &DrawRectangleRoundedLines_R, 5},
        {"DrawTriangle_R",              (DL_FUNC) &DrawTriangle_R,              4},
        {"DrawTriangleLines_R",         (DL_FUNC) &DrawTriangleLines_R,         4},
        {"DrawTriangleFan_R",           (DL_FUNC) &DrawTriangleFan_R,           3},
        {"DrawTriangleStrip_R",         (DL_FUNC) &DrawTriangleStrip_R,         3},
        {"DrawPoly_R",                  (DL_FUNC) &DrawPoly_R,                  5},
        {"DrawPolyLines_R",             (DL_FUNC) &DrawPolyLines_R,             6},
        {"DrawPolyLinesEx_R",           (DL_FUNC) &DrawPolyLinesEx_R,           6},

        // Basic shapes collision detection functions
        {"CheckCollisionRecs_R",          (DL_FUNC) &CheckCollisionRecs_R,          2},
        {"CheckCollisionCircles_R",       (DL_FUNC) &CheckCollisionCircles_R,       4},
        {"CheckCollisionCircleRec_R",     (DL_FUNC) &CheckCollisionCircleRec_R,     3},
        {"CheckCollisionPointRec_R",      (DL_FUNC) &CheckCollisionPointRec_R,      2},
        {"CheckCollisionPointCircle_R",   (DL_FUNC) &CheckCollisionPointCircle_R,   3},
        {"CheckCollisionPointTriangle_R", (DL_FUNC) &CheckCollisionPointTriangle_R, 4},
        {"CheckCollisionLines_R",         (DL_FUNC) &CheckCollisionLines_R,         4},
        {"CheckCollisionPointLine_R",     (DL_FUNC) &CheckCollisionPointLine_R,     4},
        {"GetCollisionRec_R",             (DL_FUNC) &GetCollisionRec_R,             2},

        // Text module
        {"DrawFPS_R",        (DL_FUNC) &DrawFPS_R,        2},
        {"DrawText_R",       (DL_FUNC) &DrawText_R,       5},

        // models module
        {"DrawCube_R",       (DL_FUNC) &DrawCube_R,       5},
        {"DrawCubeV_R",      (DL_FUNC) &DrawCubeV_R,      3},
        {"DrawCubeWires_R",  (DL_FUNC) &DrawCubeWires_R,  5},
        {"DrawCubeWiresV_R", (DL_FUNC) &DrawCubeWiresV_R, 3},
        {"DrawPlane_R",      (DL_FUNC) &DrawPlane_R,      3},
        {"DrawGrid_R",       (DL_FUNC) &DrawGrid_R,       2},

        // Color or pixel related functions
        {"Fade_R",       (DL_FUNC) &Fade_R,       2},

        // Heap allocated structs and external pointer handling
        {"create_Camera3D_R",    (DL_FUNC) &create_Camera3D_R,    2},
        {"set_Camera3D_R",       (DL_FUNC) &set_Camera3D_R,       2},
        {"get_Camera3D_R",       (DL_FUNC) &get_Camera3D_R,       1},
        {"create_Image_R",       (DL_FUNC) &create_Image_R,       2},
        {"create_Shader_R",      (DL_FUNC) &create_Shader_R,      3},
        {"create_Shader_code_R", (DL_FUNC) &create_Shader_code_R, 3},

        {NULL, NULL, 0}};

void attribute_visible R_init_raylib_R(DllInfo *info) {
        R_registerRoutines(info, NULL, callMethods, NULL, NULL);
        R_useDynamicSymbols(info, FALSE);
        R_forceSymbols(info, TRUE);
}
