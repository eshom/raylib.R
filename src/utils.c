#include <R_ext/Error.h>
#define R_NO_REMAP
#include "utils.h"
#include <R.h>
#include <Rinternals.h>
#include "raylib.h"

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

// Turn a list of R Vector2 objects into an array of Vector2
// The return value needs to be freed
Vector2 *vector2_array_from_sexp(SEXP vec2_list)
{
        int points_len = LENGTH(vec2_list);

        if (points_len == 0)
                Rf_error("Expecting list length greater than zero");

        Vector2 *points_out = R_Calloc(points_len, Vector2);

        if (points_out == NULL)
                Rf_error("Could not allocate memory");

        for (int i = 0; i < points_len; ++i)
                points_out[i] = vector2_from_sexp(VECTOR_ELT(vec2_list, i));

        return points_out;
}

// Allocate an R vector of length 2 from R vector.
// Must UNPROTECT() after calling
SEXP sexp_from_vector2(Vector2 vec)
{
        SEXP vec_out = PROTECT(Rf_allocVector(REALSXP, 2));
        double *vec_out_p = REAL(vec_out);

        vec_out_p[0] = vec.x;
        vec_out_p[1] = vec.y;

        return vec_out;
}

// Take a vector3 vector passed from R, and return a Vector3
Vector3 vector3_from_sexp(SEXP vec3)
{
        double *vec3_p = REAL(vec3);

        return (Vector3){(float)vec3_p[0], (float)vec3_p[1], (float)vec3_p[2]};
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

// Get string for character vector of length 1 + checks. UTF-8 encoding
const char *string_from_sexp(SEXP char_vec)
{
        if (LENGTH(char_vec) != 1)
                Rf_error("Expecting character vector of length 1");

        return Rf_translateCharUTF8(STRING_ELT(char_vec, 0));
}
