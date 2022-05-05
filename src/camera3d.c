#include "raylib.R.h"
#include <Rinternals.h>

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

SEXP set_Camera3D_R(SEXP camera, SEXP what)
{
        int what_len = LENGTH(what);

        if (what_len <= 0)
                Rf_error("Length of `what` must be greater than 0");

        if (!(TYPEOF(what) == VECSXP || Rf_isList(what)))
                Rf_error("Argument `what` must be a list");

        SEXP what_names = Rf_getAttrib(what, R_NamesSymbol);

        if (what_names == R_NilValue)
                Rf_error("`what` list must be named");

        Camera3D *cam = camera3d_p_from_sexp(camera);

        for (int ind = 0; ind < what_len; ++ind) {
                const char *cam_par = Rf_translateCharUTF8(STRING_ELT(what_names, ind));

                if (!strcmp(cam_par, "position"))
                        cam->position = vector3_from_sexp(VECTOR_ELT(what, ind));
                if (!strcmp(cam_par, "target"))
                        cam->target = vector3_from_sexp(VECTOR_ELT(what, ind));
                if (!strcmp(cam_par, "up"))
                        cam->up = vector3_from_sexp(VECTOR_ELT(what, ind));
                if (!strcmp(cam_par, "fovy"))
                        cam->fovy = (float)Rf_asReal((VECTOR_ELT(what, ind)));
                if (!strcmp(cam_par, "projection"))
                        cam->projection = Rf_asInteger((VECTOR_ELT(what, ind)));
        }

        return R_NilValue;
}

SEXP get_Camera3D_R(SEXP camera)
{
        Camera3D *cam = camera3d_p_from_sexp(camera);

        const char *list_names[] = {"position", "target", "up", "fovy", "projection", ""};
        SEXP list = PROTECT(Rf_mkNamed(VECSXP, list_names)); //UNPROTECT

        SET_VECTOR_ELT(list, 0, sexp_from_vector3(cam->position)); // UNPROTECT
        SET_VECTOR_ELT(list, 1, sexp_from_vector3(cam->target)); // UNPROTECT
        SET_VECTOR_ELT(list, 2, sexp_from_vector3(cam->up)); // UNPROTECT
        SET_VECTOR_ELT(list, 3, Rf_ScalarReal(cam->fovy));
        SET_VECTOR_ELT(list, 4, Rf_ScalarInteger(cam->projection));

        UNPROTECT(4);
        return list;
}
