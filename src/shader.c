#include "raylib.R.h"
#include "utils.h"
#include <Rinternals.h>

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

// Set Shader location array
SEXP set_shader_location_array_R(SEXP shader, SEXP loc_index, SEXP shader_loc)
{
        int loc_index_len = Rf_length(loc_index);
        int shader_loc_len = Rf_length(shader_loc);

        if (loc_index_len != shader_loc_len)
                Rf_error("`loc_index` and `shader_loc` lengths must be equal");

        if (loc_index_len == 0)
                Rf_error("Got zero length vector");

        Shader *ptr = (Shader *) shader_p_from_sexp(shader);
        int *loc_index_p = INTEGER(Rf_coerceVector(loc_index, INTSXP));
        int *shader_loc_p = INTEGER(Rf_coerceVector(shader_loc, INTSXP));

        for (int i = 0; i < Rf_length(loc_index); ++i) {
                shader_loc_index_valid_else_error(loc_index_p[i]);

                ptr->locs[loc_index_p[i]] = shader_loc_p[i];
        }

        return R_NilValue;
}
