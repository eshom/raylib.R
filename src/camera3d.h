#ifndef CAMERA3D_H
#define CAMERA3D_H

#include <R.h>
#include <Rinternals.h>

SEXP create_Camera3D_R(SEXP cam_list, SEXP info);
SEXP set_Camera3D_R(SEXP camera, SEXP what);
SEXP get_Camera3D_R(SEXP camera);

#endif
