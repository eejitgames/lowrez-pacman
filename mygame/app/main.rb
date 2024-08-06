require 'app/lowrez.rb'

def init(args)
  # 1 is an oridinary dot
  # 2 is a power pill
  # 3 is a junction, with a dot
  # 4 is a junction, without a dot
  # 5 is a corner, with a dot
  # 6 is a corner, without a dot
  # 7 is a corner, with a power pill

  args.state.maze = [ # this was a 28 x 31 grid
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
    [ 9,  9,  9, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 14, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 15,  9,  9,  9 ],
    [ 9,  9,  9, 16,  5,  1,  1,  1,  1,  3,  1,  1,  1,  1,  1,  5, 21, 23,  5,  1,  1,  1,  1,  1,  3,  1,  1,  1,  1,  5, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 26, 28, 28, 19,  1, 26, 28, 28, 28, 19,  1, 21, 23,  1, 26, 28, 28, 28, 19,  1, 26, 28, 28, 19,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  2, 21, 10, 10, 23,  1, 21, 10, 10, 10, 23,  1, 21, 23,  1, 21, 10, 10, 10, 23,  1, 21, 10, 10, 23,  2, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 22, 30, 30, 20,  1, 22, 30, 30, 30, 20,  1, 22, 20,  1, 22, 30, 30, 30, 20,  1, 22, 30, 30, 20,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  3,  1,  1,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  1,  1,  3, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 26, 28, 28, 19,  1, 26, 19,  1, 26, 28, 28, 28, 28, 28, 28, 19,  1, 26, 19,  1, 26, 28, 28, 19,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 22, 30, 30, 20,  1, 21, 23,  1, 22, 30, 30, 29, 34, 30, 30, 20,  1, 21, 23,  1, 22, 30, 30, 20,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  5,  1,  1,  1,  1,  3, 21, 23,  5,  1,  1,  5, 21, 23,  5,  1,  1,  5, 21, 23,  3,  1,  1,  1,  1,  5, 24,  9,  9,  9 ],
    [ 9,  9,  9, 17, 18, 18, 18, 18, 19,  1, 21, 35, 28, 28, 19,  0, 21, 23,  0, 26, 28, 28, 36, 23,  1, 26, 18, 18, 18, 18, 25,  9,  9,  9 ],
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 34, 30, 30, 20,  0, 22, 20,  0, 22, 30, 30, 29, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 23,  6,  0,  0,  4,  0,  0,  4,  0,  0,  6, 21, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 37, 18, 40, 43, 43, 41, 18, 39,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 12, 12, 12, 12, 12, 20,  1, 22, 20,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0, 22, 20,  1, 22, 12, 12, 12, 12, 12,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  3,  0,  0,  4, 24,  6,  0,  0,  0,  0,  6, 16,  4,  0,  0,  3,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
    [ 9,  9,  9, 18, 18, 18, 18, 18, 19,  1, 26, 19,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0, 26, 19,  1, 26, 18, 18, 18, 18, 18,  9,  9,  9 ],
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 38, 12, 12, 12, 12, 12, 12, 42,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 23,  4,  0,  0,  0,  0,  0,  0,  0,  0,  4, 21, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 26, 28, 28, 28, 28, 28, 28, 19,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 11, 12, 12, 12, 12, 20,  1, 22, 20,  0, 22, 30, 30, 29, 34, 30, 30, 20,  0, 22, 20,  1, 22, 12, 12, 12, 12, 15,  9,  9,  9 ],
    [ 9,  9,  9, 16,  5,  1,  1,  1,  1,  3,  1,  1,  3,  1,  1,  5, 21, 23,  5,  1,  1,  3,  1,  1,  3,  1,  1,  1,  1,  5, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 26, 28, 28, 19,  1, 26, 28, 28, 28, 19,  1, 21, 23,  1, 26, 28, 28, 28, 19,  1, 26, 28, 28, 19,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 22, 30, 29, 23,  1, 22, 30, 30, 30, 20,  1, 22, 20,  1, 22, 30, 30, 30, 20,  1, 21, 34, 30, 20,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  7,  1,  5, 21, 23,  3,  1,  1,  3,  1,  1,  3,  0,  0,  3,  1,  1,  3,  1,  1,  3, 21, 23,  5,  1,  7, 24,  9,  9,  9 ],
    [ 9,  9,  9, 27, 28, 19,  1, 21, 23,  1, 26, 19,  1, 26, 28, 28, 28, 28, 28, 28, 19,  1, 26, 19,  1, 21, 23,  1, 26, 28, 33,  9,  9,  9 ],
    [ 9,  9,  9, 31, 30, 20,  1, 22, 20,  1, 21, 23,  1, 22, 30, 30, 29, 34, 30, 30, 20,  1, 21, 23,  1, 22, 20,  1, 22, 30, 32,  9,  9,  9 ],
    [ 9,  9,  9, 16,  5,  1,  3,  1,  1,  5, 21, 23,  5,  1,  1,  5, 21, 23,  5,  1,  1,  5, 21, 23,  5,  1,  1,  3,  1,  5, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 26, 28, 28, 28, 28, 36, 35, 28, 28, 19,  1, 21, 23,  1, 26, 28, 28, 36, 35, 28, 28, 28, 28, 19,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  1, 22, 30, 30, 30, 30, 30, 30, 30, 30, 20,  1, 22, 20,  1, 22, 30, 30, 30, 30, 30, 30, 30, 30, 20,  1, 24,  9,  9,  9 ],
    [ 9,  9,  9, 16,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  1,  1,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  5, 24,  9,  9,  9 ],
    [ 9,  9,  9, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 25,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ]
    ].reverse

  args.state.pacman = {
    lives: 3,
    score: 0,
    x: 28 + 4, # sprite positioning, with extra for anchor shift
    y: 28 + 3, # sprite positioning, with extra for anchor shift
    dx: 0,
    dy: 0,
    mx: 35, # map offset for 64x64 window
    my: 11, # map offset for 64x64 window
    grid_x: 16, # where pacman is in the maze
    grid_y: 10, # where pacman is in the maze
    dir: 0, # 1 up, 2 right, 3 down, 4 left (0 for stationary until a key is pressed)
    move_x: 0,
    move_y: 0,
    anim: :no,
    frame: 0,
    powered_up: 0,
    speed: 2
  }

  args.state.red_ghost = {
    x: 67,
    y: 90,
    mx: 35,
    my: 79,
    home_x: 28, # grid coors, home corner when scatter mode
    home_y: 37,
    target_x: 16,
    target_y: 10,
    grid_x: 16,
    grid_y: 22,
    move_x: 0,
    move_y: 0,
    dir: 4,
    pen: :no,
    mode: :chase, # mode either chase or scatter
    speed: 2,
    skip_frame: :true
  }

  # to position sprite correctly
  args.state.offset[0] = { x: 0, y: 1 }
  args.state.offset[1] = { x: 1, y: 1 }
  args.state.offset[2] = { x: 1, y: 0 }
  args.state.offset[3] = { x: 0, y: 0 }
  args.state.offset[4] = { x: 0, y: 1 }
end

def tick(args)
  init args if Kernel.tick_count.zero?

  args.lowrez.background_color = [0, 0, 0]
  draw_maze args
  draw_dots args
  draw_score args
  draw_red_ghost args
  draw_lives args
  draw_pacman args
  check_pacman_hit_status args
  # render_debug args
  return if game_has_lost_focus?
  player_input args if Kernel.tick_count.zmod? args.state.pacman.speed
  ghost_mode args
  return if args.state.pacman.dir == 0 # pacman has not moved yet, the game has not started
  move_red_ghost args if Kernel.tick_count.zmod? args.state.red_ghost.speed
end

def check_pacman_hit_status(args)
  # check if hit red ghost
  if args.state.pacman.grid_x == args.state.red_ghost.grid_x && args.state.pacman.grid_y == args.state.red_ghost.grid_y && args.state.red_ghost.mode == :scatter
    args.state.red_ghost.mode = :eyes
    args.state.red_ghost.target_x = 16
    args.state.red_ghost.target_y = 22
    args.state.red_ghost.speed = 1
  end
end

def ghost_mode(args)
  # Use Numeric#elapsed_time to determine how long it's been
  if args.state.pacman.powered_up.elapsed_time > 60 * 9 # 9 seconds
    args.state.red_ghost.speed = 2
    args.state.red_ghost.mode = :chase
  end
end

def distance(x1, y1, x2, y2)
  (x2 - x1)**2 + (y2 - y1)**2
end

def move_red_ghost(args)
  # move routine for when ghost is outside the pen only
  return unless args.state.red_ghost.pen == :no

  if args.state.red_ghost.skip_frame == :true
    args.state.red_ghost.skip_frame = :false
    return
  end

  #set target square to where pacman is
  if args.state.red_ghost.mode == :chase
    args.state.red_ghost.target_x = args.state.pacman.grid_x
    args.state.red_ghost.target_y = args.state.pacman.grid_y
  end

  move_x = args.state.red_ghost.move_x
  move_y = args.state.red_ghost.move_y
  point_x = args.state.red_ghost.x
  point_y = args.state.red_ghost.y

  # try to move forward
  case args.state.red_ghost[:dir]
    when 1
      if (((args.state.red_ghost.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor]) < 9)
        move_x = 0
        move_y = 1
      else
        move_x = 0
        move_y = 0
      end
      args.state.red_ghost.y += 1 if (move_y == 0) && (((args.state.red_ghost.y - 2) % 4) != 0)
    when 2
      if (((args.state.red_ghost.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1]) < 9)
        move_x = 1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
        args.state.red_ghost.x += 1 if (move_x == 0) && (((args.state.red_ghost.x - 1) % 4) != 0)
    when 3
      if (((args.state.red_ghost.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor - 1][(point_x / 4).floor]) < 9)
        move_x = 0
        move_y = -1
      else
        move_x = 0
        move_y = 0
      end
        args.state.red_ghost.y -= 1 if (move_y == 0) && (((args.state.red_ghost.y - 2) % 4) != 0)
    when 4
      if (((args.state.red_ghost.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1]) < 9)
        move_x = -1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
      args.state.red_ghost.x -= 1 if (move_x == 0) && (((args.state.red_ghost.x - 1) % 4) != 0)
  end

  args.state.red_ghost.mx += move_x
  args.state.red_ghost.my += move_y
  args.state.red_ghost.x += move_x
  args.state.red_ghost.y += move_y

  point_to_grid_red_ghost args, args.state.red_ghost.x, args.state.red_ghost.y

  # Ok we have moved, check if we are in a corner or at a junction where a turn decision/change of direction happens
  # 1 is an oridinary dot
  # 2 is a power pill
  # 3 is a junction, with a dot
  # 4 is a junction, without a dot
  # 5 is a corner, with a dot
  # 6 is a corner, without a dot

  args.state.red_ghost_in_a_corner = :no
  args.state.red_ghost_in_a_junction = :no
  red_ghost_over = args.state.maze[args.state.red_ghost.grid_y][args.state.red_ghost.grid_x]

  if (red_ghost_over == 5 || red_ghost_over == 6 || red_ghost_over == 7) && (((args.state.red_ghost.x - 1 ) % 4) == 0) && (((args.state.red_ghost.y - 2 ) % 4) == 0)
    args.state.red_ghost_in_a_corner = :yes
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  if args.state.red_ghost_in_a_corner == :yes && args.state.red.ghost.skip_frame == :true
    args.state.red.ghost.skip_frame = :false
    return
  end

  if (red_ghost_over == 3 || red_ghost_over == 4) && (((args.state.red_ghost.x - 1 ) % 4) == 0) && (((args.state.red_ghost.y - 2 ) % 4) == 0)
    args.state.red_ghost_in_a_junction = :yes
  end

  allowed_up = :no
  allowed_right = :no
  allowed_down = :no
  allowed_left = :no
  if args.state.red_ghost_in_a_corner == :yes || args.state.red_ghost_in_a_junction == :yes
    # we are at a corner or junction, capture the grid coordinates of the four possible options
    grid_up_x    = args.state.red_ghost.grid_x
    grid_up_y    = args.state.red_ghost.grid_y + 1

    grid_right_x = args.state.red_ghost.grid_x + 1
    grid_right_y = args.state.red_ghost.grid_y

    grid_down_x  = args.state.red_ghost.grid_x
    grid_down_y  = args.state.red_ghost.grid_y - 1

    grid_left_x  = args.state.red_ghost.grid_x - 1
    grid_left_y  = args.state.red_ghost.grid_y

    # check which directions are available including backwards (only allowed when in scatter mode)
    # 1 up, 2 right, 3 down, 4 left
    allowed_up = :no
    allowed_right = :no
    allowed_down = :no
    allowed_left = :no
    # check the grid north, south, east, and west of current position, also update points to check
    points_to_check = {}
    if args.state.maze[grid_up_y][grid_up_x] < 9
      allowed_up    = :yes
      points_to_check[:up] = [grid_up_x, grid_up_y]
    end
    if args.state.maze[grid_right_y][grid_right_x] < 9
      allowed_right = :yes
      points_to_check[:right] = [grid_right_x, grid_right_y]
    end
    if args.state.maze[grid_down_y][grid_down_x] < 9
      allowed_down  = :yes
      points_to_check[:down] = [grid_down_x, grid_down_y]
    end
    if args.state.maze[grid_left_y][grid_left_x] < 9
      allowed_left  = :yes
      points_to_check[:left] = [grid_left_x, grid_left_y]
    end


    # for a corner loop over the directions skipping the current dir and it's opposite
    if args.state.red_ghost_in_a_corner == :yes
      case args.state.red_ghost.dir
        when 1
        # if going up, check left and right
          args.state.red_ghost.dir = 2 if allowed_right == :yes
          args.state.red_ghost.dir = 4 if allowed_left == :yes
        when 2
          # if going right, check up and down
          args.state.red_ghost.dir = 1 if allowed_up == :yes
          args.state.red_ghost.dir = 3 if allowed_down == :yes
        when 3
          # if going down, check left and right
          args.state.red_ghost.dir = 2 if allowed_right == :yes
          args.state.red_ghost.dir = 4 if allowed_left == :yes
        when 4
          # if going left, check up and down
          args.state.red_ghost.dir = 1 if allowed_up == :yes
          args.state.red_ghost.dir = 3 if allowed_down == :yes
      end
    end

    # for a junction loop over the directions optionally skipping the opposite
    # To break a tie, the ghost prefers directions in this order: up, left, down, right
    if args.state.red_ghost_in_a_junction == :yes
    # this sets a default in the case there is a tie in the distance
      case args.state.red_ghost.dir
        when 1 # up
        # if going up, check left, right and up
          args.state.red_ghost.dir = 2 if allowed_right == :yes
          # args.state.red_ghost.dir = 3 if (allowed_down == :yes && args.state.red_ghost.mode == :scatter)
          args.state.red_ghost.dir = 4 if allowed_left == :yes
          args.state.red_ghost.dir = 1 if allowed_up == :yes
          points_to_check.delete(:down) # unless args.state.red_ghost.mode == :scatter
        when 2 # right
          # if going right, check up, down, and right
          args.state.red_ghost.dir = 2 if allowed_right == :yes
          args.state.red_ghost.dir = 3 if allowed_down == :yes
          # args.state.red_ghost.dir = 4 if (allowed_left == :yes && args.state.red_ghost.mode == :scatter)
          args.state.red_ghost.dir = 1 if allowed_up == :yes
          points_to_check.delete(:left) # unless args.state.red_ghost.mode == :scatter
        when 3 # down
          # if going down, check left, right, and down
          args.state.red_ghost.dir = 2 if allowed_right == :yes
          args.state.red_ghost.dir = 3 if allowed_down == :yes
          args.state.red_ghost.dir = 4 if allowed_left == :yes
          # args.state.red_ghost.dir = 1 if (allowed_up == :yes && args.state.red_ghost.mode == :scatter)
          points_to_check.delete(:up) # unless args.state.red_ghost.mode == :scatter
        when 4 # left
          # if going left, check up, down and left
          # args.state.red_ghost.dir = 2 if (allowed_right == :yes && args.state.red_ghost.mode == :scatter)
          args.state.red_ghost.dir = 3 if allowed_down == :yes
          args.state.red_ghost.dir = 4 if allowed_left == :yes
          args.state.red_ghost.dir = 1 if allowed_up == :yes
          points_to_check.delete(:right) # unless args.state.red_ghost.mode == :scatter
      end

      # putz "points_to_check: #{points_to_check}"
      # check if we have a shortest distance to target without a tie
      distances = {}

      if args.state.red_ghost.mode == :scatter
        target_x = args.state.red_ghost.home_x
        target_y = args.state.red_ghost.home_y
      else
        target_x = args.state.red_ghost.target_x
        target_y = args.state.red_ghost.target_y
      end

      points_to_check.each do |key, coord|
        distances[key] = distance(target_x, target_y, coord[0], coord[1])
      end

      # Sort the distances by value
      sorted_distances = distances.sort_by { |_, dist| dist }

      # Get the smallest distance
      min_distance = sorted_distances[0][1]

      # Find all points with the smallest distance
      closest_points = sorted_distances.select { |_, dist| dist == min_distance }

      # Print results based on the number of closest points
      if closest_points.size > 1
        # putz "There is a tie between the closest points:"
        # putz "Using default dir from above"
      else
        closest_point = closest_points.first[0]
        coord = points_to_check[closest_point]
        # putz "The closest point to the target (#{target_x}, #{target_y}) is #{closest_point}: (#{coord[0]}, #{coord[1]})"
        # 1 up, 2 right, 3 down, 4 left
        case closest_point
          when :up
            # putz "going up"
            args.state.red_ghost.dir = 1
          when :right
            # putz "going right"
            args.state.red_ghost.dir = 2
          when :down
            # putz "going down"
            args.state.red_ghost.dir = 3
          when :left
            # putz "going left"
            args.state.red_ghost.dir = 4
        end
      end
    end
    args.state.red.ghost.skip_frame = :true
  end
  args.state.red_ghost.allowed_up = allowed_up
  args.state.red_ghost.allowed_right = allowed_right
  args.state.red_ghost.allowed_down = allowed_down
  args.state.red_ghost.allowed_left = allowed_left

  if args.state.red_ghost.mode == :eyes
    if ((args.state.red_ghost.grid_x == 16) && (args.state.red_ghost.grid_y == 22))
      args.state.red_ghost.pen = :yes
      args.state.red_ghost.mode = :chase
      args.state.red_ghost.dir = 1
      args.state.red_ghost.x = 67
      args.state.red_ghost.y = 78
    end
  end
end

def draw_dots(args)
  # rectangle_height = 29
  # rectangle_width = 26
  # array_height = 37 # args.state.maze.size
  # array_width = 34 # args.state.maze[0].size

  # start_row = 4 # (array_height - rectangle_height) / 2
  # end_row = 32 # start_row + rectangle_height - 1
  # start_col = 4 # (array_width - rectangle_width) / 2
  # end_col = 29 # start_col + rectangle_width - 1

  # (start_row..end_row).each do |row|
  #   (start_col..end_col).each do |col|

  (4..32).each do |row|
    (4..29).each do |col|

      value = args.state.maze[row][col]

  #args.state.maze.each_with_index do |row, row_index|
  #  row.each_with_index do |value, col_index|
      if value == 1 || value == 3 || value == 5
        args.lowrez.primitives << {
          x: (col * 4 - args.state.pacman.mx) + 1,       # x: (col_index * 4 - args.state.pacman.mx) + 1,
          y: (row * 4 - args.state.pacman.my) + 2, # y: (row_index * 4 - args.state.pacman.my) + 2,
          w: 1,
          h: 1,
          r: 255,
          g: 183,
          b: 255,
          a: 160,
          path: :pixel
        }
      elsif value == 2 || value == 7
        args.lowrez.primitives << {
          x: (col * 4 - args.state.pacman.mx),     # x: (col_index * 4 - args.state.pacman.mx),
          y: (row * 4 - args.state.pacman.my) + 1, # y: (row_index * 4 - args.state.pacman.my) + 1,
          w: 3,
          h: 3,
          r: 0xFF,
          g: 183,
          b: 0xFF,
          a: 160,
          path: :pixel
        }
      end
    end
  end
end

def draw_lives(args)
  args.state.pacman.lives.times do |index|
    args.lowrez.primitives << {
      x: 3 + (6 * index),
      y: 2,
      w: 6,
      h: 6,
      path: "sprites/lowrez-pac-0.png",
      anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
      anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
      angle: 0
    }
  end
end

def draw_score(args)
  args.lowrez.labels  << {
    x: 33,
    y: 63,
    text: "#{args.state.pacman.score}",
    size_enum: LOWREZ_FONT_TI,
    alignment_enum: 1,
    r: 220,
    g: 220,
    b: 220,
    a: 255,
    font: LOWREZ_FONT_PATH
  }
  draw_ready args if args.state.pacman.dir == 0
end

def draw_ready(args)
  return
  args.lowrez.labels  << {
    x: 34,
    y: 57,
    text: "Ready!",
    size_enum: LOWREZ_FONT_TI,
    alignment_enum: 1,
    r: 0xF4, # f4ec9b
    g: 0xEC,
    b: 0x9B,
    a: 255,
    font: LOWREZ_FONT_PATH
  }
end

def grid_highlight(args)
  grid_size = 4 # each grid cell is 4x4 pixels

  grid_x = args.state.pacman.grid_x
  grid_y = args.state.pacman.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * grid_size - args.state.pacman.mx
  y = grid_y * grid_size - args.state.pacman.my

  args.lowrez.primitives << {
    x: x,
    y: y,
    w: grid_size,
    h: grid_size,
    r: 255,
    g: 0,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def grid_highlight_red_ghost(args)
  grid_size = 4 # each grid cell is 4x4 pixels

  grid_x = args.state.red_ghost.grid_x
  grid_y = args.state.red_ghost.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * grid_size
  y = grid_y * grid_size

  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + x,
    y: (0 - args.state.pacman.my) + y,
    w: grid_size,
    h: grid_size,
    r: 0,
    g: 255,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def point_to_grid(args, point_x, point_y)
  # determine which grid section a point is in
  size_x = 4 # 136 / 34
  size_y = 4 # 148 / 37

  args.state.pacman.grid_x = (point_x / size_x).floor
  args.state.pacman.grid_y = (point_y / size_y).floor
end


def point_to_grid_red_ghost(args, point_x, point_y)
  # determine which grid section a point is in
  size_x = 4 # 136 / 34
  size_y = 4 # 148 / 37

  args.state.red_ghost.grid_x = (point_x / size_x).floor
  args.state.red_ghost.grid_y = (point_y / size_y).floor
end

# 1 up, 2 right, 3 down, 4 left (0 for stationary until a key is pressed)
def player_input(args)
  move_x = args.state.pacman.move_x
  move_y = args.state.pacman.move_y

  point_x = 32 + args.state.pacman.mx
  point_y = 31 + args.state.pacman.my

  if args.inputs.up
    if (((args.state.pacman.mx - 1) % 4) == 0) && (args.state.maze[(point_y/ 4).floor + 1][(point_x / 4).floor] < 9)
      args.state.pacman[:dir] = 1
      move_y = 1
      move_x = 0
      args.state.pacman.anim = :yes
    end
  elsif args.inputs.right
    if (((args.state.pacman.my + 1) % 4) == 0) && (args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1] < 9)
      args.state.pacman[:dir] = 2
      move_x = 1
      move_y = 0
      args.state.pacman.anim = :yes
    end
  elsif args.inputs.down
    if (((args.state.pacman.mx - 1) % 4) == 0) && (args.state.maze[(point_y/ 4).floor - 1][(point_x / 4).floor] < 9)
      args.state.pacman[:dir] = 3
      move_y = -1
      move_x = 0
      args.state.pacman.anim = :yes
    end
  elsif args.inputs.left
    if (((args.state.pacman.my + 1) % 4) == 0) && (args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1] < 9)
      args.state.pacman[:dir] = 4
      move_x = -1
      move_y = 0
      args.state.pacman.anim = :yes
    end
  end

  # update grid_x and grid_y by calling this - horrible side effect abuse change these functions
  case args.state.pacman[:dir]
    when 1
      temp = point_to_grid args, (32 + args.state.pacman.mx + move_x), (31 + args.state.pacman.my + move_y + 1)
    when 2
      temp = point_to_grid args, (32 + args.state.pacman.mx + move_x + 2), (31 + args.state.pacman.my + move_y)
    when 3
      temp = point_to_grid args, (32 + args.state.pacman.mx + move_x), (31 + args.state.pacman.my + move_y - 2)
    when 4
      temp = point_to_grid args, (32 + args.state.pacman.mx + move_x - 1), (31 + args.state.pacman.my + move_y)
  end

  if args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] > 8
    args.state.pacman.anim = :no
    move_x = 0
    move_y = 0
  end

  case args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x]
    when 1
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 0
      args.state.pacman.score += 10
    when 3
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 4
      args.state.pacman.score += 10
    when 5
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 6
      args.state.pacman.score += 10
    when 2
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 0
      args.state.pacman.score += 50
      args.state.pacman.powered_up = Kernel.tick_count
      args.state.red_ghost.speed = 4
      args.state.red_ghost.mode = :scatter unless args.state.red_ghost.pen == :yes
    when 7
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 6
      args.state.pacman.score += 50
      args.state.pacman.powered_up = Kernel.tick_count
      args.state.red_ghost.speed = 4
      args.state.red_ghost.mode = :scatter
  end

  args.state.pacman.move_x = move_x
  args.state.pacman.move_y = move_y
  args.state.pacman.mx += move_x
  args.state.pacman.my += move_y
  args.state.red_ghost.mx += move_x
  args.state.red_ghost.my += move_y

  args.state.map_origin_x = 32 + args.state.pacman.mx
  args.state.map_origin_y = 31 + args.state.pacman.my

  point_to_grid args, (32 + args.state.pacman.mx), (31 + args.state.pacman.my)
end

def draw_red_ghost(args)
  sprite_path  = "sprites/red-ghost-#{args.state.red_ghost.dir}.png"
  sprite_path  = "sprites/ghost-flee.png" if args.state.red_ghost.mode == :scatter
  sprite_path  = "sprites/ghost-eyes-#{args.state.red_ghost.dir}.png" if args.state.red_ghost.mode == :eyes
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + args.state.red_ghost.x,
    y: (0 - args.state.pacman.my) + args.state.red_ghost.y,
    w: 8,
    h: 8,
    path: sprite_path,
    anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
    anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
    angle: 0
  }
end

def draw_pacman(args)
  start_animation_on_tick = 1

  if args.state.pacman.anim == :yes
    sprite_index = start_animation_on_tick.frame_index count: 3,     # how many sprites?
                                                       hold_for: 12, # how long to hold each sprite?
                                                       repeat: true  # should it repeat?
    args.state.pacman.frame = sprite_index
  else
    sprite_index = args.state.pacman.frame
  end

  if sprite_index
    sprite_path  = "sprites/lowrez-pac-#{sprite_index}.png"
    args.lowrez.primitives << {
      x: args.state.pacman[:x] + args.state.offset[args.state.pacman.dir].x,
      y: args.state.pacman[:y] + args.state.offset[args.state.pacman.dir].y,
      w: 8,
      h: 8,
      path: sprite_path,
      anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
      anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
      angle: 180 - (args.state.pacman.dir * 90)
    }
  else
    countdown_in_seconds = ((start_animation_on_tick - Kernel.tick_count) / 60).round(1)
  end
end

def draw_maze(args)
  args.lowrez.primitives << {
    x: 0 - args.state.pacman.mx,
    y: 0 - args.state.pacman.my,
    w: 136, # 34 - grid is made up of 4x4 x 34x37
    h: 148, # 37
    a: 160,
    path: 'sprites/lowrez-maze.png'
  }
end

def game_has_lost_focus?
  return true if Kernel.tick_count.zero?

  current_focus = !$gtk.args.inputs.keyboard.has_focus

  if current_focus != $gtk.args.state.lost_focus
    if current_focus
      puts "lost focus"
      # audio[:music].paused = true
    else
      puts "gained focus"
      # audio[:music].paused = false
    end
  end
  $gtk.args.state.lost_focus = current_focus
end

def render_debug(args)
  grid_highlight args
  grid_highlight_red_ghost args
  # this is the point to determine which part of the grid red ghost is in
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + args.state.red_ghost.x,
    y: (0 - args.state.pacman.my) + args.state.red_ghost.y,
    w: 1,
    h: 1,
    r: 200,
    g: 200,
    b: 200,
    a: 200,
    path: :pixel
  }

  # this is the point to determine which part of the grid pacman is in
  args.lowrez.primitives << {
    x: args.state.pacman[:x],
    y: args.state.pacman[:y],
    w: 1,
    h: 1,
    r: 200,
    g: 200,
    b: 200,
    a: 200,
    path: :pixel
  }

  if !args.state.grid_rendered
    65.map_with_index do |i|
      args.outputs.static_debug << {
        x:  LOWREZ_X_OFFSET,
        y:  LOWREZ_Y_OFFSET + (i * 10),
        x2: LOWREZ_X_OFFSET + LOWREZ_ZOOMED_SIZE,
        y2: LOWREZ_Y_OFFSET + (i * 10),
        r: 128,
        g: 128,
        b: 128,
        a: 80
      }.line!

      args.outputs.static_debug << {
        x:  LOWREZ_X_OFFSET + (i * 10),
        y:  LOWREZ_Y_OFFSET,
        x2: LOWREZ_X_OFFSET + (i * 10),
        y2: LOWREZ_Y_OFFSET + LOWREZ_ZOOMED_SIZE,
        r: 128,
        g: 128,
        b: 128,
        a: 80
      }.line!
    end
  end

  args.state.grid_rendered = true

  args.state.last_click ||= 0
  args.state.last_up    ||= 0
  args.state.last_click   = Kernel.tick_count if args.lowrez.mouse_down # you can also use args.lowrez.click
  args.state.last_up      = Kernel.tick_count if args.lowrez.mouse_up
  args.state.label_style  = { size_enum: -1.5 }

  args.state.watch_list = [
    "Kernel.tick_count is:           #{Kernel.tick_count}",
    "args.lowrez.mouse_position is:  #{args.lowrez.mouse_position.x}, #{args.lowrez.mouse_position.y}",
    # "args.lowrez.mouse_down tick:    #{args.state.last_click || "never"}",
    # "args.lowrez.mouse_up tick:      #{args.state.last_up || "false"}",
    # "pixel position in map mx, my:   #{32 + args.state.pacman.mx}, #{31 + args.state.pacman.my}",
    "grid position grid_x, grid_y:   #{args.state.pacman.grid_x}, #{args.state.pacman.grid_y}",
    # "pacman coors on screen x, y:    #{args.state.pacman[:x] + args.state.offset[args.state.pacman.dir].x}, #{args.state.pacman[:y] + args.state.offset[args.state.pacman.dir].y}",
    # "maze status at grid coors:      #{args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x]}",
    # "red ghost map pos mx, my:       #{32 + args.state.red_ghost.mx}, #{31 + args.state.red_ghost.my}",
    # "red ghost grid grid_x, grid_y:  #{args.state.red_ghost.grid_x}, #{args.state.red_ghost.grid_y}",
    # "red ghost screen coors x, y:    #{args.state.red_ghost[:x]}, #{args.state.red_ghost[:y]}",
    # "args.state.map_origin_x, oy:    #{args.state.map_origin_x}, #{args.state.map_origin_y}",
    # "red ghost is hovering over:     #{args.state.maze[args.state.red_ghost.grid_y][args.state.red_ghost.grid_x]}",
    # "red ghost in a maze corner:     #{args.state.red_ghost_in_a_corner}",
    # "red ghost in a maze junction:   #{args.state.red_ghost_in_a_junction}",
    # "red ghost is allowed up:        #{args.state.red_ghost.allowed_up}",
    # "red ghost is allowed right:     #{args.state.red_ghost.allowed_right}",
    # "red ghost is allowed down:      #{args.state.red_ghost.allowed_down}",
    # "red ghost is allowed left:      #{args.state.red_ghost.allowed_left}",
    # "red ghost is direction:         #{args.state.red_ghost.dir}"
  ]

  args.outputs.debug << args.state
                            .watch_list
                            .map_with_index do |text, i|
    {
      x: 5,
      y: 720 - (i * 20),
      text: text,
      size_enum: -1.5,
      r: 250,
      g: 250,
      b: 250,
      a: 250
    }.label!
  end
end

$gtk.reset
$gtk.disable_framerate_warning!
