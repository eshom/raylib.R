#define R_NO_REMAP
#include "core.h"
#include <raylib.h>
#include <R.h>
#include <Rinternals.h>

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
        int iflag = Rf_asInteger(flag);

        if (iflag < 0) {
                Rf_error("`flag` cannot be negative");
                return R_NilValue;
        }

        unsigned int uiflag = iflag;

        return Rf_ScalarLogical(IsWindowState(uiflag));
}

// Set window configuration state using flags (only PLATFORM_DESKTOP)
SEXP SetWindowState_R(SEXP flags)
{
        int iflags = Rf_asInteger(flags);

        if (iflags < 0) {
                Rf_error("`flags` cannot be negative");
                return R_NilValue;
        }

        unsigned int uiflags = iflags;

        SetWindowState(uiflags);

        return R_NilValue;
}

// Clear window configuration state flags
SEXP ClearWindowState_R(SEXP flags)
{
        int iflags = Rf_asInteger(flags);

        if (iflags < 0) {
                Rf_error("`flags` cannot be negative");
                return R_NilValue;
        }

        unsigned int uiflags = iflags;

        ClearWindowState(uiflags);

        return R_NilValue;
}

// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
SEXP ToggleFullscreen_R(void)
{
        ToggleFullscreen();
        return R_NilValue;
}

/* RLAPI void MaximizeWindow(void);                                  // Set window state: maximized, if resizable (only PLATFORM_DESKTOP) */
/* RLAPI void MinimizeWindow(void);                                  // Set window state: minimized, if resizable (only PLATFORM_DESKTOP) */
/* RLAPI void RestoreWindow(void);                                   // Set window state: not minimized/maximized (only PLATFORM_DESKTOP) */
/* RLAPI void SetWindowIcon(Image image);                            // Set icon for window (only PLATFORM_DESKTOP) */
/* RLAPI void SetWindowTitle(const char *title);                     // Set title for window (only PLATFORM_DESKTOP) */
/* RLAPI void SetWindowPosition(int x, int y);                       // Set window position on screen (only PLATFORM_DESKTOP) */
/* RLAPI void SetWindowMonitor(int monitor);                         // Set monitor for the current window (fullscreen mode) */
/* RLAPI void SetWindowMinSize(int width, int height);               // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE) */
/* RLAPI void SetWindowSize(int width, int height);                  // Set window dimensions */
/* RLAPI void SetWindowOpacity(float opacity);                       // Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP) */
/* RLAPI void *GetWindowHandle(void);                                // Get native window handle */
/* RLAPI int GetScreenWidth(void);                                   // Get current screen width */
/* RLAPI int GetScreenHeight(void);                                  // Get current screen height */
/* RLAPI int GetRenderWidth(void);                                   // Get current render width (it considers HiDPI) */
/* RLAPI int GetRenderHeight(void);                                  // Get current render height (it considers HiDPI) */
/* RLAPI int GetMonitorCount(void);                                  // Get number of connected monitors */
/* RLAPI int GetCurrentMonitor(void);                                // Get current connected monitor */
/* RLAPI Vector2 GetMonitorPosition(int monitor);                    // Get specified monitor position */
/* RLAPI int GetMonitorWidth(int monitor);                           // Get specified monitor width (max available by monitor) */
/* RLAPI int GetMonitorHeight(int monitor);                          // Get specified monitor height (max available by monitor) */
/* RLAPI int GetMonitorPhysicalWidth(int monitor);                   // Get specified monitor physical width in millimetres */
/* RLAPI int GetMonitorPhysicalHeight(int monitor);                  // Get specified monitor physical height in millimetres */
/* RLAPI int GetMonitorRefreshRate(int monitor);                     // Get specified monitor refresh rate */
/* RLAPI Vector2 GetWindowPosition(void);                            // Get window position XY on monitor */
/* RLAPI Vector2 GetWindowScaleDPI(void);                            // Get window scale DPI factor */
/* RLAPI const char *GetMonitorName(int monitor);                    // Get the human-readable, UTF-8 encoded name of the primary monitor */
/* RLAPI void SetClipboardText(const char *text);                    // Set clipboard text content */
/* RLAPI const char *GetClipboardText(void);                         // Get clipboard text content */

/* // Custom frame control functions */
/* // NOTE: Those functions are intended for advance users that want full control over the frame processing */
/* // By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents() */
/* // To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL */
/* RLAPI void SwapScreenBuffer(void);                                // Swap back buffer with front buffer (screen drawing) */
/* RLAPI void PollInputEvents(void);                                 // Register all input events */
/* RLAPI void WaitTime(float ms);                                    // Wait for some milliseconds (halt program execution) */

/* // Cursor-related functions */
/* RLAPI void ShowCursor(void);                                      // Shows cursor */
/* RLAPI void HideCursor(void);                                      // Hides cursor */
/* RLAPI bool IsCursorHidden(void);                                  // Check if cursor is not visible */
/* RLAPI void EnableCursor(void);                                    // Enables cursor (unlock cursor) */
/* RLAPI void DisableCursor(void);                                   // Disables cursor (lock cursor) */
/* RLAPI bool IsCursorOnScreen(void);                                // Check if cursor is on the screen */

/* // Drawing-related functions */
/* RLAPI void ClearBackground(Color color);                          // Set background color (framebuffer clear color) */

// Drawing-related functions

// Set background color (framebuffer clear color)
SEXP ClearBackground_R(SEXP color)
{
        int *color_p = INTEGER(Rf_coerceVector(color, INTSXP));

        for (int i = 0; i < LENGTH(color); ++i) {
                if ((color_p[i] < 0) || (color_p[i] > 255)) {
                        Rf_error("Expecting 0 < `color` <= 255");
                        return R_NilValue;
                }
        }

        Color col = {color_p[0], color_p[1], color_p[2], color_p[3]};

        ClearBackground(col);

        return R_NilValue;
}

// Setup canvas (framebuffer) to start drawing
SEXP BeginDrawing_R(void)
{
        BeginDrawing();
        return R_NilValue;
}

// End canvas drawing and swap buffers (double buffering)
SEXP EndDrawing_R(void)
{
         EndDrawing();
         return R_NilValue;
}

// Begin 2D mode with custom camera (2D)
SEXP BeginMode2D_R(SEXP camera)
{
        SEXP offset = VECTOR_ELT(camera, 0);
        SEXP target = VECTOR_ELT(camera, 1);
        SEXP rotation = VECTOR_ELT(camera, 2);
        SEXP zoom = VECTOR_ELT(camera, 3);

        double *offset_p = REAL(offset);
        double *target_p = REAL(target);

        Vector2 offset_vec = {(float)offset_p[0], (float)offset_p[1]};
        Vector2 target_vec = {(float)target_p[0], (float)target_p[1]};

        Camera2D cam = {offset_vec, target_vec,
                (float)Rf_asReal(rotation), (float)Rf_asReal(zoom)};

        BeginMode2D(cam);

        return R_NilValue;
}

// Ends 2D mode with custom camera
SEXP EndMode2D_R(void)
{
          EndMode2D();
          return R_NilValue;
}

// Begin 3D mode with custom camera (3D)
SEXP BeginMode3D_R(SEXP camera)
{
        Camera3D *camera_p = (Camera3D*)R_ExternalPtrAddr(camera);
        BeginMode3D(*camera_p);
        return R_NilValue;
}

/* SEXP BeginMode3D_R( SEXP position, */
/*                     SEXP target, */
/*                     SEXP up, */
/*                     SEXP fovy, */
/*                     SEXP projection) */
/* { */

/*   double *position_p = REAL(position); */
/*   double *target_p = REAL(target); */
/*   double *up_p = REAL(up); */
/*   double *fovy_p = REAL(fovy); */
/*   int *projection_p = INTEGER(projection); */

/*   Camera camera = { 0 }; */
/*   camera.position = (Vector3){ (float)position_p[0], (float)position_p[1], (float)position_p[2] }; */
/*   camera.target = (Vector3){ (float)target_p[0], (float)target_p[1], (float)target_p[2] }; */
/*   camera.up = (Vector3){ (float)up_p[0], (float)up_p[1], (float)up_p[2] }; */
/*   camera.fovy = (float)fovy_p[0]; */

/*   switch(projection_p[0]) */
/*   { */
/*   case 1: */
/*     camera.projection = CAMERA_CUSTOM; break; */
/*   case 2: */
/*     camera.projection = CAMERA_FIRST_PERSON; break; */
/*   case 3: */
/*     camera.projection = CAMERA_FREE; break; */
/*   case 4: */
/*     camera.projection = CAMERA_ORBITAL; break; */
/*   case 5: */
/*     camera.projection = CAMERA_ORTHOGRAPHIC; break; */
/*   case 6: */
/*     camera.projection = CAMERA_PERSPECTIVE; break; */
/*   case 7: */
/*     camera.projection = CAMERA_THIRD_PERSON; break; */
/*   default: Rf_error("CAMERA3D C ERROR: bad perspective integer"); */
/*   } */

/*   BeginMode3D(camera); */

/*   return R_NilValue; */

/* } */

// Ends 3D mode and returns to default 2D orthographic mode
SEXP EndMode3D_R(void)
{
        EndMode3D();
        return R_NilValue;
}

/* RLAPI void BeginTextureMode(RenderTexture2D target);              // Begin drawing to render texture */
/* RLAPI void EndTextureMode(void);                                  // Ends drawing to render texture */
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

/* // Timing-related functions */
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

/* // Files management functions */
/* RLAPI unsigned char *LoadFileData(const char *fileName, unsigned int *bytesRead); // Load file data as byte array (read) */
/* RLAPI void UnloadFileData(unsigned char *data);                   // Unload file data allocated by LoadFileData() */
/* RLAPI bool SaveFileData(const char *fileName, void *data, unsigned int bytesToWrite); // Save data to file from byte array (write), returns true on success */
/* RLAPI char *LoadFileText(const char *fileName);                   // Load text data from file (read), returns a '\0' terminated string */
/* RLAPI void UnloadFileText(char *text);                            // Unload file text data allocated by LoadFileText() */
/* RLAPI bool SaveFileText(const char *fileName, char *text);        // Save text data to file (write), string must be '\0' terminated, returns true on success */
/* RLAPI bool FileExists(const char *fileName);                      // Check if file exists */
/* RLAPI bool DirectoryExists(const char *dirPath);                  // Check if a directory path exists */
/* RLAPI bool IsFileExtension(const char *fileName, const char *ext); // Check file extension (including point: .png, .wav) */
/* RLAPI int GetFileLength(const char *fileName);                    // Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h) */
/* RLAPI const char *GetFileExtension(const char *fileName);         // Get pointer to extension for a filename string (includes dot: '.png') */
/* RLAPI const char *GetFileName(const char *filePath);              // Get pointer to filename for a path string */
/* RLAPI const char *GetFileNameWithoutExt(const char *filePath);    // Get filename string without extension (uses static string) */
/* RLAPI const char *GetDirectoryPath(const char *filePath);         // Get full path for a given fileName with path (uses static string) */
/* RLAPI const char *GetPrevDirectoryPath(const char *dirPath);      // Get previous directory path for a given path (uses static string) */
/* RLAPI const char *GetWorkingDirectory(void);                      // Get current working directory (uses static string) */
/* RLAPI const char *GetApplicationDirectory(void);                  // Get the directory if the running application (uses static string) */
/* RLAPI char **GetDirectoryFiles(const char *dirPath, int *count);  // Get filenames in a directory path (memory should be freed) */
/* RLAPI void ClearDirectoryFiles(void);                             // Clear directory files paths buffers (free memory) */
/* RLAPI bool ChangeDirectory(const char *dir);                      // Change working directory, return true on success */
/* RLAPI bool IsFileDropped(void);                                   // Check if a file has been dropped into window */
/* RLAPI char **GetDroppedFiles(int *count);                         // Get dropped files names (memory should be freed) */
/* RLAPI void ClearDroppedFiles(void);                               // Clear dropped files paths buffer (free memory) */
/* RLAPI long GetFileModTime(const char *fileName);                  // Get file modification time (last write time) */

/* // Compression/Encoding functionality */
/* RLAPI unsigned char *CompressData(const unsigned char *data, int dataLength, int *compDataLength);        // Compress data (DEFLATE algorithm) */
/* RLAPI unsigned char *DecompressData(const unsigned char *compData, int compDataLength, int *dataLength);  // Decompress data (DEFLATE algorithm) */
/* RLAPI char *EncodeDataBase64(const unsigned char *data, int dataLength, int *outputLength);               // Encode data to Base64 string */
/* RLAPI unsigned char *DecodeDataBase64(const unsigned char *data, int *outputLength);                      // Decode Base64 string data */

/* // Persistent storage management */
/* RLAPI bool SaveStorageValue(unsigned int position, int value);    // Save integer value to storage file (to defined position), returns true on success */
/* RLAPI int LoadStorageValue(unsigned int position);                // Load integer value from storage file (from defined position) */

/* RLAPI void OpenURL(const char *url);                              // Open URL with default system browser (if available) */

/* //------------------------------------------------------------------------------------ */
/* // Input Handling Functions (Module: core) */
/* //------------------------------------------------------------------------------------ */

/* // Input-related functions: keyboard */
/* RLAPI bool IsKeyPressed(int key);                             // Check if a key has been pressed once */
/* RLAPI bool IsKeyDown(int key);                                // Check if a key is being pressed */
/* RLAPI bool IsKeyReleased(int key);                            // Check if a key has been released once */
/* RLAPI bool IsKeyUp(int key);                                  // Check if a key is NOT being pressed */
/* RLAPI void SetExitKey(int key);                               // Set a custom key to exit program (default is ESC) */
/* RLAPI int GetKeyPressed(void);                                // Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty */
/* RLAPI int GetCharPressed(void);                               // Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty */

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

/* // Input-related functions: mouse */
/* RLAPI bool IsMouseButtonPressed(int button);                  // Check if a mouse button has been pressed once */
/* RLAPI bool IsMouseButtonDown(int button);                     // Check if a mouse button is being pressed */
/* RLAPI bool IsMouseButtonReleased(int button);                 // Check if a mouse button has been released once */
/* RLAPI bool IsMouseButtonUp(int button);                       // Check if a mouse button is NOT being pressed */
/* RLAPI int GetMouseX(void);                                    // Get mouse position X */
/* RLAPI int GetMouseY(void);                                    // Get mouse position Y */
/* RLAPI Vector2 GetMousePosition(void);                         // Get mouse position XY */
/* RLAPI Vector2 GetMouseDelta(void);                            // Get mouse delta between frames */
/* RLAPI void SetMousePosition(int x, int y);                    // Set mouse position XY */
/* RLAPI void SetMouseOffset(int offsetX, int offsetY);          // Set mouse offset */
/* RLAPI void SetMouseScale(float scaleX, float scaleY);         // Set mouse scaling */
/* RLAPI float GetMouseWheelMove(void);                          // Get mouse wheel movement Y */
/* RLAPI void SetMouseCursor(int cursor);                        // Set mouse cursor */

/* // Input-related functions: touch */
/* RLAPI int GetTouchX(void);                                    // Get touch position X for touch point 0 (relative to screen size) */
/* RLAPI int GetTouchY(void);                                    // Get touch position Y for touch point 0 (relative to screen size) */
/* RLAPI Vector2 GetTouchPosition(int index);                    // Get touch position XY for a touch point index (relative to screen size) */
/* RLAPI int GetTouchPointId(int index);                         // Get touch point identifier for given index */
/* RLAPI int GetTouchPointCount(void);                           // Get number of touch points */
