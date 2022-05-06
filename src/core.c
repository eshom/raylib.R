#include "raylib.R.h"
#include "utils.h"
#include <R_ext/Error.h>
#include <Rinternals.h>
#include <raylib.h>

// Windows-related functions

// Initialize window and OpenGL context
SEXP InitWindow_R(SEXP width, SEXP height, SEXP title)
{
        InitWindow(Rf_asInteger(width), Rf_asInteger(height), CHAR(Rf_asChar(title)));
        return R_NilValue;
}

// Check if KEY_ESCAPE pressed or Close icon pressed
SEXP WindowShouldClose_R(void)
{
        return Rf_ScalarLogical(WindowShouldClose());
}

// Close window and unload OpenGL context
SEXP CloseWindow_R(void)
{
        window_ready_else_error();
        CloseWindow();
        return R_NilValue;
}

// Check if window has been initialized successfully
SEXP IsWindowReady_R(void)
{
        return Rf_ScalarLogical(IsWindowReady());
}

// Check if window is currently fullscreen
SEXP IsWindowFullscreen_R(void)
{
        return Rf_ScalarLogical(IsWindowReady());
}

// Check if window is currently hidden (only PLATFORM_DESKTOP)
SEXP IsWindowHidden_R(void)
{
        return Rf_ScalarLogical(IsWindowHidden());
}

// Check if window is currently minimized (only PLATFORM_DESKTOP)
SEXP IsWindowMinimized_R(void)
{
        return Rf_ScalarLogical(IsWindowMinimized());
}

// Check if window is currently maximized (only PLATFORM_DESKTOP)
SEXP IsWindowMaximized_R(void)
{
        return Rf_ScalarLogical(IsWindowMaximized());
}

// Check if window is currently maximized (only PLATFORM_DESKTOP)
SEXP IsWindowFocused_R(void)
{
        return Rf_ScalarLogical(IsWindowFocused());
}

// Check if window has been resized last frame
SEXP IsWindowResized_R(void)
{
        return Rf_ScalarLogical(IsWindowResized());
}

// Check if one specific window flag is enabled
SEXP IsWindowState_R(SEXP flag)
{
        unsigned int uiflag = flag_from_sexp(flag);

        return Rf_ScalarLogical(IsWindowState(uiflag));
}

// Set window configuration state using flags (only PLATFORM_DESKTOP)
SEXP SetWindowState_R(SEXP flags)
{
        unsigned int uiflags = flag_from_sexp(flags);

        SetWindowState(uiflags);

        return R_NilValue;
}

// Clear window configuration state flags
SEXP ClearWindowState_R(SEXP flags)
{
        unsigned int uiflags = flag_from_sexp(flags);

        ClearWindowState(uiflags);

        return R_NilValue;
}

// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
SEXP ToggleFullscreen_R(void)
{
        ToggleFullscreen();
        return R_NilValue;
}

// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
SEXP MaximizeWindow_R(void)
{
        MaximizeWindow();
        return R_NilValue;
}

// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
SEXP MinimizeWindow_R(void)
{
        MinimizeWindow();
        return R_NilValue;
}

// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
SEXP RestoreWindow_R(void)
{
        RestoreWindow();
        return R_NilValue;
}

// Set icon for window (only PLATFORM_DESKTOP)
SEXP SetWindowIcon_R(SEXP image)
{
        SetWindowIcon(*image_p_from_sexp(image));
        return R_NilValue;
}

// Set title for window (only PLATFORM_DESKTOP)
SEXP SetWindowTitle_R(SEXP title)
{
        SetWindowTitle(string_from_sexp(title));
        return R_NilValue;
}

// Set window position on screen (only PLATFORM_DESKTOP)
SEXP SetWindowPosition_R(SEXP x, SEXP y)
{
        SetWindowPosition(Rf_asInteger(x), Rf_asInteger(y));
        return R_NilValue;
}

// Set monitor for the current window (fullscreen mode)
SEXP SetWindowMonitor_R(SEXP monitor)
{
        SetWindowMonitor(Rf_asInteger(monitor));
        return R_NilValue;
}

// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
SEXP SetWindowMinSize_R(SEXP width, SEXP height)
{
        SetWindowMinSize(Rf_asInteger(width), Rf_asInteger(height));
        return R_NilValue;
}

// Set window dimensions
SEXP SetWindowSize_R(SEXP width, SEXP height)
{
        SetWindowSize(Rf_asInteger(width), Rf_asInteger(height));
        return R_NilValue;
}

// Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
SEXP SetWindowOpacity_R(SEXP opacity)
{
        float fopacity = (float)Rf_asReal(opacity);

        if (fopacity < 0.0f || fopacity > 1.0f)
                Rf_error("Expecting opacity value between 0 and 1");

        SetWindowOpacity(fopacity);
        return R_NilValue;
}

/* RLAPI void *GetWindowHandle(void);                                // Get native window handle */

// Get current screen width
SEXP GetScreenWidth_R(void)
{
        return Rf_ScalarInteger(GetScreenWidth());
}

// Get current screen height
SEXP GetScreenHeight_R(void)
{
        return Rf_ScalarInteger(GetScreenHeight());
}

// Get current render width (it considers HiDPI)
SEXP GetRenderWidth_R(void)
{
        return Rf_ScalarInteger(GetRenderWidth());
}

// Get current render height (it considers HiDPI)
SEXP GetRenderHeight_R(void)
{
        return Rf_ScalarInteger(GetRenderHeight());
}

// Get number of connected monitors
SEXP GetMonitorCount_R(void)
{
        return Rf_ScalarInteger(GetMonitorCount());
}

// Get current connected monitor
SEXP GetCurrentMonitor_R(void)
{
        return Rf_ScalarInteger(GetCurrentMonitor());
}

// Get specified monitor position
SEXP GetMonitorPosition_R(SEXP monitor)
{
        SEXP out = sexp_from_vector2(GetMonitorPosition(Rf_asInteger(monitor)));

        UNPROTECT(1);
        return out;
}

// Get specified monitor width (max available by monitor)
SEXP GetMonitorWidth_R(SEXP monitor)
{
        return Rf_ScalarInteger(GetMonitorWidth(Rf_asInteger(monitor)));
}

// Get specified monitor height (max available by monitor)
SEXP GetMonitorHeight_R(SEXP monitor)
{
        return Rf_ScalarInteger(GetMonitorHeight(Rf_asInteger(monitor)));
}

// Get specified monitor physical width in millimetres
SEXP GetMonitorPhysicalWidth_R(SEXP monitor)
{
        return Rf_ScalarInteger(GetMonitorPhysicalWidth(Rf_asInteger(monitor)));
}

// Get specified monitor physical height in millimetres
SEXP GetMonitorPhysicalHeight_R(SEXP monitor)
{
        return Rf_ScalarInteger(GetMonitorPhysicalHeight(Rf_asInteger(monitor)));
}

// Get specified monitor refresh rate
SEXP GetMonitorRefreshRate_R(SEXP monitor)
{
        return Rf_ScalarInteger(GetMonitorRefreshRate(Rf_asInteger(monitor)));
}

// Get window position XY on monitor
SEXP GetWindowPosition_R(void)
{
        SEXP out = sexp_from_vector2(GetWindowPosition());

        UNPROTECT(1);
        return out;
}

// Get window scale DPI factor
SEXP GetWindowScaleDPI_R(void)
{
        SEXP out = sexp_from_vector2(GetWindowScaleDPI());

        UNPROTECT(1);
        return out;
}

// Get the human-readable, UTF-8 encoded name of the primary monitor
SEXP GetMonitorName_R(SEXP monitor)
{
        SEXP out = sexp_from_string(GetMonitorName(Rf_asInteger(monitor)));

        UNPROTECT(1);
        return out;
}

// Set clipboard text content
SEXP SetClipboardText_R(SEXP text)
{
        SetClipboardText(string_from_sexp(text));
        return R_NilValue;
}

// Get clipboard text content
SEXP GetClipboardText_R(void)
{
        SEXP out = sexp_from_string(GetClipboardText());

        UNPROTECT(1);
        return out;
}

/* // Custom frame control functions */
/* // NOTE: Those functions are intended for advance users that want full control over the frame processing */
/* // By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents() */
/* // To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL */
/* RLAPI void SwapScreenBuffer(void);                                // Swap back buffer with front buffer (screen drawing) */
/* RLAPI void PollInputEvents(void);                                 // Register all input events */
/* RLAPI void WaitTime(float ms);                                    // Wait for some milliseconds (halt program execution) */

// Cursor-related functions

// Shows cursor
SEXP ShowCursor_R(void)
{
        ShowCursor();
        return R_NilValue;
}

// Hides cursor
SEXP HideCursor_R(void)
{
        HideCursor();
        return R_NilValue;
}

// Check if cursor is not visible
SEXP IsCursorHidden_R(void)
{
        IsCursorHidden();
        return R_NilValue;
}

// Enables cursor (unlock cursor)
SEXP EnableCursor_R(void)
{
        EnableCursor();
        return R_NilValue;
}

// Disables cursor (lock cursor)
SEXP DisableCursor_R(void)
{
        DisableCursor();
        return R_NilValue;
}

// Check if cursor is on the screen
SEXP IsCursorOnScreen_R(void)
{
        return Rf_ScalarLogical(IsCursorOnScreen());
}

// Drawing-related functions

// Set background color (framebuffer clear color)
SEXP ClearBackground_R(SEXP color)
{
        window_ready_else_error();

        Color col = color_from_sexp(color);

        ClearBackground(col);

        return R_NilValue;
}

// Setup canvas (framebuffer) to start drawing
SEXP BeginDrawing_R(void)
{
        window_ready_else_error();

        BeginDrawing();
        return R_NilValue;
}

// End canvas drawing and swap buffers (double buffering)
SEXP EndDrawing_R(void)
{
        window_ready_else_error();

        EndDrawing();
        return R_NilValue;
}

// Begin 2D mode with custom camera (2D)
SEXP BeginMode2D_R(SEXP camera)
{
        window_ready_else_error();

        Camera2D cam = camera2d_from_sexp(camera);

        BeginMode2D(cam);

        return R_NilValue;
}

// Ends 2D mode with custom camera
SEXP EndMode2D_R(void)
{
        window_ready_else_error();

        EndMode2D();
        return R_NilValue;
}

// Begin 3D mode with custom camera (3D)
SEXP BeginMode3D_R(SEXP camera)
{
        window_ready_else_error();

        Camera3D *camera_p = camera3d_p_from_sexp(camera);

        BeginMode3D(*camera_p);

        return R_NilValue;
}

// Ends 3D mode and returns to default 2D orthographic mode
SEXP EndMode3D_R(void)
{
        window_ready_else_error();

        EndMode3D();
        return R_NilValue;
}

// Begin drawing to render texture
SEXP BeginTextureMode_R(SEXP target)
{
        window_ready_else_error();

        BeginTextureMode(render_texture_from_sexp(target));
        return R_NilValue;
}

// Ends drawing to render texture
SEXP EndTextureMode_R(void)
{
        window_ready_else_error();

        EndTextureMode();
        return R_NilValue;
}
/* RLAPI void BeginShaderMode(Shader shader);                        // Begin custom shader drawing */
/* RLAPI void EndShaderMode(void);                                   // End custom shader drawing (use default shader) */
/* RLAPI void BeginBlendMode(int mode);                              // Begin blending mode (alpha, additive, multiplied, subtract, custom) */
/* RLAPI void EndBlendMode(void);                                    // End blending mode (reset to default: alpha blending) */
/* RLAPI void BeginScissorMode(int x, int y, int width, int height); // Begin scissor mode (define screen area for following drawing) */
/* RLAPI void EndScissorMode(void);                                  // End scissor mode */
/* RLAPI void BeginVrStereoMode(VrStereoConfig config);              // Begin stereo rendering (requires VR simulator) */
/* RLAPI void EndVrStereoMode(void);                                 // End stereo rendering (requires VR simulator) */

/* // VR stereo config functions for VR simulator */
/* RLAPI VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);     // Load VR stereo config for VR simulator device parameters */
/* RLAPI void UnloadVrStereoConfig(VrStereoConfig config);           // Unload VR stereo config */

/* // Shader management functions */
/* // NOTE: Shader functionality is not available on OpenGL 1.1 */
/* RLAPI Shader LoadShader(const char *vsFileName, const char *fsFileName);   // Load shader from files and bind default locations */
/* RLAPI Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode); // Load shader from code strings and bind default locations */
/* RLAPI int GetShaderLocation(Shader shader, const char *uniformName);       // Get shader uniform location */
/* RLAPI int GetShaderLocationAttrib(Shader shader, const char *attribName);  // Get shader attribute location */
/* RLAPI void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);               // Set shader uniform value */
/* RLAPI void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count);   // Set shader uniform value vector */
/* RLAPI void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);         // Set shader uniform value (matrix 4x4) */
/* RLAPI void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture); // Set shader uniform value for texture (sampler2d) */
/* RLAPI void UnloadShader(Shader shader);                                    // Unload shader from GPU memory (VRAM) */

/* // Screen-space-related functions */
/* RLAPI Ray GetMouseRay(Vector2 mousePosition, Camera camera);      // Get a ray trace from mouse position */
/* RLAPI Matrix GetCameraMatrix(Camera camera);                      // Get camera transform matrix (view matrix) */
/* RLAPI Matrix GetCameraMatrix2D(Camera2D camera);                  // Get camera 2d transform matrix */
/* RLAPI Vector2 GetWorldToScreen(Vector3 position, Camera camera);  // Get the screen space position for a 3d world space position */
/* RLAPI Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height); // Get size position for a 3d world space position */
/* RLAPI Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera); // Get the screen space position for a 2d camera world space position */
/* RLAPI Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera); // Get the world space position for a 2d camera screen space position */

// Timing-related functions

// Set target FPS (maximum)
SEXP SetTargetFPS_R(SEXP fps)
{
        SetTargetFPS(Rf_asInteger(fps));
        return R_NilValue;
}
/* RLAPI void SetTargetFPS(int fps);                                 // Set target FPS (maximum) */
/* RLAPI int GetFPS(void);                                           // Get current FPS */
/* RLAPI float GetFrameTime(void);                                   // Get time in seconds for last frame drawn (delta time) */
/* RLAPI double GetTime(void);                                       // Get elapsed time in seconds since InitWindow() */

/* // Misc. functions */
/* RLAPI int GetRandomValue(int min, int max);                       // Get a random value between min and max (both included) */
/* RLAPI void SetRandomSeed(unsigned int seed);                      // Set the seed for the random number generator */
/* RLAPI void TakeScreenshot(const char *fileName);                  // Takes a screenshot of current screen (filename extension defines format) */
/* RLAPI void SetConfigFlags(unsigned int flags);                    // Setup init configuration flags (view FLAGS) */

/* RLAPI void TraceLog(int logLevel, const char *text, ...);         // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...) */
/* RLAPI void SetTraceLogLevel(int logLevel);                        // Set the current threshold (minimum) log level */
/* RLAPI void *MemAlloc(int size);                                   // Internal memory allocator */
/* RLAPI void *MemRealloc(void *ptr, int size);                      // Internal memory reallocator */
/* RLAPI void MemFree(void *ptr);                                    // Internal memory free */

/* // Set custom callbacks */
/* // WARNING: Callbacks setup is intended for advance users */
/* RLAPI void SetTraceLogCallback(TraceLogCallback callback);         // Set custom trace log */
/* RLAPI void SetLoadFileDataCallback(LoadFileDataCallback callback); // Set custom file binary data loader */
/* RLAPI void SetSaveFileDataCallback(SaveFileDataCallback callback); // Set custom file binary data saver */
/* RLAPI void SetLoadFileTextCallback(LoadFileTextCallback callback); // Set custom file text data loader */
/* RLAPI void SetSaveFileTextCallback(SaveFileTextCallback callback); // Set custom file text data saver */

// Files management functions

// Check if a file has been dropped into window
SEXP IsFileDropped_R(void)
{
        return Rf_ScalarLogical(IsFileDropped());
}

// Get dropped files names (memory should be freed)
SEXP GetDroppedFiles_R(void)
{
        int count = 0;

        char **file_names = GetDroppedFiles(&count);

        if (!count) {
                ClearDroppedFiles();
                return Rf_allocVector(STRSXP, 0);
        }

        SEXP str_out = PROTECT(Rf_allocVector(STRSXP, count)); // Needs UNPROTECT
        for (int ind = 0; ind < count; ++ind)
                SET_STRING_ELT(str_out, ind, Rf_mkCharCE(file_names[ind], CE_UTF8));

        ClearDroppedFiles();
        UNPROTECT(1);

        return str_out;
}

/* // Compression/Encoding functionality */
/* RLAPI unsigned char *CompressData(const unsigned char *data, int dataLength, int *compDataLength);        // Compress data (DEFLATE algorithm) */
/* RLAPI unsigned char *DecompressData(const unsigned char *compData, int compDataLength, int *dataLength);  // Decompress data (DEFLATE algorithm) */
/* RLAPI char *EncodeDataBase64(const unsigned char *data, int dataLength, int *outputLength);               // Encode data to Base64 string */
/* RLAPI unsigned char *DecodeDataBase64(const unsigned char *data, int *outputLength);                      // Decode Base64 string data */

/* // Persistent storage management */
/* RLAPI bool SaveStorageValue(unsigned int position, int value);    // Save integer value to storage file (to defined position), returns true on success */
/* RLAPI int LoadStorageValue(unsigned int position);                // Load integer value from storage file (from defined position) */

/* RLAPI void OpenURL(const char *url);                              // Open URL with default system browser (if available) */

// Input-related functions: keyboard

// Check if a key has been pressed once
SEXP IsKeyPressed_R(SEXP key)
{
        int ikey = Rf_asInteger(key);
        keyboard_key_valid_else_error(ikey);
        return Rf_ScalarLogical(IsKeyPressed(ikey));
}

// Check if a key is being pressed
SEXP IsKeyDown_R(SEXP key)
{
        int ikey = Rf_asInteger(key);
        keyboard_key_valid_else_error(ikey);
        return Rf_ScalarLogical(IsKeyDown(ikey));
}

// Check if a key has been released once
SEXP IsKeyReleased_R(SEXP key)
{
        int ikey = Rf_asInteger(key);
        keyboard_key_valid_else_error(ikey);
        return Rf_ScalarLogical(IsKeyReleased(ikey));
}

// Check if a key is NOT being pressed
SEXP IsKeyUp_R(SEXP key)
{
        int ikey = Rf_asInteger(key);
        keyboard_key_valid_else_error(ikey);
        return Rf_ScalarLogical(IsKeyUp(ikey));
}

// Set a custom key to exit program (default is ESC)
SEXP SetExitKey_R(SEXP key)
{
        int ikey = Rf_asInteger(key);
        keyboard_key_valid_else_error(ikey);
        SetExitKey(ikey);
        return R_NilValue;
}

// get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
SEXP GetKeyPressed_R(void)
{
        return Rf_ScalarInteger(GetKeyPressed());
}

// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
SEXP GetCharPressed_R(void)
{
        return Rf_ScalarInteger(GetCharPressed());
}

/* // Input-related functions: gamepads */
/* RLAPI bool IsGamepadAvailable(int gamepad);                   // Check if a gamepad is available */
/* RLAPI const char *GetGamepadName(int gamepad);                // Get gamepad internal name id */
/* RLAPI bool IsGamepadButtonPressed(int gamepad, int button);   // Check if a gamepad button has been pressed once */
/* RLAPI bool IsGamepadButtonDown(int gamepad, int button);      // Check if a gamepad button is being pressed */
/* RLAPI bool IsGamepadButtonReleased(int gamepad, int button);  // Check if a gamepad button has been released once */
/* RLAPI bool IsGamepadButtonUp(int gamepad, int button);        // Check if a gamepad button is NOT being pressed */
/* RLAPI int GetGamepadButtonPressed(void);                      // Get the last gamepad button pressed */
/* RLAPI int GetGamepadAxisCount(int gamepad);                   // Get gamepad axis count for a gamepad */
/* RLAPI float GetGamepadAxisMovement(int gamepad, int axis);    // Get axis movement value for a gamepad axis */
/* RLAPI int SetGamepadMappings(const char *mappings);           // Set internal gamepad mappings (SDL_GameControllerDB) */

// Input-related functions: mouse

// Check if a mouse button has been pressed once
SEXP IsMouseButtonPressed_R(SEXP button)
{
        int ibutton = Rf_asInteger(button);
        return Rf_ScalarLogical(IsMouseButtonPressed(ibutton));
}

// Check if a mouse button is being pressed
SEXP IsMouseButtonDown_R(SEXP button)
{
        int ibutton = Rf_asInteger(button);
        return Rf_ScalarLogical(IsMouseButtonDown(ibutton));
}

// Check if a mouse button has been released once
SEXP IsMouseButtonReleased_R(SEXP button)
{
        int ibutton = Rf_asInteger(button);
        return Rf_ScalarLogical(IsMouseButtonReleased(ibutton));
}

// Check if a mouse button is NOT being pressed
SEXP IsMouseButtonUp_R(SEXP button)
{
        int ibutton = Rf_asInteger(button);
        return Rf_ScalarLogical(IsMouseButtonUp(ibutton));
}

// Get mouse position X
SEXP GetMouseX_R(void)
{
        return Rf_ScalarInteger(GetMouseX());
}

// Get mouse position Y
SEXP GetMouseY_R(void)
{
        return Rf_ScalarInteger(GetMouseY());
}

// Get mouse position XY
SEXP GetMousePosition_R(void)
{
        SEXP vec_out = sexp_from_vector2(GetMousePosition());

        UNPROTECT(1);
        return vec_out;
}

// Get mouse delta between frames
SEXP GetMouseDelta_R(void)
{
        SEXP vec_out = sexp_from_vector2(GetMouseDelta());

        UNPROTECT(1);
        return vec_out;
}

// Set mouse position XY
SEXP SetMousePosition_R(SEXP x, SEXP y)
{
        SetMousePosition(Rf_asInteger(x), Rf_asInteger(y));
        return R_NilValue;
}

// Set mouse offset
SEXP SetMouseOffset_R(SEXP offset_x, SEXP offset_y)
{
        SetMouseOffset(Rf_asInteger(offset_x), Rf_asInteger(offset_y));
        return R_NilValue;
}

// Set mouse scaling
SEXP SetMouseScale_R(SEXP scale_x, SEXP scale_y)
{
        SetMouseScale((float)Rf_asReal(scale_x), (float)Rf_asReal(scale_y));
        return R_NilValue;
}

// Get mouse wheel movement Y
SEXP GetMouseWheelMove_R(void)
{
        return Rf_ScalarReal(GetMouseWheelMove());
}

// Set mouse cursor
SEXP SetMouseCursor_R(SEXP cursor)
{
        int icursor = Rf_asInteger(cursor);
        mouse_cursor_valid_else_error(icursor);
        SetMouseCursor(icursor);

        return R_NilValue;
}

/* // Input-related functions: touch */
/* RLAPI int GetTouchX(void);                                    // Get touch position X for touch point 0 (relative to screen size) */
/* RLAPI int GetTouchY(void);                                    // Get touch position Y for touch point 0 (relative to screen size) */
/* RLAPI Vector2 GetTouchPosition(int index);                    // Get touch position XY for a touch point index (relative to screen size) */
/* RLAPI int GetTouchPointId(int index);                         // Get touch point identifier for given index */
/* RLAPI int GetTouchPointCount(void);                           // Get number of touch points */
