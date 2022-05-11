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
  
  for (i in 1:env_items_length) {
    if (env_items[[i]]$blocking &&
        (env_items[[i]]$rect["x"] <= player$position["x"]) &&
        (env_items[[i]]$rect["x"] + env_items[[i]]$rect["width"] >= player$position["x"]) &&
        (env_items[[i]]$rect["y"] >= player$position["y"]) &&
        (env_items[[i]]$rect["y"] < player$position["y"] + player$speed * delta)) {
      hit_obstacle <- TRUE
      player$speed <- 0
      player$position["y"] <- env_items[[i]]$rect["y"]
      
    }
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
update_camera_center <- function(camera, player, width, height) {
  camera$offset <- Vector2(width/2, height/2)
  camera$target <- player$position
  return(camera)
}

# update_camera_center_inside_map <- 
#   function(camera, player, env_items, env_items_length, delta, width, height) {
#   camera$target <- player$position
#   camera$offset <- Vector2(width/2, height/2)
#   
#   min_x <- min_y <- 1000 
#   max_x <- max_y <- -1000
#   
#   
# }
# 
# void UpdateCameraCenterInsideMap(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height)
# {
#   camera->target = player->position;
#   camera->offset = (Vector2){ width/2.0f, height/2.0f };
#   float minX = 1000, minY = 1000, maxX = -1000, maxY = -1000;
#   
#   for (int i = 0; i < envItemsLength; i++)
#   {
#     EnvItem *ei = envItems + i;
#     minX = fminf(ei->rect.x, minX);
#     maxX = fmaxf(ei->rect.x + ei->rect.width, maxX);
#     minY = fminf(ei->rect.y, minY);
#     maxY = fmaxf(ei->rect.y + ei->rect.height, maxY);
#   }
#   
#   Vector2 max = GetWorldToScreen2D((Vector2){ maxX, maxY }, *camera);
#   Vector2 min = GetWorldToScreen2D((Vector2){ minX, minY }, *camera);
#   
#   if (max.x < width) camera->offset.x = width - (max.x - width/2);
#   if (max.y < height) camera->offset.y = height - (max.y - height/2);
#   if (min.x > 0) camera->offset.x = width/2 - min.x;
#   if (min.y > 0) camera->offset.y = height/2 - min.y;
# }




# void UpdateCameraCenterInsideMap(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height);
# void UpdateCameraCenterSmoothFollow(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height);
# void UpdateCameraEvenOutOnLanding(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height);
# void UpdateCameraPlayerBoundsPush(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height);

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
  
  # // Store pointers to the multiple update camera functions
  # void (*cameraUpdaters[])(Camera2D*, Player*, EnvItem*, int, float, int, int) = {
  #   UpdateCameraCenter,
  #   UpdateCameraCenterInsideMap,
  #   UpdateCameraCenterSmoothFollow,
  #   UpdateCameraEvenOutOnLanding,
  #   UpdateCameraPlayerBoundsPush
  # };
  
  # int cameraOption = 0;
  # int cameraUpdatersLength = sizeof(cameraUpdaters)/sizeof(cameraUpdaters[0]);
  
  # char *cameraDescriptions[] = {
  #   "Follow player center",
  #   "Follow player center, but clamp to map edges",
  #   "Follow player center; smoothed",
  #   "Follow player center horizontally; updateplayer center vertically after landing",
  #   "Player push camera on getting too close to screen edge"
  # };
  
  set_target_fps(60)
  
  ##################
  # Main game loop #
  ##################
  
  while(!window_should_close()) {
    
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
    
    # if (IsKeyPressed(KEY_C)) cameraOption = (cameraOption + 1)%cameraUpdatersLength;
    # 
    # // Call update camera function by its pointer
    # cameraUpdaters[cameraOption](&camera, &player, envItems, envItemsLength, deltaTime, screenWidth, screenHeight);
    # //----------------------------------------------------------------------------------
    
    camera <- update_camera_center(camera, player, screen_width, screen_height)
    
    begin_drawing()
    
    clear_background(raylib_color$LIGHTGRAY)
    
    begin_mode_2d(camera)
    
    # for (int i = 0; i < envItemsLength; i++) DrawRectangleRec(envItems[i].rect, envItems[i].color);
    
    invisible(lapply(env_items, \(x) { draw_rectangle_rec(x$rect, x$color) }))
    
    player_rect <- Rectangle(player$position["x"] - 20, player$position["y"] - 40, 40, 40)
    draw_rectangle_rec(player_rect, raylib_color$RED)
    
    end_mode_2d()
    
    DrawText("Controls:", 20, 20, 10, raylib_color$BLACK);
    DrawText("- Right/Left to move", 40, 40, 10, raylib_color$DARKGRAY);
    DrawText("- Space to jump", 40, 60, 10, raylib_color$DARKGRAY);
    DrawText("- Mouse Wheel to Zoom in-out, R to reset zoom", 40, 80, 10, raylib_color$DARKGRAY);
    # DrawText("- C to change camera mode", 40, 100, 10, raylib_color$DARKGRAY);
    # DrawText("Current camera mode:", 20, 120, 10, "BLACK");
    # DrawText(cameraDescriptions[cameraOption], 40, 140, 10, DARKGRAY);
    
    end_drawing()
    
  }
  
  #####################
  # De-initialization #
  #####################
  
  close_window()
  
}

play_game()

# void UpdateCameraCenterSmoothFollow(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height)
# {
#   static float minSpeed = 30;
#   static float minEffectLength = 10;
#   static float fractionSpeed = 0.8f;
#   
#   camera->offset = (Vector2){ width/2.0f, height/2.0f };
#   Vector2 diff = Vector2Subtract(player->position, camera->target);
#   float length = Vector2Length(diff);
#   
#   if (length > minEffectLength)
#   {
#     float speed = fmaxf(fractionSpeed*length, minSpeed);
#     camera->target = Vector2Add(camera->target, Vector2Scale(diff, speed*delta/length));
#   }
# }
# 
# void UpdateCameraEvenOutOnLanding(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height)
# {
#   static float evenOutSpeed = 700;
#   static int eveningOut = false;
#   static float evenOutTarget;
#   
#   camera->offset = (Vector2){ width/2.0f, height/2.0f };
#   camera->target.x = player->position.x;
#   
#   if (eveningOut)
#   {
#     if (evenOutTarget > camera->target.y)
#     {
#       camera->target.y += evenOutSpeed*delta;
#       
#       if (camera->target.y > evenOutTarget)
#       {
#         camera->target.y = evenOutTarget;
#         eveningOut = 0;
#       }
#     }
#     else
#     {
#       camera->target.y -= evenOutSpeed*delta;
#       
#       if (camera->target.y < evenOutTarget)
#       {
#         camera->target.y = evenOutTarget;
#         eveningOut = 0;
#       }
#     }
#   }
#   else
#   {
#     if (player->canJump && (player->speed == 0) && (player->position.y != camera->target.y))
#     {
#       eveningOut = 1;
#       evenOutTarget = player->position.y;
#     }
#   }
# }
# 
# void UpdateCameraPlayerBoundsPush(Camera2D *camera, Player *player, EnvItem *envItems, int envItemsLength, float delta, int width, int height)
# {
#   static Vector2 bbox = { 0.2f, 0.2f };
#   
#   Vector2 bboxWorldMin = GetScreenToWorld2D((Vector2){ (1 - bbox.x)*0.5f*width, (1 - bbox.y)*0.5f*height }, *camera);
#   Vector2 bboxWorldMax = GetScreenToWorld2D((Vector2){ (1 + bbox.x)*0.5f*width, (1 + bbox.y)*0.5f*height }, *camera);
#   camera->offset = (Vector2){ (1 - bbox.x)*0.5f * width, (1 - bbox.y)*0.5f*height };
#   
#   if (player->position.x < bboxWorldMin.x) camera->target.x = player->position.x;
#   if (player->position.y < bboxWorldMin.y) camera->target.y = player->position.y;
#   if (player->position.x > bboxWorldMax.x) camera->target.x = bboxWorldMin.x + (player->position.x - bboxWorldMax.x);
#   if (player->position.y > bboxWorldMax.y) camera->target.y = bboxWorldMin.y + (player->position.y - bboxWorldMax.y);
# }