#ifndef RAYLIB_R_H
#define RAYLIB_R_H

#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include "raylib.h"
#include "utils.h"
#include "core.h"
#include "shapes.h"
#include "text.h"
#include "models.h"
#include "camera3d.h"
#include "textures.h"
#include "rcamera.h"

#define COUNT_OF(x) ((sizeof(x)/sizeof(0[x])) / ((size_t)(!(sizeof(x) % sizeof(0[x])))))

#endif
