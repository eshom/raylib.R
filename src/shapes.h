#ifndef SHAPES_H
#define SHAPES_H

#include <R.h>
#include <Rinternals.h>

// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
SEXP SetShapesTexture_R(SEXP texture, SEXP rectangle_source);

// Basic shapes drawing functions
SEXP DrawPixel_R(SEXP posX, SEXP posY, SEXP color);
SEXP DrawPixelV_R(SEXP vector2_position, SEXP color);
SEXP DrawLine_R(SEXP start_pos_x, SEXP start_pos_y, SEXP end_pos_x, SEXP end_pos_y, SEXP color);
SEXP DrawLineV_R(SEXP start_pos, SEXP end_pos, SEXP color);
SEXP DrawLineEx_R(SEXP start_pos, SEXP end_pos, SEXP thick, SEXP color);
SEXP DrawLineBezier_R(SEXP start_pos, SEXP end_pos, SEXP thick, SEXP color);
SEXP DrawLineBezierQuad_R(SEXP start_pos, SEXP end_pos, SEXP control_pos, SEXP thick, SEXP color);
SEXP DrawLineBezierCubic_R(SEXP start_pos, SEXP end_pos, SEXP start_control_pos, SEXP end_control_pos, SEXP thick, SEXP color);
SEXP DrawLineStrip_R(SEXP points, SEXP point_count, SEXP color);
SEXP DrawCircle_R(SEXP center_x, SEXP center_y, SEXP radius, SEXP color);
SEXP DrawCircleSector_R(SEXP center, SEXP radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color);
SEXP DrawCircleSectorLines_R(SEXP center, SEXP radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color);
SEXP DrawCircleGradient_R(SEXP center_x, SEXP center_y, SEXP radius, SEXP color1, SEXP color2);
SEXP DrawCircleV_R(SEXP center, SEXP radius, SEXP color);
SEXP DrawCircleLines_R(SEXP center_x, SEXP center_y, SEXP radius, SEXP color);
SEXP DrawEllipse_R(SEXP center_x, SEXP center_y, SEXP radius_h, SEXP radius_v, SEXP color);
SEXP DrawEllipseLines_R(SEXP center_x, SEXP center_y, SEXP radius_h, SEXP radius_v, SEXP color);
SEXP DrawRing_R(SEXP center, SEXP inner_radius, SEXP outer_radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color);
SEXP DrawRingLines_R(SEXP center, SEXP inner_radius, SEXP outer_radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color);
SEXP DrawRectangle_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color);
SEXP DrawRectangleV_R(SEXP position, SEXP size, SEXP color);
SEXP DrawRectangleRec_R(SEXP rec, SEXP color);
SEXP DrawRectanglePro_R(SEXP rec, SEXP origin, SEXP rotation, SEXP color);
SEXP DrawRectangleGradientV_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color1, SEXP color2);
SEXP DrawRectangleGradientH_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color1, SEXP color2);
SEXP DrawRectangleGradientEx_R(SEXP rec, SEXP col1, SEXP col2, SEXP col3, SEXP col4);
SEXP DrawRectangleLines_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color);
SEXP DrawRectangleLinesEx_R(SEXP rec, SEXP line_thick, SEXP color);
SEXP DrawRectangleRounded_R(SEXP rec, SEXP roundness, SEXP segments, SEXP color);
SEXP DrawRectangleRoundedLines_R(SEXP rec, SEXP roundness, SEXP segments, SEXP line_thick, SEXP color);
SEXP DrawTriangle_R(SEXP v1, SEXP v2, SEXP v3, SEXP color);
SEXP DrawTriangleLines_R(SEXP v1, SEXP v2, SEXP v3, SEXP color);
SEXP DrawTriangleFan_R(SEXP points, SEXP point_count, SEXP color);
SEXP DrawTriangleStrip_R(SEXP points, SEXP point_count, SEXP color);
SEXP DrawPoly_R(SEXP center, SEXP sides, SEXP radius, SEXP rotation, SEXP color);
SEXP DrawPolyLines_R(SEXP center, SEXP sides, SEXP radius, SEXP rotation, SEXP color);
SEXP DrawPolyLinesEx_R(SEXP center, SEXP sides, SEXP radius, SEXP rotation, SEXP line_thick, SEXP color);
SEXP CheckCollisionRecs_R(SEXP rec1, SEXP rec2);
SEXP CheckCollisionCircles_R(SEXP center1, SEXP radius1, SEXP center2, SEXP radius2);
SEXP CheckCollisionCircleRec_R(SEXP center, SEXP radius, SEXP rec);
SEXP CheckCollisionPointRec_R(SEXP point, SEXP rec);
SEXP CheckCollisionPointCircle_R(SEXP point, SEXP center, SEXP radius);
SEXP CheckCollisionPointTriangle_R(SEXP point, SEXP p1, SEXP p2, SEXP p3);
SEXP CheckCollisionLines_R(SEXP start_pos1, SEXP end_pos1, SEXP start_pos2, SEXP end_pos2);
SEXP CheckCollisionPointLine_R(SEXP point, SEXP p1, SEXP p2, SEXP threshold);
SEXP GetCollisionRec_R(SEXP rec1, SEXP rec2);

#endif
