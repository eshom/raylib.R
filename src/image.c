#include "raylib.R.h"

static void _finalizer(SEXP ext)
{
        if (R_ExternalPtrAddr(ext) == NULL)
                return;

        Image *ptr = (Image *) R_ExternalPtrAddr(ext);

        UnloadImage(*ptr); // Free image data
        R_Free(ptr);       // Free allocated Image struct
        R_ClearExternalPtr(ext);
}

SEXP create_Image_R(SEXP file_name, SEXP info)
{
        const char *fn = string_from_sexp(file_name);

        Image *img = R_Calloc(1, Image);
        *img = LoadImage(fn);

        SEXP ext = PROTECT(R_MakeExternalPtr(img, R_NilValue, info));

        UNPROTECT(1);
        return ext;
}
