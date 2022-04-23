#include "raylib.R.h"
#include "utils.h"
#include <Rinternals.h>
#include <raylib.h>

// Set camera mode (multiple camera modes available)
SEXP SetCameraMode_R(SEXP camera, SEXP mode)
{
        int imode = Rf_asInteger(mode);

        if (!(imode >= 0 && imode <= 4))
                Rf_error("Invalid camera mode");

        SetCameraMode(*camera3d_p_from_sexp(camera), imode);

        return R_NilValue;
}

// Update camera position for selected mode
SEXP UpdateCamera_R(SEXP camera)
{
        UpdateCamera(camera3d_p_from_sexp(camera));

        return R_NilValue;
}

// Set camera pan key to combine with mouse movement (free camera)
SEXP SetCameraPanControl_R(SEXP key_pan)
{
        int ikey_pan = Rf_asInteger(key_pan);
        general_key_valid_else_error(ikey_pan);

        SetCameraPanControl(ikey_pan);

        return R_NilValue;
}

// Set camera alt key to combine with mouse movement (free camera)
SEXP SetCameraAltControl_R(SEXP key_alt)
{
        int ikey_alt = Rf_asInteger(key_alt);
        general_key_valid_else_error(ikey_alt);

        SetCameraAltControl(ikey_alt);

        return R_NilValue;
}

// Set camera smooth zoom key to combine with mouse (free camera)
SEXP SetCameraSmoothZoomControl_R(SEXP key_smooth_zoom)
{
        int ikey_smooth_zoom = Rf_asInteger(key_smooth_zoom);
        general_key_valid_else_error(ikey_smooth_zoom);

        SetCameraSmoothZoomControl(ikey_smooth_zoom);

        return R_NilValue;
}
// Set camera move controls (1st person and 3rd person cameras)
SEXP SetCameraMoveControls_R(SEXP key_front, SEXP key_back, SEXP key_right, SEXP key_left, SEXP key_up, SEXP key_down)
{
        int keys[] = {Rf_asInteger(key_front), Rf_asInteger(key_back),
                      Rf_asInteger(key_right), Rf_asInteger(key_left),
                      Rf_asInteger(key_up), Rf_asInteger(key_down)};

        for (size_t ind = 0; ind < 6; ++ind)
                general_key_valid_else_error(keys[ind]);

        SetCameraMoveControls(keys[0], keys[1], keys[2], keys[3], keys[4], keys[5]);

        return R_NilValue;
}
