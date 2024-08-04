require 'app/lowrez.rb'

def init(args)
  args.state.maze = [ # this was a 28 x 31 grid
  [ 3,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  4 ],
  [ 6,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  6 ],
  [ 6,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  6 ],
  [ 6,  4,  4, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 14, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 15,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1,  1,  1,  1,  1,  3,  1,  1,  1,  1,  1,  1, 21, 23,  1,  1,  1,  1,  1,  1,  3,  1,  1,  1,  1,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 26, 28, 28, 19,  1, 26, 28, 28, 28, 19,  1, 21, 23,  1, 26, 28, 28, 28, 19,  1, 26, 28, 28, 19,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  2, 21, 10, 10, 23,  1, 21, 10, 10, 10, 23,  1, 21, 23,  1, 21, 10, 10, 10, 23,  1, 21, 10, 10, 23,  2, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 22, 30, 30, 20,  1, 22, 30, 30, 30, 20,  1, 22, 20,  1, 22, 30, 30, 30, 20,  1, 22, 30, 30, 20,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  3,  1,  1,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  3,  1,  1,  1,  1,  3, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 26, 28, 28, 19,  1, 26, 19,  1, 26, 28, 28, 28, 28, 28, 28, 19,  1, 26, 19,  1, 26, 28, 28, 19,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 22, 30, 30, 20,  1, 21, 23,  1, 22, 30, 30, 29, 34, 30, 30, 20,  1, 21, 23,  1, 22, 30, 30, 20,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1,  1,  1,  1,  1,  3, 21, 23,  1,  1,  1,  1, 21, 23,  1,  1,  1,  1, 21, 23,  3,  1,  1,  1,  1,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 17, 18, 18, 18, 18, 19,  1, 21, 35, 28, 28, 19,  0, 21, 23,  0, 26, 28, 28, 36, 23,  1, 26, 18, 18, 18, 18, 25,  4,  4,  6 ],
  [ 6,  4,  4, 10, 10, 10, 10, 10, 16,  1, 21, 34, 30, 30, 20,  0, 22, 20,  0, 22, 30, 30, 29, 23,  1, 24, 10, 10, 10, 10, 10,  4,  4,  6 ],
  [ 6,  4,  4, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0,  0,  0,  4,  0,  0,  4,  0,  0,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  4,  4,  6 ],
  [ 6,  4,  4, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 37, 18, 40, 43, 43, 41, 18, 39,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  4,  4,  6 ],
  [ 6,  4,  4, 12, 12, 12, 12, 12, 20,  1, 22, 20,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0, 22, 20,  1, 22, 12, 12, 12, 12, 12,  4,  4,  6 ],
  [ 6,  0,  0,  0,  0,  0,  0,  0,  6,  3,  0,  0,  4, 24, 10, 10, 10, 10, 10, 10, 16,  4,  0,  0,  3,  6,  0,  0,  0,  0,  0,  0,  0,  6 ],
  [ 6,  4,  4, 18, 18, 18, 18, 18, 19,  1, 26, 19,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0, 26, 19,  1, 26, 18, 18, 18, 18, 18,  4,  4,  6 ],
  [ 6,  4,  4, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 38, 12, 12, 12, 12, 12, 12, 42,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  4,  4,  6 ],
  [ 6,  4,  4, 10, 10, 10, 10, 10, 16,  1, 21, 23,  4,  0,  0,  0,  0,  0,  0,  0,  0,  4, 21, 23,  1, 24, 10, 10, 10, 10, 10,  4,  4,  6 ],
  [ 6,  4,  4, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 26, 28, 28, 28, 28, 28, 28, 19,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  4,  4,  6 ],
  [ 6,  4,  4, 11, 12, 12, 12, 12, 20,  1, 22, 20,  0, 22, 30, 30, 29, 34, 30, 30, 20,  0, 22, 20,  1, 22, 12, 12, 12, 12, 15,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1,  1,  1,  1,  1,  3,  1,  1,  3,  1,  1,  3, 21, 23,  3,  1,  1,  3,  1,  1,  3,  1,  1,  1,  1,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 26, 28, 28, 19,  1, 26, 28, 28, 28, 19,  1, 21, 23,  1, 26, 28, 28, 28, 19,  1, 26, 28, 28, 19,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 22, 30, 29, 23,  1, 22, 30, 30, 30, 20,  1, 22, 20,  1, 22, 30, 30, 30, 20,  1, 21, 34, 30, 20,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  2,  1,  1, 21, 23,  3,  1,  1,  3,  1,  1,  1,  0,  0,  1,  1,  1,  3,  1,  1,  3, 21, 23,  1,  1,  2, 24,  4,  4,  6 ],
  [ 6,  4,  4, 27, 28, 19,  1, 21, 23,  1, 26, 19,  1, 26, 28, 28, 28, 28, 28, 28, 19,  1, 26, 19,  1, 21, 23,  1, 26, 28, 33,  4,  4,  6 ],
  [ 6,  4,  4, 31, 30, 20,  1, 22, 20,  1, 21, 23,  1, 22, 30, 30, 29, 34, 30, 30, 20,  1, 21, 23,  1, 22, 20,  1, 22, 30, 32,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1,  1,  3,  1,  1,  3, 21, 23,  1,  1,  1,  1, 21, 23,  1,  1,  1,  1, 21, 23,  1,  1,  1,  3,  1,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 26, 28, 28, 28, 28, 36, 35, 28, 28, 19,  1, 21, 23,  1, 26, 28, 28, 36, 35, 28, 28, 28, 28, 19,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1, 22, 30, 30, 30, 30, 30, 30, 30, 30, 20,  1, 22, 20,  1, 22, 30, 30, 30, 30, 30, 30, 30, 30, 20,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 16,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  1,  1,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 24,  4,  4,  6 ],
  [ 6,  4,  4, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 25,  4,  4,  6 ],
  [ 6,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  6 ],
  [ 6,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  6 ],
  [ 6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6 ]
  ].reverse

=begin
  "pixel position in map mx, my:   #{32 + args.state.pacman.mx}, #{31 + args.state.pacman.my}",
  "grid position grid_x, grid_y:   #{args.state.pacman.grid_x}, #{args.state.pacman.grid_y}",
  "pacman coors on screen x, y:    #{args.state.pacman[:x] + args.state.offset[args.state.pacman.dir].x}, #{args.state.pacman[:y] + args.state.offset[args.state.pacman.dir].y}",
  "maze status at grid coors:      #{args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x]}",
=end

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
    speed: 4
  }

  args.state.red_ghost = {
    mx: 35,
    my: 79,
    hx: 16, # grid coors, home corner when scatter mode
    hy: 10,
    grid_x: 16,
    grid_y: 22,
    move_x: 0,
    move_y: 0,
    dir: 0,
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
  draw_lives args
  draw_red_ghost args
  draw_pacman args
  render_debug args
  return if game_has_lost_focus?
  player_input args
  return if args.state.pacman.dir == 0
  move_red_ghost args
end

def move_red_ghost(args)
  # point_to_grid args, (32 + args.state.pacman.mx), (31 + args.state.pacman.my)
  # point_to_grid_red_ghost args, 0, 0 # (0 - args.state.red_ghost.mx), (0 - args.state.red_ghost.my)
end

def draw_dots(args)
  args.state.maze.each_with_index do |row, row_index|
    row.each_with_index do |value, col_index|
      if value == 1 || value == 3
        args.lowrez.primitives << {
          x: (col_index * 4 - args.state.pacman.mx) + 1,
          y: (row_index * 4 - args.state.pacman.my) + 2,
          w: 1,
          h: 1,
          r: 255,
          g: 183,
          b: 255,
          a: 160,
          path: :pixel
        }
      elsif value == 2
        args.lowrez.primitives << {
          x: (col_index * 4 - args.state.pacman.mx),
          y: (row_index * 4 - args.state.pacman.my) + 1,
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
    r: 100,
    g: 100,
    b: 100,
    a: 255,
    font: LOWREZ_FONT_PATH
  }
  draw_ready args if args.state.pacman.dir == 0
end

def draw_ready(args)
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
  return unless args.state.tick_count.zmod? 2

  move_x = args.state.pacman.move_x
  move_y = args.state.pacman.move_y

  point_x = 32 + args.state.pacman.mx
  point_y = 31 + args.state.pacman.my

  if args.inputs.up
    if (((args.state.pacman.mx - 1) % 4) == 0) && (args.state.maze[(point_y/ 4).floor + 1][(point_x / 4).floor] < 2)
      args.state.pacman[:dir] = 1
      move_y = 1
      move_x = 0
      args.state.pacman.anim = :yes
    end
  elsif args.inputs.right
    if (((args.state.pacman.my + 1) % 4) == 0) && (args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1] < 2)
      args.state.pacman[:dir] = 2
      move_x = 1
      move_y = 0
      args.state.pacman.anim = :yes
    end
  elsif args.inputs.down
    if (((args.state.pacman.mx - 1) % 4) == 0) && (args.state.maze[(point_y/ 4).floor - 1][(point_x / 4).floor] < 2)
      args.state.pacman[:dir] = 3
      move_y = -1
      move_x = 0
      args.state.pacman.anim = :yes
    end
  elsif args.inputs.left
    if (((args.state.pacman.my + 1) % 4) == 0) && (args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1] < 2)
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

  if args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] > 4
    args.state.pacman.anim = :no
    move_x = 0
    move_y = 0
  end

  if args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] == 1 || args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] == 3
    args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 0
    args.state.pacman.score += 10
  end

  if args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] == 2
    args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 0
    args.state.pacman.score += 50
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
  sprite_path  = "sprites/red-ghost.png"
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + 67,
    y: (0 - args.state.pacman.my) + 90,
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
    x: (0 - args.state.pacman.mx) + 67,
    y: (0 - args.state.pacman.my) + 90,
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
    "pixel position in map mx, my:   #{32 + args.state.pacman.mx}, #{31 + args.state.pacman.my}",
    "grid position grid_x, grid_y:   #{args.state.pacman.grid_x}, #{args.state.pacman.grid_y}",
    "pacman coors on screen x, y:    #{args.state.pacman[:x] + args.state.offset[args.state.pacman.dir].x}, #{args.state.pacman[:y] + args.state.offset[args.state.pacman.dir].y}",
    # "maze status at grid coors:      #{args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x]}",
    "red ghost map pos mx, my:       #{32 + args.state.red_ghost.mx}, #{31 + args.state.red_ghost.my}",
    "red ghost grid grid_x, grid_y:  #{args.state.red_ghost.grid_x}, #{args.state.red_ghost.grid_y}",
    "red ghost screen coors x, y:    #{args.state.red_ghost[:x]}, #{args.state.red_ghost[:y]}",
    "args.state.map_origin_x:        #{args.state.map_origin_x}",
    "args.state.map_origin_y:        #{args.state.map_origin_y}"
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
