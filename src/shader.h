#ifndef SHADER_H
#define SHADER_H

#include <R.h>
#include <Rinternals.h>

SEXP create_Shader_R(SEXP vs_file_name, SEXP fs_file_name, SEXP info);
SEXP create_Shader_code_R(SEXP vs_code, SEXP fs_code, SEXP info);
SEXP set_shader_location_array_R(SEXP shader, SEXP loc_index, SEXP shader_loc);

#endif
