#ifndef SHADER_H
#define SHADER_H

#include <R.h>
#include <Rinternals.h>

SEXP create_Shader_R(SEXP vs_file_name, SEXP fs_file_name, SEXP info);
SEXP create_Shader_code_R(SEXP vs_code, SEXP fs_code, SEXP info);

#endif
