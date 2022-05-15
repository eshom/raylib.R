#include "raylib.R.h"
#include "utils.h"
#include <Rinternals.h>
#include <raylib.h>

static void _finalizer(SEXP ext)
{
        if (R_ExternalPtrAddr(ext) == NULL)
                return;

        Texture *ptr = (Texture *) R_ExternalPtrAddr(ext);

        UnloadTexture(*ptr); // Free texture data from GPU
        R_Free(ptr);       // Free allocated Texture struct
        R_ClearExternalPtr(ext);
}

SEXP create_Texture_R(SEXP file_name, SEXP info)
{
        const char *fn = string_from_sexp(file_name);

        Texture *texture = R_Calloc(1, Texture);
        *texture = LoadTexture(fn);

        SEXP ext = PROTECT(R_MakeExternalPtr(texture, R_NilValue, info));

        UNPROTECT(1);
        return ext;
}

SEXP set_Texture_R(SEXP texture, SEXP what)
{
        int what_len = Rf_length(what);

        if (what_len <= 0)
                Rf_error("Length of `what` must be greater than 0");

        if (!(TYPEOF(what) == VECSXP || Rf_isList(what)))
                Rf_error("Argument `what` must be a list");

        SEXP what_names = Rf_getAttrib(what, R_NamesSymbol);

        if (what_names == R_NilValue)
                Rf_error("`what` list must be named");

        Texture *tex = texture_p_from_sexp(texture);

        for (int ind = 0; ind < what_len; ++ind) {
                const char *tex_par = Rf_translateCharUTF8(STRING_ELT(what_names, ind));

                if (!strcmp(tex_par, "id"))
                        tex->id = (unsigned int)Rf_asInteger(VECTOR_ELT(what, ind));
                if (!strcmp(tex_par, "width"))
                        tex->width = Rf_asInteger(VECTOR_ELT(what, ind));
                if (!strcmp(tex_par, "height"))
                        tex->height = Rf_asInteger(VECTOR_ELT(what, ind));
                if (!strcmp(tex_par, "mipmaps"))
                        tex->mipmaps = Rf_asInteger((VECTOR_ELT(what, ind)));
                if (!strcmp(tex_par, "format"))
                        tex->format = Rf_asInteger((VECTOR_ELT(what, ind)));
        }

        return R_NilValue;
}


SEXP get_Texture_R(SEXP texture)
{
        Texture *tex = texture_p_from_sexp(texture);

        const char *vec_names[] = {"id", "width", "height", "mipmaps", "format", ""};
        SEXP out = PROTECT(Rf_mkNamed(INTSXP, vec_names)); //UNPROTECT
        int *out_p = INTEGER(out);

        out_p[0] = tex->id;
        out_p[1] = tex->width;
        out_p[2] = tex->height;
        out_p[3] = tex->mipmaps;
        out_p[4] = tex->format;

        UNPROTECT(1);
        return out;
}
