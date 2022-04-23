##--------------------------------##
## Basic shapes drawing functions
##--------------------------------##

#' @family Basic shapes drawing functions
#' @description
#' NOTE: It can be useful when using basic shapes and one single font,
#' defining a font char white rectangle would allow drawing everything
#' in a single draw call
#' @title Set texture and rectangle to be used on shapes drawing
#' @param texture Texture2D object. Integer vector of with 5 elements:
#' id, width, height, mipmaps, format
#' @param rectangle_source Rectangle object, Double vector with 4 elements:
#' x, y, width, height
#'
#' @export
set_shapes_texture <- function(texture, rectangle_source) {
        .Call(.C_SetShapesTexture_R, texture, rectangle_source)
        invisible()
}


#' @family Basic shapes drawing functions
#' @title Draw a pixel
#' @param posX Integer. X position.
#' @param posY Integer. Y position.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_pixel <- function(posX, posY, color) {
        .Call(.C_DrawPixel_R, posX, posY, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a pixel (Vector version)
#' @param vector2_position Vector2 object. Integer vector with 2 elements:
#' x, y
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_pixel_v <- function(vector2_position, color) {
        .Call(.C_DrawPixelV_R, vector2_position, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line
#' @param start_pos_x X position of start of the line.
#' @param start_pos_y Y position of start of the line.
#' @param end_pos_x X position of the end of the line.
#' @param end_pos_y Y position of the end of the line.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line <- function(start_pos_x, start_pos_y, end_pos_x, end_pos_y, color) {
        .Call(.C_DrawLine_R, start_pos_x, start_pos_y, end_pos_x, end_pos_y, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line (Vector version)
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line_v <- function(start_pos, end_pos, color) {
        .Call(.C_DrawLineV_R, start_pos, end_pos, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line defining thickness
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line_ex <- function(start_pos, end_pos, thick, color) {
        .Call(.C_DrawLineEx_R, start_pos, end_pos, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a line using cubic-bezier curves in-out
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line_bezier <- function(start_pos, end_pos, thick, color) {
        .Call(.C_DrawLineBezier_R, start_pos, end_pos, thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw line using quadratic bezier curves with a control point
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param control_pos Vector2. Control points.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line_bezier_quad <- function(start_pos, end_pos, control_pos, thick, color) {
        .Call(.C_DrawLineBezierQuad_R, start_pos, end_pos, control_pos, thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw line using cubic bezier curves with 2 control points
#' @param start_pos Vector2. Start position.
#' @param end_pos Vector2. End position.
#' @param control_pos Vector2. Control points.
#' @param thick Float value defining thickness.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line_bezier_cubic <- function(start_pos, end_pos, control_pos, thick, color) {
        .Call(.C_DrawLineBezierCubic_R, start_pos, end_pos, control_pos, thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw lines sequence
#' @param points List with Vector2 elements.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_line_strip <- function(points, color) {
        .Call(.C_DrawLineStrip_R, points, length(points), color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled circle
#' @param center_x Integer. Circle center x position.
#' @param center_y Integer. Circle center y position.
#' @param radius Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_circle <- function(center_x, center_y, radius, color) {
        .Call(.C_DrawCircle_R, center_x, center_y, radius, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a piece of a circle
#' @param center Vector2. Circle center position.
#' @param radius Float.
#' @param start_angle Float.
#' @param end_angle Float.
#' @param segments Integer.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_circle_sector <- function(center, radius, start_angle, end_angle, segments, color) {
        .Call(.C_DrawCircleSector_R, center, radius, start_angle, end_angle, segments, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw circle sector outline
#' @param center Vector2. Circle center position.
#' @param radius Float.
#' @param start_angle Float.
#' @param end_angle Float.
#' @param segments Integer.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_circle_sector_lines <- function(center, radius, start_angle, end_angle, segments, color) {
        .Call(.C_DrawCircleSectorLines_R, center, radius, start_angle, end_angle, segments, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a gradient-filled circle
#' @param center_x Integer. Circle center x position.
#' @param center_y Integer. Circle center y position.
#' @param radius Float.
#' @param color1  Color object. Integer vector with RGBA values between 0 and 255.
#' @param color2  Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_circle_gradient <- function(center_x, center_y, radius, color1, color2) {
        .Call(.C_DrawCircleGradient_R, center_x, center_y, radius, color1, color2)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled circle (Vector version)
#' @param center Vector2. Center position of the filled circle.
#' @param radius Float. Radius of the circle.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_circle_v <- function(center, radius, color) {
        .Call(.C_DrawCircleV_R, center, radius, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw circle outline
#' @param center_x Integer. Circle center x position.
#' @param center_y Integer. Circle center y position.
#' @param radius Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_circle_lines <- function(center_x, center_y, radius, color) {
        .Call(.C_DrawCircleLines_R, center_x, center_y, radius, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw ellipse
#' @param center_x Integer. Circle center x position.
#' @param center_y Integer. Circle center y position.
#' @param radius_h Float. Horizontal radius.
#' @param radius_v Float. Vertical radius.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_ellipse <- function(center_x, center_y, radius_h, radius_v, color) {
        .Call(.C_DrawEllipse_R, center_x, center_y, radius_h, radius_v, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw ellipse outline
#' @param center_x Integer. Circle center x position.
#' @param center_y Integer. Circle center y position.
#' @param radius_h Float. Horizontal radius.
#' @param radius_v Float. Vertical radius.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_ellipse_lines <- function(center_x, center_y, radius_h, radius_v, color) {
        .Call(.C_DrawEllipseLines_R, center_x, center_y, radius_h, radius_v, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw ring
#' @param center Vector2. Position of the ring center.
#' @param inner_radius Float.
#' @param outer_radius Float.
#' @param start_angle Float.
#' @param end_angle Float.
#' @param segments Integer.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_ring <- function(center, inner_radius, outer_radius, start_angle, end_angle, segments, color) {
        .Call(.C_DrawRing_R, center, inner_radius, outer_radius, start_angle, end_angle, segments, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw ring outline
#' @param center Vector2. Position of the ring center.
#' @param inner_radius Float.
#' @param outer_radius Float.
#' @param start_angle Float.
#' @param end_angle Float.
#' @param segments Integer.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_ring_lines <- function(center, inner_radius, outer_radius, start_angle, end_angle, segments, color) {
        .Call(.C_DrawRingLines_R, center, inner_radius, outer_radius, start_angle, end_angle, segments, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled rectangle
#' @param pos_x Integer. X position of the rectangle.
#' @param pos_y Integer. Y position of the rectangle.
#' @param width Integer. Rectangle width.
#' @param height Integer. Rectangle height.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle <- function(pos_x, pos_y, width, height, color) {
        .Call(.C_DrawRectangle_R, pos_x, pos_y, width, height, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled rectangle (Vector version)
#' @param position Vector2. Position of the rectangle.
#' @param size Vector2. Size of the rectangle (width, height)
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_v <- function(position, size, color) {
        .Call(.C_DrawRectangleV_R, position, size, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled rectangle
#' @param rec Rectangle object. Defines position and size.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_rec <- function(rec, color) {
        .Call(.C_DrawRectangleRec_R, rec, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled rectangle with pro parameters
#' @param rec Rectangle object. Defines position and size.
#' @param origin Vector2.
#' @param rotation Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_pro <- function(rec, origin, rotation, color) {
        .Call(.C_DrawRectanglePro_R, rec, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a vertical-gradient-filled rectangle
#' @param pos_x Integer. X position of the rectangle.
#' @param pos_y Integer. Y position of the rectangle.
#' @param width Integer. Rectangle width.
#' @param height Integer. Rectangle height.
#' @param color1 Color object. Integer vector with RGBA values between 0 and 255.
#' @param color2 Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_gradient_v <- function(pos_x, pos_y, width, height, color1, color2) {
        .Call(.C_DrawRectangleGradientV_R, pos_x, pos_y, width, height, color1, color2)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a horizontal-gradient-filled rectangle
#' @param pos_x Integer. X position of the rectangle.
#' @param pos_y Integer. Y position of the rectangle.
#' @param width Integer. Rectangle width.
#' @param height Integer. Rectangle height.
#' @param color1 Color object. Integer vector with RGBA values between 0 and 255.
#' @param color2 Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_gradient_h <- function(pos_x, pos_y, width, height, color1, color2) {
        .Call(.C_DrawRectangleGradientH_R, pos_x, pos_y, width, height, color1, color2)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a gradient-filled rectangle with custom vertex colors
#' @param rec Rectangle object. Defines position and size.
#' @param col1 Color object. Integer vector with RGBA values between 0 and 255.
#' @param col2 Color object. Integer vector with RGBA values between 0 and 255.
#' @param col3 Color object. Integer vector with RGBA values between 0 and 255.
#' @param col4 Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_gradient_ex <- function(rec, col1, col2, col3, col4) {
        .Call(.C_DrawRectangleGradientEx_R, rec, col1, col2, col3, col4)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw rectangle outline
#' @param pos_x Integer. X position of the rectangle.
#' @param pos_y Integer. Y position of the rectangle.
#' @param width Integer. Rectangle width.
#' @param height Integer. Rectangle height.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_lines <- function(pos_x, pos_y, width, height, color) {
        .Call(.C_DrawRectangleLines_R, pos_x, pos_y, width, height, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw rectangle outline with extended parameters
#' @param rec Rectangle object. Defines position and size.
#' @param line_thick Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_lines_ex <- function(rec, line_thick, color) {
        .Call(.C_DrawRectangleLinesEx_R, rec, line_thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw rectangle with rounded edges
#' @param rec Rectangle object. Defines position and size.
#' @param roundness Float.
#' @param segments Integer.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_rounded <- function(rec, roundness, segments, color) {
        .Call(.C_DrawRectangleRounded_R, rec, roundness, segments, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw rectangle with rounded edges outline
#' @param rec Rectangle object. Defines position and size.
#' @param roundness Float.
#' @param segments Integer.
#' @param line_thick Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_rectangle_rounded_lines <- function(rec, roundness, segments, line_thick, color) {
        .Call(.C_DrawRectangleRoundedLines_R, rec, roundness, segments, line_thick, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a color-filled triangle
#'
#' Vertex in counter-clockwise order
#' @param v1 Vector2.
#' @param v2 Vector2.
#' @param v3 Vector2.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_triangle <- function(v1, v2, v3, color) {
        .Call(.C_DrawTriangle_R, v1, v2, v3, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a triangle outline
#'
#' Vertex in counter-clockwise order
#' @param v1 Vector2.
#' @param v2 Vector2.
#' @param v3 Vector2.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_triangle_lines <- function(v1, v2, v3, color) {
        .Call(.C_DrawTriangleLines_R, v1, v2, v3, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a triangle fan defined by points
#'
#' First vertex is the center
#' @param points List of Vector2 objects. Points that define the fan.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_triangle_fan <- function(points, color) {
        .Call(.C_DrawTriangleFan_R, points, length(points), color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a triangle strip defined by points
#' @param points List of Vector2 objects. Points that define the strip.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_triangle_strip <- function(points, color) {
        .Call(.C_DrawTriangleStrip_R, points, length(points), color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a regular polygon (Vector version)
#' @param center Vector2. Center position of the polygon.
#' @param sides Integer. Number of polygon sides.
#' @param radius Float. Polygon radius.
#' @param rotation Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_poly <- function(center, sides, radius, rotation, color) {
        .Call(.C_DrawPoly_R, center, sides, radius, rotation, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a polygon outline of n sides
#' @param center Vector2. Center position of the polygon.
#' @param sides Integer. Number of polygon sides.
#' @param radius Float. Polygon radius.
#' @param rotation Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_poly_lines <- function(center, sides, radius, rotation, color) {
        .Call(.C_DrawPolyLines_R, center, sides, radius, rotation, color)
        invisible()
}

#' @family Basic shapes drawing functions
#' @title Draw a polygon outline of n sides
#' @param center Vector2. Center position of the polygon.
#' @param sides Integer. Number of polygon sides.
#' @param radius Float. Polygon radius.
#' @param rotation Float.
#' @param line_thick Float.
#' @param color Color object. Integer vector with RGBA values between 0 and 255.
#'
#' @export
draw_poly_lines <- function(center, sides, radius, rotation, line_thick, color) {
        .Call(.C_DrawPolyLines_R, center, sides, radius, rotation, line_thick, color)
        invisible()
}

##-------------------------------------------##
## Basic shapes collision detection functions
##-------------------------------------------##

#' @family Basic shapes collision detection functions
#' @title Check collision between two rectangles
#' @param rec1 Rectangle.
#' @param rec2 Rectangle.
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_recs <- function(rec1, rec2) {
        .Call(.C_CheckCollisionRecs_R, rec1, rec2)
}

#' @family Basic shapes collision detection functions
#' @title Check collision between two circles
#' @param center1 Vector2. Center of the first circle.
#' @param radius1 Vector2. Radius of the first circle.
#' @param center2 Vector2. Center of the second circle.
#' @param radius2 Vector2. Radius of the second circle.
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_circles <- function(center1, radius1, center2, radius2) {
        .Call(.C_CheckCollisionCircles_R, center1, radius1, center2, radius2)
}

#' @family Basic shapes collision detection functions
#' @title Check collision between circle and rectangle
#' @param center Vector2. Center of the circle.
#' @param radius Vector2. Radius of the circle.
#' @param rec Rectangle.
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_circle_rec <- function(center, radius, rec) {
        .Call(.C_CheckCollisionCircleRec_R, center, radius, rec)
}

#' @family Basic shapes collision detection functions
#' @title Check if point is inside rectangle
#' @param point Vector2. Point position.
#' @param rec Rectangle.
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_point_rec <- function(point, rec) {
        .Call(.C_CheckCollisionPointRec_R, point, rec)
}

#' @family Basic shapes collision detection functions
#' @title Check if point is inside circle
#' @param point Vector2. Point position.
#' @param center Vector2. Center of the circle.
#' @param radius Vector2. Radius of the circle.
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_point_circle <- function(point, center, radius) {
        .Call(.C_CheckCollisionPointCircle_R, point, center, radius)
}

#' @family Basic shapes collision detection functions
#' @title Check if point is inside a triangle
#' @param point Vector2. Point position.
#' @param p1 Vector2.
#' @param p2 Vector2.
#' @param p3 Vector2.
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_point_triangle <- function(point, p1, p2, p3) {
        .Call(.C_CheckCollisionPointTriangle_R, point, p1, p2, p3)
}

#' @family Basic shapes collision detection functions
#' @title Check the collision between two lines defined by two points each
#' @param start_pos1 Vector2. Start position of line one.
#' @param end_pos1 Vector2. End position of line two.
#' @param start_pos2 Vector2. Start position of line one.
#' @param end_pos2 Vector2. End position of line two.
#' @return List with 2 elements
#' 1. Logical Vector. TRUE if there is collision
#' 2. Vector2. Defines the point of collision.
#'
#' @export
check_collision_lines <- function(start_pos1, end_pos1, start_pos2, end_pos2) {
        Vector2(.Call(.C_CheckCollisionLines_R, start_pos1, end_pos1, start_pos2, end_pos2))
}


#' @family Basic shapes collision detection functions
#' @title Check if point belongs to line created between two points
#'
#' Check if point belongs to line created between two points `p1` and `p2`
#' with defined margin in pixels `threshold`
#' @param point Vector2. Point position.
#' @param p1 Vector2. One end of the line.
#' @param p2 Vector2. Other end of the line.
#' @param threshold Integer. Margin in pixels
#' @return Logical vector. TRUE if there is a collision.
#'
#' @export
check_collision_point_line <- function(point, p1, p2, threshold) {
        .Call(.C_CheckCollisionPointLine_R, point, p1, p2, threshold)
}

#' @family Basic shapes collision detection functions
#' @title Get collision rectangle for two rectangles collision
#' @param rec1 Rectangle.
#' @param rec2 Rectangle.
#' @return Rectangle object. The collision rectangle for two rectangles.
#'
#' @export
get_collision_rec <- function(rec1, rec2) {
        Rectangle(.Call(.C_GetCollisionRec_R, rec1, rec2))
}
