#ifndef RCAMERA_H
#define RCAMERA_H

#include <R.h>
#include <Rinternals.h>

SEXP SetCameraMode_R(SEXP camera, SEXP mode);
SEXP UpdateCamera_R(SEXP camera);
SEXP SetCameraPanControl_R(SEXP key_pan);
SEXP SetCameraAltControl_R(SEXP key_alt);
SEXP SetCameraSmoothZoomControl_R(SEXP key_smooth_zoom);
SEXP SetCameraMoveControls_R(SEXP key_front, SEXP key_back, SEXP key_right, SEXP key_left, SEXP key_up, SEXP key_down);

#endif
