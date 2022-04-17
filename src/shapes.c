#define R_NO_REMAP
#include "shapes.h"
#include "utils.h"
#include <R.h>
#include <Rinternals.h>
#include "raylib.h"

// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
SEXP SetShapesTexture_R(SEXP texture, SEXP rectangle_source)
{
        Texture2D t = texture_from_sexp(texture);
        Rectangle r = rectangle_from_sexp(rectangle_source);

        SetShapesTexture(t, r);

        return R_NilValue;
}

// Basic shapes drawing functions

// Draw a pixel
SEXP DrawPixel_R(SEXP posX, SEXP posY, SEXP color)
{
        Color col = color_from_sexp(color);

        DrawPixel(Rf_asInteger(posX), Rf_asInteger(posY), col);

        return R_NilValue;
}

// Draw a pixel (Vector version)
SEXP DrawPixelV_R(SEXP vector2_position, SEXP color)
{
        Color col = color_from_sexp(color);
        Vector2 pos = vector2_from_sexp(vector2_position);

        DrawPixelV(pos, col);

        return R_NilValue;
}

// Draw a line
SEXP DrawLine_R(SEXP position, SEXP color)
{
        Color col = color_from_sexp(color);

        int *position_p = INTEGER(Rf_coerceVector(position, INTSXP));

        int startx = position_p[0];
        int starty = position_p[1];
        int endx = position_p[2];
        int endy = position_p[3];

        DrawLine(startx, starty, endx, endy, col);

        return R_NilValue;
}

// Draw a line (Vector version)
SEXP DrawLineV_R(SEXP start_pos, SEXP end_pos, SEXP color)
{
        Vector2 start_pos_vec2 = vector2_from_sexp(start_pos);
        Vector2 end_pos_vec2 = vector2_from_sexp(end_pos);
        Color col = color_from_sexp(color);

        DrawLineV(start_pos_vec2, end_pos_vec2, col);

        return R_NilValue;
}

// Draw a line defining thickness
SEXP DrawLineEx_R(SEXP start_pos, SEXP end_pos, SEXP thick, SEXP color)
{
        Vector2 start_pos_vec2 = vector2_from_sexp(start_pos);
        Vector2 end_pos_vec2 = vector2_from_sexp(end_pos);
        float thk = (float)Rf_asReal(thick);
        Color col = color_from_sexp(color);

        DrawLineEx(start_pos_vec2, end_pos_vec2, thk, col);

        return R_NilValue;
}

// Draw a line using cubic-bezier curves in-out
SEXP DrawLineBezier_R(SEXP start_pos, SEXP end_pos, SEXP thick, SEXP color)
{
        Vector2 start_pos_vec2 = vector2_from_sexp(start_pos);
        Vector2 end_pos_vec2 = vector2_from_sexp(end_pos);
        float thk = (float)Rf_asReal(thick);
        Color col = color_from_sexp(color);

        DrawLineBezier(start_pos_vec2, end_pos_vec2, thk, col);

        return R_NilValue;
}

// Draw line using quadratic bezier curves with a control point
SEXP DrawLineBezierQuad_R(SEXP start_pos, SEXP end_pos, SEXP control_pos, SEXP thick, SEXP color)
{
        Vector2 start_pos_vec2 = vector2_from_sexp(start_pos);
        Vector2 end_pos_vec2 = vector2_from_sexp(end_pos);
        Vector2 control_pos_vec2 = vector2_from_sexp(control_pos);
        float thk = (float)Rf_asReal(thick);
        Color col = color_from_sexp(color);

        DrawLineBezierQuad(start_pos_vec2, end_pos_vec2, control_pos_vec2, thk, col);

        return R_NilValue;
}

// Draw line using cubic bezier curves with 2 control points
SEXP DrawLineBezierCubic_R(SEXP start_pos, SEXP end_pos, SEXP start_control_pos, SEXP end_control_pos, SEXP thick, SEXP color)
{
        Vector2 start_pos_vec2 = vector2_from_sexp(start_pos);
        Vector2 end_pos_vec2 = vector2_from_sexp(end_pos);
        Vector2 start_control_pos_vec2 = vector2_from_sexp(start_control_pos);
        Vector2 end_control_pos_vec2 = vector2_from_sexp(end_control_pos);
        float thk = (float)Rf_asReal(thick);
        Color col = color_from_sexp(color);

        DrawLineBezierCubic(start_pos_vec2, end_pos_vec2, start_control_pos_vec2, end_control_pos_vec2, thk, col);

        return R_NilValue;
}

// Draw lines sequence
SEXP DrawLineStrip_R(SEXP points, SEXP point_count, SEXP color)
{
        Vector2 *vec2_arr = vector2_array_from_sexp(points);
        int pc = Rf_asInteger(point_count);
        Color col = color_from_sexp(color);

        DrawLineStrip(vec2_arr, pc, col);
        R_Free(vec2_arr);

        return R_NilValue;
}

// Draw a color-filled circle
SEXP DrawCircle_R(SEXP center_x, SEXP center_y, SEXP radius, SEXP color)
{
        DrawCircle(Rf_asInteger(center_x), Rf_asInteger(center_y),
                   (float)Rf_asReal(radius), color_from_sexp(color));

        return R_NilValue;
}

// Draw a piece of a circle
SEXP DrawCircleSector_R(SEXP center, SEXP radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color)
{
        DrawCircleSector(vector2_from_sexp(center), (float)Rf_asReal(radius), (float)Rf_asReal(start_angle),
                         (float)Rf_asReal(end_angle), Rf_asInteger(segments), color_from_sexp(color));

        return R_NilValue;
}

// Draw circle sector outline
SEXP DrawCircleSectorLines_R(SEXP center, SEXP radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color)
{
        DrawCircleSectorLines(vector2_from_sexp(center), (float)Rf_asReal(radius),
                              (float)Rf_asReal(start_angle), (float)Rf_asReal(end_angle),
                              Rf_asInteger(segments), color_from_sexp(color));

        return R_NilValue;
}

//Draw a gradient-filled circle
SEXP DrawCircleGradient_R(SEXP center_x, SEXP center_y, SEXP radius, SEXP color1, SEXP color2)
{
        DrawCircleGradient(Rf_asInteger(center_x), Rf_asInteger(center_y),
                           (float)Rf_asReal(radius), color_from_sexp(color1),
                           color_from_sexp(color2));

        return R_NilValue;
}

// Draw a color-filled circle (Vector version)
SEXP DrawCircleV_R(SEXP center, SEXP radius, SEXP color)
{
        Vector2 center_vec = vector2_from_sexp(center);
        float rad = (float)Rf_asReal(radius);
        Color col = color_from_sexp(color);

        DrawCircleV(center_vec, rad, col);

        return R_NilValue;
}

// Draw circle outline
SEXP DrawCircleLines_R(SEXP center_x, SEXP center_y, SEXP radius, SEXP color)
{
        DrawCircleLines(Rf_asInteger(center_x), Rf_asInteger(center_y),
                        (float)Rf_asReal(radius), color_from_sexp(color));

        return R_NilValue;
}

//Draw ellipse
SEXP DrawEllipse_R(SEXP center_x, SEXP center_y, SEXP radius_h, SEXP radius_v, SEXP color)
{
        DrawEllipse(Rf_asInteger(center_x), Rf_asInteger(center_y),
                    (float)Rf_asReal(radius_h), (float)Rf_asReal(radius_v),
                    color_from_sexp(color));

        return R_NilValue;
}

//Draw ellipse outline
SEXP DrawEllipseLines_R(SEXP center_x, SEXP center_y, SEXP radius_h, SEXP radius_v, SEXP color)
{
        DrawEllipseLines(Rf_asInteger(center_x), Rf_asInteger(center_y),
                         (float)Rf_asReal(radius_h), (float)Rf_asReal(radius_v),
                         color_from_sexp(color));

        return R_NilValue;
}

// Draw ring
SEXP DrawRing_R(SEXP center, SEXP inner_radius, SEXP outer_radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color)
{
        DrawRing(vector2_from_sexp(center), (float)Rf_asReal(inner_radius),
                 (float)Rf_asReal(outer_radius), (float)Rf_asReal(start_angle),
                 (float)Rf_asReal(end_angle), Rf_asInteger(segments),
                 color_from_sexp(color));

        return R_NilValue;
}

// Draw ring outline
SEXP DrawRingLines_R(SEXP center, SEXP inner_radius, SEXP outer_radius, SEXP start_angle, SEXP end_angle, SEXP segments, SEXP color)
{
        DrawRingLines(vector2_from_sexp(center), (float)Rf_asReal(inner_radius),
                      (float)Rf_asReal(outer_radius), (float)Rf_asReal(start_angle),
                      (float)Rf_asReal(end_angle), Rf_asInteger(segments),
                      color_from_sexp(color));

        return R_NilValue;
}

// Draw a color-filled rectangle
SEXP DrawRectangle_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color)
{
        DrawRectangle(Rf_asInteger(pos_x), Rf_asInteger(pos_y), Rf_asInteger(width),
                      Rf_asInteger(height), color_from_sexp(color));

        return R_NilValue;
}

// Draw a color-filled rectangle (Vector version)
SEXP DrawRectangleV_R(SEXP position, SEXP size, SEXP color)
{
        DrawRectangleV(vector2_from_sexp(position), vector2_from_sexp(size), color_from_sexp(color));

        return R_NilValue;
}

// Draw a color-filled rectangle
SEXP DrawRectangleRec_R(SEXP rec, SEXP color)
{
        DrawRectangleRec(rectangle_from_sexp(rec), color_from_sexp(color));

        return R_NilValue;
}

// Draw a color-filled rectangle with pro parameters
SEXP DrawRectanglePro_R(SEXP rec, SEXP origin, SEXP rotation, SEXP color)
{
        DrawRectanglePro(rectangle_from_sexp(rec), vector2_from_sexp(origin),
                         (float)Rf_asReal(rotation), color_from_sexp(color));

        return R_NilValue;
}

// Draw a vertical-gradient-filled rectangle
SEXP DrawRectangleGradientV_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color1, SEXP color2)
{
        DrawRectangleGradientV(Rf_asInteger(pos_x), Rf_asInteger(pos_y), Rf_asInteger(width),
                               Rf_asInteger(height), color_from_sexp(color1), color_from_sexp(color2));

        return R_NilValue;
}

// Draw a horizontal-gradient-filled rectangle
SEXP DrawRectangleGradientH_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color1, SEXP color2)
{
        DrawRectangleGradientH(Rf_asInteger(pos_x), Rf_asInteger(pos_y), Rf_asInteger(width),
                               Rf_asInteger(height), color_from_sexp(color1), color_from_sexp(color2));

        return R_NilValue;
}

// Draw a gradient-filled rectangle with custom vertex colors
SEXP DrawRectangleGradientEx_R(SEXP rec, SEXP col1, SEXP col2, SEXP col3, SEXP col4)
{
        DrawRectangleGradientEx(rectangle_from_sexp(rec), color_from_sexp(col1),
                                color_from_sexp(col2), color_from_sexp(col3),
                                color_from_sexp(col4));

        return R_NilValue;
}

// Draw rectangle outline
SEXP DrawRectangleLines_R(SEXP pos_x, SEXP pos_y, SEXP width, SEXP height, SEXP color)
{
        DrawRectangleLines(Rf_asInteger(pos_x), Rf_asInteger(pos_y), Rf_asInteger(width),
                           Rf_asInteger(height), color_from_sexp(color));

        return R_NilValue;
}

// Draw rectangle outline with extended parameters
SEXP DrawRectangleLinesEx_R(SEXP rec, SEXP line_thick, SEXP color)
{
        DrawRectangleLinesEx(rectangle_from_sexp(rec), (float)Rf_asReal(line_thick), color_from_sexp(color));

        return R_NilValue;
}

// Draw rectangle with rounded edges
SEXP DrawRectangleRounded_R(SEXP rec, SEXP roundness, SEXP segments, SEXP color)
{
        DrawRectangleRounded(rectangle_from_sexp(rec), (float)Rf_asReal(roundness),
                             Rf_asInteger(segments), color_from_sexp(color));

        return R_NilValue;
}

// Draw rectangle with rounded edges outline
SEXP DrawRectangleRoundedLines_R(SEXP rec, SEXP roundness, SEXP segments, SEXP line_thick, SEXP color)
{
        DrawRectangleRoundedLines(rectangle_from_sexp(rec), (float)Rf_asReal(roundness),
                                  Rf_asInteger(segments), (float)Rf_asReal(line_thick),
                                  color_from_sexp(color));

        return R_NilValue;
}

// Draw a color-filled triangle (vertex in counter-clockwise order!)
SEXP DrawTriangle_R(SEXP v1, SEXP v2, SEXP v3, SEXP color)
{
        DrawTriangle(vector2_from_sexp(v1), vector2_from_sexp(v2), vector2_from_sexp(v3),
                     color_from_sexp(color));

        return R_NilValue;
}

// Draw a color-filled triangle outline (vertex in counter-clockwise order!)
SEXP DrawTriangleLines_R(SEXP v1, SEXP v2, SEXP v3, SEXP color)
{
        DrawTriangleLines(vector2_from_sexp(v1), vector2_from_sexp(v2), vector2_from_sexp(v3),
                          color_from_sexp(color));

        return R_NilValue;
}

// Draw a triangle fan defined by points (first vertex is the center)
SEXP DrawTriangleFan_R(SEXP points, SEXP point_count, SEXP color)
{
        DrawTriangleFan(vector2_array_from_sexp(points), Rf_asInteger(point_count),
                        color_from_sexp(color));

        return R_NilValue;
}

// Draw a triangle strip defined by points
SEXP DrawTriangleStrip_R(SEXP points, SEXP point_count, SEXP color)
{
        DrawTriangleStrip(vector2_array_from_sexp(points), Rf_asInteger(point_count),
                          color_from_sexp(color));

        return R_NilValue;
}

// Draw a regular polygon (Vector version)
SEXP DrawPoly_R(SEXP center, SEXP sides, SEXP radius, SEXP rotation, SEXP color)
{
        DrawPoly(vector2_from_sexp(center), Rf_asInteger(sides), (float)Rf_asReal(radius),
                 (float)Rf_asReal(rotation), color_from_sexp(color));

        return R_NilValue;
}

// Draw a polygon outline of n sides
SEXP DrawPolyLines_R(SEXP center, SEXP sides, SEXP radius, SEXP rotation, SEXP color)
{
        DrawPolyLines(vector2_from_sexp(center), Rf_asInteger(sides), (float)Rf_asReal(radius),
                      (float)Rf_asReal(rotation), color_from_sexp(color));

        return R_NilValue;
}

// Draw a polygon outline of n sides with extended parameters
SEXP DrawPolyLinesEx_R(SEXP center, SEXP sides, SEXP radius, SEXP rotation, SEXP line_thick, SEXP color)
{
        DrawPolyLinesEx(vector2_from_sexp(center), Rf_asInteger(sides), (float)Rf_asReal(radius),
                        (float)Rf_asReal(rotation), (float)Rf_asReal(line_thick), color_from_sexp(color));

        return R_NilValue;
}

// Basic shapes collision detection functions

// Check collision between two rectangles
SEXP CheckCollisionRecs_R(SEXP rec1, SEXP rec2)
{
        return Rf_ScalarLogical(CheckCollisionRecs(rectangle_from_sexp(rec1), rectangle_from_sexp(rec2)));
}

// Check collision between two circles
SEXP CheckCollisionCircles_R(SEXP center1, SEXP radius1, SEXP center2, SEXP radius2)
{
        return Rf_ScalarLogical(CheckCollisionCircles(vector2_from_sexp(center1),
                                                      Rf_asReal(radius1),
                                                      vector2_from_sexp(center2),
                                                      Rf_asReal(radius2)));
}

// Check collision between circle and rectangle
SEXP CheckCollisionCircleRec_R(SEXP center, SEXP radius, SEXP rec)
{
        return Rf_ScalarLogical(CheckCollisionCircleRec(vector2_from_sexp(center),
                                                        Rf_asReal(radius),
                                                        rectangle_from_sexp(rec)));
}

// Check if point is inside rectangle
SEXP CheckCollisionPointRec_R(SEXP point, SEXP rec)
{
        return Rf_ScalarLogical(CheckCollisionPointRec(vector2_from_sexp(point), rectangle_from_sexp(rec)));
}

// Check if point is inside circle
SEXP CheckCollisionPointCircle_R(SEXP point, SEXP center, SEXP radius)
{
        return Rf_ScalarLogical(CheckCollisionPointCircle(vector2_from_sexp(point),
                                                          vector2_from_sexp(center),
                                                          (float)Rf_asReal(radius)));
}

// Check if point is inside a triangle
SEXP CheckCollisionPointTriangle_R(SEXP point, SEXP p1, SEXP p2, SEXP p3)
{
        return Rf_ScalarLogical(CheckCollisionPointTriangle(vector2_from_sexp(point),
                                                            vector2_from_sexp(p1),
                                                            vector2_from_sexp(p2),
                                                            vector2_from_sexp(p3)));
}

// Check the collision between two lines defined by two points each, returns collision point by reference
SEXP CheckCollisionLines_R(SEXP start_pos1, SEXP end_pos1, SEXP start_pos2, SEXP end_pos2)
{
        Vector2 collision_point = {0, 0};

        SEXP collision = Rf_ScalarLogical(CheckCollisionLines(vector2_from_sexp(start_pos1),
                                                              vector2_from_sexp(end_pos1),
                                                              vector2_from_sexp(start_pos2),
                                                              vector2_from_sexp(end_pos2),
                                                              &collision_point));

        const char *list_names[] = {"collision", "point", ""};
        SEXP list = PROTECT(Rf_mkNamed(VECSXP, list_names));

        SET_VECTOR_ELT(list, 0, collision);
        SET_VECTOR_ELT(list, 1, sexp_from_vector2(collision_point));

        UNPROTECT(2); // From Rf_mkNamed() + sexp_From_vector2()

        return list;
}

// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
SEXP CheckCollisionPointLine_R(SEXP point, SEXP p1, SEXP p2, SEXP threshold)
{
        return Rf_ScalarLogical(CheckCollisionPointLine(vector2_from_sexp(point),
                                                        vector2_from_sexp(p1),
                                                        vector2_from_sexp(p2),
                                                        Rf_asInteger(threshold)));
}

// Get collision rectangle for two rectangles collision
SEXP GetCollisionRec_R(SEXP rec1, SEXP rec2)
{
        SEXP out = sexp_from_rectangle(GetCollisionRec(rectangle_from_sexp(rec1), rectangle_from_sexp(rec2)));

        UNPROTECT(1);

        return out;
}
