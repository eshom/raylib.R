#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include "raylib.h"
#include "utils.h"
#include "camera3d.h"

// raylib object creation and handling defined here.
// They cannot be used directly, so we use R's external pointer interface

// Called when the external pointer is no longer represented by any R object
static void _finalizer(SEXP ext)
{
        if (R_ExternalPtrAddr(ext) == NULL)
                return;

        Camera3D *ptr = (Camera3D *) R_ExternalPtrAddr(ext);
        R_Free(ptr);
        R_ClearExternalPtr(ext);
}

SEXP create_Camera3D_R(SEXP cam_list, SEXP info)
{
        Vector3 position_vec = vector3_from_sexp(VECTOR_ELT(cam_list, 0));
        Vector3 target_vec = vector3_from_sexp(VECTOR_ELT(cam_list, 1));
        Vector3 up_vec = vector3_from_sexp(VECTOR_ELT(cam_list, 2));
        float fovy = (float)Rf_asReal(VECTOR_ELT(cam_list, 3));
        int projection = Rf_asInteger(VECTOR_ELT(cam_list, 4));

        Camera3D *cam = R_Calloc(1, Camera3D);

        cam->position = position_vec;
        cam->target = target_vec;
        cam->up = up_vec;
        cam->fovy = fovy;
        cam->projection = projection;

        SEXP ext = PROTECT(R_MakeExternalPtr(cam, R_NilValue, info));

        R_RegisterCFinalizerEx(ext, _finalizer, TRUE);

        UNPROTECT(1);
        return ext;
}
