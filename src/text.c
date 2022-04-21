#include "raylib.R.h"

/* // Font loading/unloading functions */
/*  Font GetFontDefault(void); // Get the default Font */
/*  Font LoadFont(const char *fileName); // Load font from file into GPU memory (VRAM) */
/*  Font LoadFontEx(const char *fileName, int fontSize, int *fontChars, int glyphCount); // Load font from file with extended parameters */
/*  Font LoadFontFromImage(Image image, Color key, int firstChar); // Load font from Image (XNA style) */
/*  Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *fontChars, int glyphCount); // Load font from memory buffer, file */
/*  GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *fontChars, int glyphCount, int type); // Load font data for further use */
/*  Image GenImageFontAtlas(const GlyphInfo *chars, Rectangle **recs, int glyphCount, int fontSize, int padding, int packMethod); // Generate image font atlas using chars inf */
/*  void UnloadFontData(GlyphInfo *chars, int glyphCount); // Unload font chars info data (RAM) */
/*  void UnloadFont(Font font); // Unload Font from GPU memory (VRAM) */
// Text drawing functions

// Draw current FPS
SEXP DrawFPS_R(SEXP pos_x, SEXP pos_y)
{
        DrawFPS(Rf_asInteger(pos_x), Rf_asInteger(pos_y));
        return R_NilValue;
}

// Draw text (using default font)
SEXP DrawText_R(SEXP text, SEXP pos_x, SEXP pos_y, SEXP font_size, SEXP color)
{
        const char *text_str = string_from_sexp(text);
        int pos_x_val = Rf_asInteger(pos_x);
        int pos_y_val = Rf_asInteger(pos_y);
        int font_size_val = Rf_asInteger(font_size);
        Color col = color_from_sexp(color);

        DrawText(text_str, pos_x_val, pos_y_val, font_size_val, col);

        return R_NilValue;
}
/*  void DrawText(const char *text, int posX, int posY, int fontSize, Color color); // Draw text (using default font) */
/*  void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint); // Draw text using font and additional parameters */
/*  void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint); // Draw text using Font and pro par */
/*  void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint); // Draw one character (codepoint) */
/*  // Text misc. functions */
/*  int MeasureText(const char *text, int fontSize); // Measure string width for default font */
/*  Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing); // Measure string size for Font */
/*  int GetGlyphIndex(Font font, int codepoint); // Get glyph index position in font for a codepoint (unicode character), fallba */
/*  GlyphInfo GetGlyphInfo(Font font, int codepoint); // Get glyph font info data for a codepoint (unicode character), fallback to '? */
/*  Rectangle GetGlyphAtlasRec(Font font, int codepoint); // Get glyph rectangle in font atlas for a codepoint (unicode character), fallb */
/*  // Text codepoints management functions (unicode characters) */
/*  int *LoadCodepoints(const char *text, int *count); // Load all codepoints from a UTF-8 text string, codepoints count returned by p */
/*  void UnloadCodepoints(int *codepoints); // Unload codepoints data from memory */
/*  int GetCodepointCount(const char *text); // Get total number of codepoints in a UTF-8 encoded string */
/*  int GetCodepoint(const char *text, int *bytesProcessed); // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failu */
/*  const char *CodepointToUTF8(int codepoint, int *byteSize); // Encode one codepoint into UTF-8 byte array (array length returned as paramet */
/*  char *TextCodepointsToUTF8(int *codepoints, int length); // Encode text as codepoints array into UTF-8 text string (WARNING: memory must */
/*  // Text strings management functions (no utf8 strings, only byte chars) */
/*  // NOTE: Some strings allocate memory internally for returned strings, just be careful! */
/*  int TextCopy(char *dst, const char *src); // Copy one string to another, returns bytes copied */
/*  bool TextIsEqual(const char *text1, const char *text2); // Check if two text string are equal */
/*  unsigned int TextLength(const char *text); // Get text length, checks for '\0' ending */
/*  const char *TextFormat(const char *text, ...); // Text formatting with variables (sprintf style) */
/*  const char *TextSubtext(const char *text, int position, int length); // Get a piece of a text string */
/*  char *TextReplace(char *text, const char *replace, const char *by); // Replace text string (memory must be freed!) */
/*  char *TextInsert(const char *text, const char *insert, int position); // Insert text in a position (memory must be freed!) */
/*  const char *TextJoin(const char **textList, int count, const char *delimiter); // Join text strings with delimiter */
/*  const char **TextSplit(const char *text, char delimiter, int *count); // Split text into multiple strings */
/*  void TextAppend(char *text, const char *append, int *position); // Append text at specific position and move cursor! */
/*  int TextFindIndex(const char *text, const char *find); // Find first text occurrence within a string */
/*  const char *TextToUpper(const char *text); // Get upper case version of provided string */
/*  const char *TextToLower(const char *text); // Get lower case version of provided string */
/* module: models */
/* module: audio */
/*  // Audio device management functions */
/*  void InitAudioDevice(void); // Initialize audio device and context */
/*  void CloseAudioDevice(void); // Close the audio device and context */
/*  bool IsAudioDeviceReady(void); // Check if audio device has been initialized successfully */
/*  void SetMasterVolume(float volume); // Set master volume (listener) */
/*  // Wave/Sound loading/unloading functions */
/*  Wave LoadWave(const char *fileName); // Load wave data from file */
/*  Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize); // Load wave from memory buffer */
/*  Sound LoadSound(const char *fileName); // Load sound from file */
/*  Sound LoadSoundFromWave(Wave wave); // Load sound from wave data */
/*  void UpdateSound(Sound sound, const void *data, int samplesCount); // Update sound buffer with new data */
/*  void UnloadWave(Wave wave); // Unload wave data */
/*  void UnloadSound(Sound sound); // Unload sound */
/*  bool ExportWave(Wave wave, const char *fileName); // Export wave data to file, returns true on success */
/*  bool ExportWaveAsCode(Wave wave, const char *fileName); // Export wave sample data to code (.h), returns true on success */
/*  // Wave/Sound management functions */
/*  void PlaySound(Sound sound); // Play a sound */
/*  void StopSound(Sound sound); // Stop playing a sound */
/*  void PauseSound(Sound sound); // Pause a sound */
/*  void ResumeSound(Sound sound); // Resume a paused sound */
/*  void PlaySoundMulti(Sound sound); // Play a sound (using multichannel buffer pool) */
/*  void StopSoundMulti(void); // Stop any sound playing (using multichannel buffer pool) */
/*  int GetSoundsPlaying(void); // Get number of sounds playing in the multichannel */
/*  bool IsSoundPlaying(Sound sound); // Check if a sound is currently playing */
/*  void SetSoundVolume(Sound sound, float volume); // Set volume for a sound (1.0 is max level) */
/*  void SetSoundPitch(Sound sound, float pitch); // Set pitch for a sound (1.0 is base level) */
/*  void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels); // Convert wave data to desired format */
/*  Wave WaveCopy(Wave wave); // Copy a wave to a new wave */
/*  void WaveCrop(Wave *wave, int initSample, int finalSample); // Crop a wave to defined samples range */
/*  float *LoadWaveSamples(Wave wave); // Load samples data from wave as a floats array */
/*  void UnloadWaveSamples(float *samples); // Unload samples data loaded with LoadWaveSamples() */
/*  // Music management functions */
/*  Music LoadMusicStream(const char *fileName); // Load music stream from file */
/*  Music LoadMusicStreamFromMemory(const char *fileType, unsigned char *data, int dataSize); // Load music stream from data */
/*  void UnloadMusicStream(Music music); // Unload music stream */
/*  void PlayMusicStream(Music music); // Start music playing */
/*  bool IsMusicStreamPlaying(Music music); // Check if music is playing */
/*  void UpdateMusicStream(Music music); // Updates buffers for music streaming */
/*  void StopMusicStream(Music music); // Stop music playing */
/*  void PauseMusicStream(Music music); // Pause music playing */
/*  void ResumeMusicStream(Music music); // Resume playing paused music */
/*  void SeekMusicStream(Music music, float position); // Seek music to a position (in seconds) */
/*  void SetMusicVolume(Music music, float volume); // Set volume for music (1.0 is max level) */
/*  void SetMusicPitch(Music music, float pitch); // Set pitch for a music (1.0 is base level) */
/*  float GetMusicTimeLength(Music music); // Get music time length (in seconds) */
/*  float GetMusicTimePlayed(Music music); // Get current music time played (in seconds) */
/*  // AudioStream management functions */
/*  const char *TextToPascal(const char *text); // Get Pascal case notation version of provided string */
/*  int TextToInteger(const char *text); // Get integer value from text (negative values not supported) */
