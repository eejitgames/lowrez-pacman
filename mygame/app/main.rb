require 'app/lowrez.rb'

def init(args)
  args.state.maze = [ # this is a 28 x 31 grid
  [ 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 14, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 15 ],
  [ 16,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24 ],
  [ 16,  0, 26, 28, 28, 19,  0, 26, 28, 28, 28, 19,  0, 21, 23,  0, 26, 28, 28, 28, 19,  0, 26, 28, 28, 19,  0, 24 ],
  [ 16,  0, 21, 10, 10, 23,  0, 21, 10, 10, 10, 23,  0, 21, 23,  0, 21, 10, 10, 10, 23,  0, 21, 10, 10, 23,  0, 24 ],
  [ 16,  0, 22, 30, 30, 20,  0, 22, 30, 30, 30, 20,  0, 22, 20,  0, 22, 30, 30, 30, 20,  0, 22, 30, 30, 20,  0, 24 ],
  [ 16,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24 ],
  [ 16,  0, 26, 28, 28, 19,  0, 26, 19,  0, 26, 28, 28, 28, 28, 28, 28, 19,  0, 26, 19,  0, 26, 28, 28, 19,  0, 24 ],
  [ 16,  0, 22, 30, 30, 20,  0, 21, 23,  0, 22, 30, 30, 29, 34, 30, 30, 20,  0, 21, 23,  0, 22, 30, 30, 20,  0, 24 ],
  [ 16,  0,  0,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0,  0,  0, 24 ],
  [ 17, 18, 18, 18, 18, 19,  0, 21, 35, 28, 28, 19,  0, 21, 23,  0, 26, 28, 28, 36, 23,  0, 26, 18, 18, 18, 18, 25 ],
  [ 10, 10, 10, 10, 10, 16,  0, 21, 34, 30, 30, 20,  0, 22, 20,  0, 22, 30, 30, 29, 23,  0, 24, 10, 10, 10, 10, 10 ],
  [ 10, 10, 10, 10, 10, 16,  0, 21, 23,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 21, 23,  0, 24, 10, 10, 10, 10, 10 ],
  [ 10, 10, 10, 10, 10, 16,  0, 21, 23,  0, 37, 18, 40, 43, 43, 41, 18, 39,  0, 21, 23,  0, 24, 10, 10, 10, 10, 10 ],
  [ 12, 12, 12, 12, 12, 20,  0, 22, 20,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0, 22, 20,  0, 22, 12, 12, 12, 12, 12 ],
  [ 10,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10 ],
  [ 18, 18, 18, 18, 18, 19,  0, 26, 19,  0, 24, 10, 10, 10, 10, 10, 10, 16,  0, 26, 19,  0, 26, 18, 18, 18, 18, 18 ],
  [ 10, 10, 10, 10, 10, 16,  0, 21, 23,  0, 38, 12, 12, 12, 12, 12, 12, 42,  0, 21, 23,  0, 24, 10, 10, 10, 10, 10 ],
  [ 10, 10, 10, 10, 10, 16,  0, 21, 23,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 21, 23,  0, 24, 10, 10, 10, 10, 10 ],
  [ 10, 10, 10, 10, 10, 16,  0, 21, 23,  0, 26, 28, 28, 28, 28, 28, 28, 19,  0, 21, 23,  0, 24, 10, 10, 10, 10, 10 ],
  [ 11, 12, 12, 12, 12, 20,  0, 22, 20,  0, 22, 30, 30, 29, 34, 30, 30, 20,  0, 22, 20,  0, 22, 12, 12, 12, 12, 15 ],
  [ 16,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24 ],
  [ 16,  0, 26, 28, 28, 19,  0, 26, 28, 28, 28, 19,  0, 21, 23,  0, 26, 28, 28, 28, 19,  0, 26, 28, 28, 19,  0, 24 ],
  [ 16,  0, 22, 30, 29, 23,  0, 22, 30, 30, 30, 20,  0, 22, 20,  0, 22, 30, 30, 30, 20,  0, 21, 34, 30, 20,  0, 24 ],
  [ 16,  0,  0,  0, 21, 23,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 21, 23,  0,  0,  0, 24 ],
  [ 27, 28, 19,  0, 21, 23,  0, 26, 19,  0, 26, 28, 28, 28, 28, 28, 28, 19,  0, 26, 19,  0, 21, 23,  0, 26, 28, 33 ],
  [ 31, 30, 20,  0, 22, 20,  0, 21, 23,  0, 22, 30, 30, 29, 34, 30, 30, 20,  0, 21, 23,  0, 22, 20,  0, 22, 30, 32 ],
  [ 16,  0,  0,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0, 21, 23,  0,  0,  0,  0,  0,  0, 24 ],
  [ 16,  0, 26, 28, 28, 28, 28, 36, 35, 28, 28, 19,  0, 21, 23,  0, 26, 28, 28, 36, 35, 28, 28, 28, 28, 19,  0, 24 ],
  [ 16,  0, 22, 30, 30, 30, 30, 30, 30, 30, 30, 20,  0, 22, 20,  0, 22, 30, 30, 30, 30, 30, 30, 30, 30, 20,  0, 24 ],
  [ 16,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24 ],
  [ 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 25 ],
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
    speed: 4
  }

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
  draw_pacman args
  render_debug args
  player_input args
end

def grid_highlight(args, gridloc)
  # draw grid section highlight at given gridloc

end

def point_to_grid(args, point)
  # determine which grid section a point is in
=begin
  def find_subsquare(point, large_square_size, num_subsquares)
    p_x, p_y = point
    s = large_square_size.to_f / num_subsquares

    i = (p_x / s).floor
    j = (p_y / s).floor

    return [i, j]
  end

  # Example usage
  large_square_size = 100
  num_subsquares = 10
  point = [45, 75]

  subsquare = find_subsquare(point, large_square_size, num_subsquares)
  puts "The point #{point} is in the subsquare #{subsquare}."
=end
end

# 1 up, 2 right, 3 down, 4 left (0 for stationary until a key is pressed)
def player_input(args)
  return unless args.state.tick_count.zmod? 4
  if args.inputs.up
    args.state.pacman[:dir] = 1
    args.state.pacman.my += 1
  elsif args.inputs.right
    args.state.pacman[:dir] = 2
    args.state.pacman.mx += 1
  elsif args.inputs.down
    args.state.pacman[:dir] = 3
    args.state.pacman.my -= 1
  elsif args.inputs.left
    args.state.pacman[:dir] = 4
    args.state.pacman.mx -= 1
  end
end

def draw_pacman(args)
  start_animation_on_tick = 10
  sprite_index = start_animation_on_tick.frame_index count: 3,     # how many sprites?
                                                     hold_for: 12, # how long to hold each sprite?
                                                     repeat: true  # should it repeat?
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
    path: 'sprites/lowrez-maze.png'
  }
end

def render_debug(args)
  # this is the point to determine which part of the grid pacman is in
  args.lowrez.primitives << {
    x: args.state.pacman[:x], # + args.state.offset[args.state.pacman.dir].x,
    y: args.state.pacman[:y], # + args.state.offset[args.state.pacman.dir].y,
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
    "args.lowrez.mouse_down tick:    #{args.state.last_click || "never"}",
    "args.lowrez.mouse_up tick:      #{args.state.last_up || "false"}",
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

  args.outputs.debug << {
    x: 640,
    y:  25,
    text: "INFO: dev mode is currently enabled. Comment out the invocation of ~render_debug~ within the ~tick~ method to hide the debug layer.",
    size_enum: -0.5,
    alignment_enum: 1
  }.label!
end

$gtk.reset
