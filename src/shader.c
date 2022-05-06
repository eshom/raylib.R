#include "raylib.R.h"

static void _finalizer(SEXP ext)
{
        if (R_ExternalPtrAddr(ext) == NULL)
                return;

        Shader *ptr = (Shader *) R_ExternalPtrAddr(ext);

        UnloadShader(*ptr); // Free shader data
        R_Free(ptr);       // Free allocated Shader struct
        R_ClearExternalPtr(ext);
}

// Load shader from files and bind default locations
SEXP create_Shader_R(SEXP vs_file_name, SEXP fs_file_name, SEXP info)
{
        const char *vs = string_from_sexp(vs_file_name);
        const char *fs = string_from_sexp(fs_file_name);

        Shader *shd = R_Calloc(1, Shader);
        *shd = LoadShader(vs, fs);

        SEXP ext = PROTECT(R_MakeExternalPtr(shd, R_NilValue, info));

        UNPROTECT(1);
        return ext;
}

// Load shader from code strings and bind default locations
SEXP create_Shader_code_R(SEXP vs_code, SEXP fs_code, SEXP info)
{
        const char *vs = string_from_sexp(vs_code);
        const char *fs = string_from_sexp(fs_code);

        Shader *shd = R_Calloc(1, Shader);
        *shd = LoadShaderFromMemory(vs, fs);

        SEXP ext = PROTECT(R_MakeExternalPtr(shd, R_NilValue, info));

        UNPROTECT(1);
        return ext;
}
