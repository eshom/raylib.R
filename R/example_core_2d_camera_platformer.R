######################
# Pre-initialization #
######################

library(raylib.R)
  
G <- 400
player_jump_spd <- 350
player_hor_spd <- 200

# 'player' object constructor
Player <- function(x, y, speed, can_jump) {
  list(position = Vector2(x, y),
       speed = speed,
       can_jump = can_jump)
}


# 'environment item' object constructor
EnvItem <- function(x, y, width, height, blocking, color, alpha = 255) {
  list(rect = Rectangle(x, y, width, height),
       blocking = blocking,
       color = Color(color, alpha))
}

# 'player update' function
update_player <- function(player, env_items, env_items_length, delta) {
  
  if (is_key_down(keyboard_key$KEY_LEFT)) 
    player$position["x"] <- player$position["x"] - player_hor_spd * delta
  
  if (is_key_down(keyboard_key$KEY_RIGHT)) 
    player$position["x"] <- player$position["x"] + player_hor_spd * delta
  
  if (is_key_down(keyboard_key$KEY_SPACE) && isTRUE(player$can_jump)) {
    player$speed <- player$speed - player_jump_spd
    player$can_jump <- FALSE
    
  }
  
  hit_obstacle <- FALSE
  
  collisions <- sapply(
    env_items, \(env_item) {
      env_item$blocking && 
        env_item$rect["x"] <= player$position["x"] &&
        (env_item$rect["x"] + env_item$rect["width"] >= player$position["x"]) &&
        env_item$rect["y"] >= player$position["y"] &&
        (env_item$rect["y"] < player$position["y"] + player$speed * delta)
  })
  
  coll_i <- which(collisions)
  
  if (sum(coll_i) > 0) {
    hit_obstacle <- TRUE
    player$speed <- 0
    player$position["y"] <- env_items[[coll_i]]$rect["y"]
  }
  
  if (!hit_obstacle) {
    player$position["y"] <- player$position["y"] + player$speed * delta
    player$speed <- player$speed + G * delta
    player$can_jump <- FALSE
    
  } else 
    player$can_jump <- TRUE
  
  return(player)
}

# camera update functions
update_camera_center <- function(
    camera, player, env_items, env_items_length, delta, width, height) {
  camera$offset <- Vector2(width/2, height/2)
  camera$target <- player$position
  
  return(camera)
}

update_camera_center_inside_map <- function(
    camera, player, env_items, env_items_length, delta, width, height) {
  camera$target <- player$position
  camera$offset <- Vector2(width/2, height/2)

  min_x <- min_y <- 1000
  max_x <- max_y <- -1000

  for (i in 1:env_items_length) {
    min_x <- min(env_items[[i]]$rect["x"], min_x)
    max_x <- max(env_items[[i]]$rect["x"] + env_items$rect["width"], max_x)
    min_y <- min(env_items[[i]]$rect["y"], min_y)
    max_y <- max(env_items[[i]]$rect["y"] + env_items$rect["height"], max_y)
    
    
    max = .Call(.C_GetWorldToScreen2D_R, Vector2(max_x, max_y), camera, PACKAGE = "raylib.R")
    min = .Call(.C_GetWorldToScreen2D_R, Vector2(min_x, min_y), camera, PACKAGE = "raylib.R")
    
    if (max["x"] < width) camera$offset["x"] <- width - (max["x"] - width/2)
    if (max["y"] < height) camera$offset["y"] <- heigh - (max["y"] - height/2)
    if (min["x"] > 0) camera$offset["x"] <- width/2 - min["x"]
    if (min["y"] > 0) camera$offset["y"] <- height/2 - min["y"]
    
  }

  return(camera)
  }

update_camera_center_smooth_follow <- function(
    camera, player, env_items, env_items_length, delta, width, height) {
  
  min_speed <- 30
  min_effect_length <- 10
  fraction_speed <- 0.8
  
  camera$offset <- Vector2(width/2, height/2)
  
  diff <- player$position - camera$target
  veclength <- sqrt(sum(sapply(diff, \(x) x^2)))
  
  if (veclength > min_effect_length) {
    speed <- max(fraction_speed * veclength, min_speed)
    camera$target <- camera$target + diff*(speed * delta / veclength)
  }
  return(camera)
}

update_camera_even_out_on_landing <- function(
    camera, player, env_items, env_items_length, delta, width, height) {
  
  even_out_speed <- 700
  
  camera$offset <- Vector2(width/2, height/2)
  camera$target["x"] <- player$position["x"]
  
  if (isTRUE(.update_camera_even_out_env[["evening_out"]])) {
  
    if (.update_camera_even_out_env[["even_out_target"]] > camera$target["y"]) {
      camera$target["y"] <- camera$target["y"] + even_out_speed * delta
      if (camera$target["y"] > .update_camera_even_out_env[["even_out_target"]]) {
        camera$target["y"] <- .update_camera_even_out_env[["even_out_target"]]
        .update_camera_even_out_env[["evening_out"]] <- FALSE
      }
    } else {
      camera$target["y"] <- camera$target["y"] - even_out_speed*delta
      if (camera$target["y"] < .update_camera_even_out_env[["even_out_target"]]) {
        camera$target["y"] <- .update_camera_even_out_env[["even_out_target"]]
        .update_camera_even_out_env[["evening_out"]] <- FALSE
      }
    }
  } else if (isTRUE(player$can_jump) && player$speed == 0 && player$position["y"] != camera$target["y"]) {
    .update_camera_even_out_env[["evening_out"]] <- TRUE
    .update_camera_even_out_env[["even_out_target"]] <- player$position["y"]
  }
  
  return(camera)
}

# environement needed for `update_even_out_on_landing` camera updater
.update_camera_even_out_env <- new.env()
.update_camera_even_out_env[["evening_out"]] <- FALSE
.update_camera_even_out_env[["even_out_target"]] <- NULL

# update_camera_player_bound_push <- function(
#     camera, player, env_items, env_items_length, delta, width, height) {
# 
#   bbox <- Vector2(0.2, 0.2)
#   
#   bbox_world_min <- .Call(.C_GetScreenToWorld2D_R, 
#                           Vector2((1 - bbox["x"]) * 0.5 * width, (1 - bbox["y"] * 0.5 * height)),
#                           camera)
#   bbox_world_max <- .Call(.C_GetScreenToWorld2D_R, 
#                           Vector2((1 + bbox["x"]) * 0.5 * width, (1 + bbox["y"] * 0.5 * height)),
#                           camera)
#   
#   camera$offset <- Vector2((1 - bbox["x"]) * 0.5 * width, (1 - bbox["y"]) * 0.5 * height)
#   
#   if (player$position["x"] < bbox_world_min["x"])
#     camera$target["x"] <- player$position["x"]
#   if (player$position["y"] < bbox_world_min["y"])
#     camera$target["y"] <- player$position["y"]
#   if (player$position["x"] > bbox_world_max["x"])
#     camera$target["x"] <- bbox_world_min["x"] + (player$position["x"] - bbox_world_min["x"])
#   if (player$position["y"] > bbox_world_max["y"])
#     camera$target["y"] <- bbox_world_min["y"] + (player$position["y"] - bbox_world_min["y"])
#   
#   return(camera)
#   
# }

##################
# Initialization #
##################

play_game <- function() {
  
  screen_width <- 800
  screen_height <- 450
  
  init_window(screen_width, screen_height, "raylib [core] example - 2d camera")
  
  player <- Player(x = 400, y = 280, speed = 0, can_jump = FALSE)
  
  env_items <- list(
    EnvItem(0, 0, 1000, 400, FALSE, raylib_color$LIGHTGRAY),
    EnvItem(0, 400, 1000, 200, TRUE, raylib_color$GRAY),
    EnvItem(300, 200, 400, 10, TRUE, raylib_color$GRAY),
    EnvItem(250, 300, 100, 10, TRUE, raylib_color$GRAY),
    EnvItem(650, 300, 100, 10, TRUE, raylib_color$GRAY)
  )
  
  env_items_length <- length(env_items)
  
  camera <- Camera2D(target = player$position,
                     offset = Vector2(screen_width/2, screen_height/2),
                     rotation = 0,
                     zoom = 1)
  
  # set up camera updaters
  camera_updaters <- list(
    update = list(
      descr = "Follow player center",
      func = update_camera_center
    ),
    # update_inside_map = list(
    #   descr = "Follow player center, but clamp to map edges",
    #   func = update_camera_center_inside_map
    # ),
    update_smooth_follow = list(
      descr = "Follow player center;\nsmoothed",
      func = update_camera_center_smooth_follow
    ),
    update_even_out_on_landing = list(
      descr = "Follow player center horizontally;\nupdate player center vertically after landing",
      func = update_camera_even_out_on_landing
    )#,
    # update_player_bound_push = list(
    #   descr = "Player push camera on getting too close to screen edge",
    #   func = update_camera_player_bound_push
    # )
  )
  
  camera_option = 1
  
  set_target_fps(60)
  
  ##################
  # Main game loop #
  ##################
  
  while(!window_should_close()) {
    
    # to implement
    # delta_time <- get_frame_time()
    delta_time <- 1/60
    
    player <- update_player(player, env_items, env_items_length, delta_time)
    
    camera$zoom <- camera$zoom + get_mouse_wheel_move()*0.05
    
    if (camera$zoom > 3) 
      camera$zoom = 3
    else if (camera$zoom < 0.25) 
      camera$zoom = 0.25
    
    if (is_key_pressed(keyboard_key$KEY_R)) {
      camera$zoom <- 1
      player$position <- Vector2(400, 280)
    }
    
    if (is_key_pressed(keyboard_key$KEY_C)) {
      camera_option <- camera_option %% length(camera_updaters) + 1
    }
    
    # update the camera!
    camera <- do.call(what = camera_updaters[[camera_option]]$func,
                      args = list(
                        camera = camera,
                        player = player,
                        env_items = env_items,
                        env_items_length = env_items_length,
                        delta = delta_time,
                        width = screen_width,
                        height = screen_height
                      ))
    
    begin_drawing()
    
    clear_background(raylib_color$LIGHTGRAY)
    
    begin_mode_2d(camera)
    
    invisible(lapply(env_items, \(x) { draw_rectangle_rec(x$rect, x$color) }))
    
    player_rect <- Rectangle(player$position["x"] - 20, player$position["y"] - 40, 40, 40)
    draw_rectangle_rec(player_rect, raylib_color$RED)
    
    end_mode_2d()
    
    DrawText("Controls:", 20, 20, 10, raylib_color$BLACK);
    DrawText("- Right/Left to move", 40, 40, 10, raylib_color$DARKGRAY);
    DrawText("- Space to jump", 40, 60, 10, raylib_color$DARKGRAY);
    DrawText("- Mouse Wheel to Zoom in-out, R to reset zoom", 40, 80, 10, raylib_color$DARKGRAY);
    DrawText("- C to change camera mode", 40, 100, 10, raylib_color$DARKGRAY);
    DrawText("Current camera mode:", 20, 120, 10, raylib_color$BLACK);
    DrawText(camera_updaters[[camera_option]]$descr, 40, 140, 10, raylib_color$DARKGRAY);
    
    end_drawing()
    
  }
  
  #####################
  # De-initialization #
  #####################
  
  close_window()
  
}

play_game()
