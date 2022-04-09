#define R_NO_REMAP
#include "utils.h"
#include <R.h>
#include <Rinternals.h>
#include <raylib.h>

// Colors must be between 0 and 255 in order to cast to unsigned char
// Otherwise throw R error and return to R REPL environment
static void check_color_bounds_else_error(int *color, int len)
{
        for (int i = 0; i < len; ++i)
                if ((color[i] < 0) || (color[i] > 255))
                        Rf_error("Expecting 0 < `color` <= 255");
}

// Take a color vector passed from R, and return a Color struct after checks
Color color_from_sexp(SEXP color)
{
        int *color_p = INTEGER(Rf_coerceVector(color, INTSXP));
        check_color_bounds_else_error(color_p, LENGTH(color));

        return (Color){(unsigned char)color_p[0], (unsigned char)color_p[1],
                (unsigned char)color_p[2], (unsigned char)color_p[3]};
}

// Take a vector2 vector passed from R, and return a Vector2
Vector2 vector2_from_sexp(SEXP vec2)
{
        double *vec2_p = REAL(vec2);

        return (Vector2){(float)vec2_p[0], (float)vec2_p[1]};
}

// Take a texture vector passed from R, and return a Texture struct + checks
Texture texture_from_sexp(SEXP texture)
{
        int *texture_p = INTEGER(Rf_coerceVector(texture, INTSXP));

        if (texture_p[0] < 0) {
                Rf_error("Expecting positive number for first element of `texture` argument");
        }

        return (Texture){texture_p[0], // unsigned int promotion
                texture_p[1], texture_p[2], texture_p[3], texture_p[4]};
}

// Take a rectangle vector passed from R, and return a Rectangle struct
Rectangle rectangle_from_sexp(SEXP rectangle)
{
        double *rectangle_p = REAL(rectangle);

        return  (Rectangle){(float)rectangle_p[0], (float)rectangle_p[1],
                (float)rectangle_p[2], (float)rectangle_p[3]};
}

// Return a flag after checks from flag length 1 R vector
unsigned int flag_from_sexp(SEXP flag)
{
        int iflag = Rf_asInteger(flag);

        if (iflag < 0) {
                Rf_error("`flag` cannot be negative");
        }

        return iflag;
}

// Return a camera  from R list that defines a Camera2D
Camera2D camera2d_from_sexp(SEXP camera)
{
        SEXP offset = VECTOR_ELT(camera, 0);
        SEXP target = VECTOR_ELT(camera, 1);
        SEXP rotation = VECTOR_ELT(camera, 2);
        SEXP zoom = VECTOR_ELT(camera, 3);

        Vector2 offset_vec = vector2_from_sexp(offset);
        Vector2 target_vec = vector2_from_sexp(target);

        return (Camera2D){offset_vec, target_vec,
                (float)Rf_asReal(rotation), (float)Rf_asReal(zoom)};
}

// Get the pointer for camera3d heap allocated struct from R externalpointer
Camera3D *camera3d_p_from_sexp(SEXP camera)
{
        return (Camera3D*)R_ExternalPtrAddr(camera);
}
