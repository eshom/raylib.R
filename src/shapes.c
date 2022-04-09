#define R_NO_REMAP
#include "shapes.h"
#include "utils.h"
#include <R.h>
#include <Rinternals.h>
#include <raylib.h>

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
/* RLAPI void DrawCircle(int centerX, int centerY, float radius, Color color);                              // Draw a color-filled circle */
/* RLAPI void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);      // Draw a piece of a circle */
/* RLAPI void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color); // Draw circle sector outline */
/* RLAPI void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);       // Draw a gradient-filled circle */

// Draw a color-filled circle (Vector version)
SEXP DrawCircleV_R(SEXP center, SEXP radius, SEXP color)
{
        Vector2 center_vec = vector2_from_sexp(center);
        float rad = (float)Rf_asReal(radius);
        Color col = color_from_sexp(color);

        DrawCircleV(center_vec, rad, col);

        return R_NilValue;
}
/* RLAPI void DrawCircleV(Vector2 center, float radius, Color color);                                       // Draw a color-filled circle (Vector version) */
/* RLAPI void DrawCircleLines(int centerX, int centerY, float radius, Color color);                         // Draw circle outline */
/* RLAPI void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);             // Draw ellipse */
/* RLAPI void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);        // Draw ellipse outline */
/* RLAPI void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color); // Draw ring */
/* RLAPI void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);    // Draw ring outline */
/* RLAPI void DrawRectangle(int posX, int posY, int width, int height, Color color);                        // Draw a color-filled rectangle */
/* RLAPI void DrawRectangleV(Vector2 position, Vector2 size, Color color);                                  // Draw a color-filled rectangle (Vector version) */
/* RLAPI void DrawRectangleRec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle */
/* RLAPI void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters */
/* RLAPI void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);// Draw a vertical-gradient-filled rectangle */
/* RLAPI void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);// Draw a horizontal-gradient-filled rectangle */
/* RLAPI void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);       // Draw a gradient-filled rectangle with custom vertex colors */
/* RLAPI void DrawRectangleLines(int posX, int posY, int width, int height, Color color);                   // Draw rectangle outline */
/* RLAPI void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);                            // Draw rectangle outline with extended parameters */
/* RLAPI void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);              // Draw rectangle with rounded edges */
/* RLAPI void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color); // Draw rectangle with rounded edges outline */
/* RLAPI void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                // Draw a color-filled triangle (vertex in counter-clockwise order!) */
/* RLAPI void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline (vertex in counter-clockwise order!) */
/* RLAPI void DrawTriangleFan(Vector2 *points, int pointCount, Color color);                                // Draw a triangle fan defined by points (first vertex is the center) */
/* RLAPI void DrawTriangleStrip(Vector2 *points, int pointCount, Color color);                              // Draw a triangle strip defined by points */
/* RLAPI void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);               // Draw a regular polygon (Vector version) */
/* RLAPI void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides */
/* RLAPI void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color); // Draw a polygon outline of n sides with extended parameters */

// Basic shapes collision detection functions
/* RLAPI bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);                                           // Check collision between two rectangles */
/* RLAPI bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);        // Check collision between two circles */
/* RLAPI bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);                         // Check collision between circle and rectangle */
/* RLAPI bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle */
/* RLAPI bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);                       // Check if point is inside circle */
/* RLAPI bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle */
/* RLAPI bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference */
/* RLAPI bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);                // Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold] */
/* RLAPI Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);                                         // Get collision rectangle for two rectangles collision */
