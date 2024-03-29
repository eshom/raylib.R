% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shapes.R, R/titlecase_autogen.R
\name{check_collision_circles}
\alias{check_collision_circles}
\alias{CheckCollisionCircles}
\title{Check collision between two circles}
\usage{
check_collision_circles(center1, radius1, center2, radius2)

CheckCollisionCircles(center1, radius1, center2, radius2)
}
\arguments{
\item{center1}{Vector2. Center of the first circle.}

\item{radius1}{Vector2. Radius of the first circle.}

\item{center2}{Vector2. Center of the second circle.}

\item{radius2}{Vector2. Radius of the second circle.}
}
\value{
Logical vector. TRUE if there is a collision.
}
\description{
Check collision between two circles
}
\seealso{
Other Basic shapes collision detection functions: 
\code{\link{check_collision_circle_rec}()},
\code{\link{check_collision_lines}()},
\code{\link{check_collision_point_circle}()},
\code{\link{check_collision_point_line}()},
\code{\link{check_collision_point_rec}()},
\code{\link{check_collision_point_triangle}()},
\code{\link{check_collision_recs}()},
\code{\link{get_collision_rec}()}
}
\concept{Basic shapes collision detection functions}
