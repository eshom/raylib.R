% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shapes.R, R/titlecase_autogen.R
\name{check_collision_circle_rec}
\alias{check_collision_circle_rec}
\alias{CheckCollisionCircleRec}
\title{Check collision between circle and rectangle}
\usage{
check_collision_circle_rec(center, radius, rec)

CheckCollisionCircleRec(center, radius, rec)
}
\arguments{
\item{center}{Vector2. Center of the circle.}

\item{radius}{Vector2. Radius of the circle.}

\item{rec}{Rectangle.}
}
\value{
Logical vector. TRUE if there is a collision.
}
\description{
Check collision between circle and rectangle
}
\seealso{
Other Basic shapes collision detection functions: 
\code{\link{check_collision_circles}()},
\code{\link{check_collision_lines}()},
\code{\link{check_collision_point_circle}()},
\code{\link{check_collision_point_line}()},
\code{\link{check_collision_point_rec}()},
\code{\link{check_collision_point_triangle}()},
\code{\link{check_collision_recs}()},
\code{\link{get_collision_rec}()}
}
\concept{Basic shapes collision detection functions}
