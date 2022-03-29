#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <raylib.h>
#include "structs.h"

// raylib object creation and handling defined here.
// They cannot be used directly, so we use R's external pointer interface

// Called when the external pointer is no longer represented by any R object
static void _finalizer(SEXP ext)
{
        if (R_ExternalPtrAddr(ext) == NULL)
                return;

        Vector2 *ptr = (Vector2 *) R_ExternalPtrAddr(ext);
        R_Free(ptr);
        R_ClearExternalPtr(ext);
}

SEXP create_Vector2(SEXP info)
{
        Vector2 *x = R_Calloc(1, Vector2);
        SEXP ext = PROTECT(R_MakeExternalPtr(x, R_NilValue, info));
        R_RegisterCFinalizerEx(ext, _finalizer, TRUE);
        UNPROTECT(1);

        return ext;
}

SEXP get_Vector2(SEXP ext)
{
        SEXP vec_out = PROTECT(Rf_allocVector(REALSXP, 2));
        double *vec_out_p = REAL(vec_out);

        Vector2 *ptr = (Vector2 *) R_ExternalPtrAddr(ext);

        vec_out_p[0] = (double) ptr->x;
        vec_out_p[1] = (double) ptr->y;

        UNPROTECT(1);
        return vec_out;
}

SEXP set_Vector2(SEXP ext, SEXP vec_dbl)
{
        double *vec_dbl_p = REAL(vec_dbl);
        Vector2 *ptr = (Vector2 *) R_ExternalPtrAddr(ext);

        ptr->x = (float) vec_dbl_p[0];
        ptr->y = (float) vec_dbl_p[1];

        return R_NilValue;
}
