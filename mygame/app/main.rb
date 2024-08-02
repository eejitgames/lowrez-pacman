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
    x: 32 - 4,
    y: 32 - 4,
    dx: 4,
    dy: 0,
    mx: 25,
    my: 9,
    dir: 0, # 1 up, 2 right, 3 down, 4 left (0 for stationary until a key is pressed)
    speed: 4
  }

  args.state.offset[0] = { x: 0, y: 0  }
  args.state.offset[1] = { x: 1, y: 0  }
  args.state.offset[2] = { x: 1, y: -1 }
  args.state.offset[3] = { x: 0, y: -1 }
  args.state.offset[4] = { x: 0, y: 0  }
end

def tick(args)
  init args if Kernel.tick_count.zero?

  args.lowrez.background_color = [0, 0, 0]
  draw_maze args
  draw_pacman args
  player_input args

  # render_debug args
end

def hello_world args
  args.lowrez.solids  << { x: 0, y: 64, w: 10, h: 10, r: 255 }

  args.lowrez.labels  << {
    x: 32,
    y: 63,
    text: "lowrezjam 2020",
    size_enum: LOWREZ_FONT_SM,
    alignment_enum: 1,
    r: 230,
    g: 230,
    b: 230,
    a: 255,
    font: LOWREZ_FONT_PATH
  }

  args.lowrez.sprites << {
    x: 32 - 10,
    y: 32 - 10,
    w: 20,
    h: 20,
    path: 'sprites/lowrez-ship-blue.png',
    a: Kernel.tick_count % 255,
    angle: Kernel.tick_count % 360
  }
end

def how_to_render_a_label args
  args.lowrez.labels << { x: 0, y: 57, text: "Hello World",
                         size_enum: LOWREZ_FONT_XL,
                         r: 0, g: 0, b: 0, a: 255,
                         font: LOWREZ_FONT_PATH }

  args.lowrez.labels << { x: 0, y: 36, text: "Hello World",
                          size_enum: LOWREZ_FONT_LG,
                          r: 0, g: 0, b: 0, a: 255,
                          font: LOWREZ_FONT_PATH }

  args.lowrez.labels << { x: 0, y: 20, text: "Hello World",
                          size_enum: LOWREZ_FONT_MD,
                          r: 0, g: 0, b: 0, a: 255,
                          font: LOWREZ_FONT_PATH }

  args.lowrez.labels << { x: 0, y: 9, text: "Hello World",
                          size_enum: LOWREZ_FONT_SM,
                          r: 0, g: 0, b: 0, a: 255,
                          font: LOWREZ_FONT_PATH }

  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(text: "Default")

  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 31,
                                   text: "Default",
                                   r: 128,
                                   g: 128,
                                   b: 128)
end

def how_to_render_solids args
  args.lowrez.solids << { x: 0, y: 0, w: 1, h: 1, r: 255, g: 0, b: 0, a: 255 }

  args.lowrez.solids << { x: 1, y: 1, w: 2, h: 2, r: 255, g: 0, b: 0, a: 255 }

  args.lowrez.solids << { x: 3, y: 3, w: 3, h: 3, r: 255, g: 0, b: 0 }

  args.lowrez.solids << { x: 6, y: 6, w: 4, h: 4, r: 255, g: 0, b: 0 }
end

def how_to_render_borders args
  args.lowrez.borders << { x: 0, y: 0, w: 3, h: 3, r: 255, g: 0, b: 0, a: 255 }

  args.lowrez.borders << { x: 3, y: 3, w: 4, h: 4, r: 255, g: 0, b: 0, a: 255 }

  args.lowrez.borders << { x: 7, y: 7, w: 5, h: 5, r: 255, g: 0, b: 0, a: 255 }
end

def how_to_render_lines args
  args.lowrez.lines << { x: 0, y: 0, x2: 63, y2:  0, r: 255 }

  args.lowrez.lines << { x: 0, y: 0, x2:  0, y2: 63, r: 255 }

  args.lowrez.lines << { x: 0, y: 0, x2: 63, y2: 63, r: 255 }
end

# 1 up, 2 right, 3 down, 4 left (0 for stationary until a key is pressed)
def player_input args
  if args.inputs.up
    args.state.pacman[:dir] = 1
    args.state.pacman.my += 0.5
  elsif args.inputs.right
    args.state.pacman[:dir] = 2
    args.state.pacman.mx += 0.5
  elsif args.inputs.down
    args.state.pacman[:dir] = 3
    args.state.pacman.my -= 0.5
  elsif args.inputs.left
    args.state.pacman[:dir] = 4
    args.state.pacman.mx -= 0.5
  end
end

def draw_pacman args
  #args.lowrez.primitives << {
  #  x: args.state.pacman[:x] + args.state.offset[args.state.pacman.dir].x,
  #  y: args.state.pacman[:y] + args.state.offset[args.state.pacman.dir].y,
  #  w: 8,
  #  h: 8,
  #  path: "sprites/lowrez-ball.png",
  #  angle: 180 - (args.state.pacman.dir * 90)
  # }

  start_animation_on_tick = 10
  sprite_index = start_animation_on_tick.frame_index count: 3,     # how many sprites?
                                                     hold_for: 12,  # how long to hold each sprite?
                                                     repeat: true  # should it repeat?
  if sprite_index
    sprite_path  = "sprites/lowrez-pac-#{sprite_index}.png"
    args.lowrez.primitives << {
      x: args.state.pacman[:x] + args.state.offset[args.state.pacman.dir].x,
      y: args.state.pacman[:y] + args.state.offset[args.state.pacman.dir].y,
      w: 8,
      h: 8,
      path: sprite_path,
      angle: 180 - (args.state.pacman.dir * 90)
    }
  else
    countdown_in_seconds = ((start_animation_on_tick - Kernel.tick_count) / 60).round(1)
  end
end

def draw_maze args
  args.lowrez.primitives << {
    x: 0 - args.state.pacman.mx,
    y: 0 - args.state.pacman.my,
    w: 115,
    h: 145,
    path: 'sprites/lowrez-maze.png'
  }
end

def how_to_render_sprites args
  10.times do |i|
    args.lowrez.sprites << {
      x: i * 5,
      y: i * 5,
      w: 5,
      h: 5,
      path: 'sprites/lowrez-ship-blue.png'
    }
  end

  positions = [
    { x: 10, y: 42 },
    { x: 15, y: 45 },
    { x: 22, y: 33 },
  ]

  positions.each do |position|
    args.lowrez.sprites << position.merge(path: 'sprites/lowrez-ship-red.png',
                                          w: 5,
                                          h: 5)
  end
end

def how_to_animate_a_sprite args
  start_animation_on_tick = 180

  sprite_index = start_animation_on_tick.frame_index count: 7,     # how many sprites?
                                                     hold_for: 4,  # how long to hold each sprite?
                                                     repeat: true  # should it repeat?

  if sprite_index
    sprite_path  = "sprites/explosion-#{sprite_index}.png"
    args.lowrez.sprites << { x: 0, y: 0, w: 64, h: 64, path: sprite_path }
  else
    countdown_in_seconds = ((start_animation_on_tick - Kernel.tick_count) / 60).round(1)

    args.lowrez.labels  << args.lowrez
                               .default_label
                               .merge(x: 32,
                                      y: 32,
                                      text: "Count Down: #{countdown_in_seconds}",
                                      alignment_enum: 1)
  end

  args.lowrez.labels  << args.lowrez
                               .default_label
                               .merge(x: 0,
                                      y: 11,
                                      text: "Tick: #{Kernel.tick_count}")
  args.lowrez.labels  << args.lowrez
                               .default_label
                               .merge(x: 0,
                                      y: 5,
                                      text: "sprite_index: #{sprite_index}")
end

def how_to_animate_a_sprite_sheet args
  start_animation_on_tick = 180

  sprite_index = start_animation_on_tick.frame_index count: 7,     # how many sprites?
                                                     hold_for: 4,  # how long to hold each sprite?
                                                     repeat: true  # should it repeat?

  if sprite_index
    args.lowrez.sprites << {
      x: 0,
      y: 0,
      w: 64,
      h: 64,
      path:  "sprites/explosion-sheet.png",
      source_x: 32 * sprite_index,
      source_y: 0,
      source_w: 32,
      source_h: 32
    }
  else
    countdown_in_seconds = ((start_animation_on_tick - Kernel.tick_count) / 60).round(1)

    args.lowrez.labels  << args.lowrez
                               .default_label
                               .merge(x: 32,
                                      y: 32,
                                      text: "Count Down: #{countdown_in_seconds}",
                                      alignment_enum: 1)
  end

  args.lowrez.labels  << args.lowrez
                               .default_label
                               .merge(x: 0,
                                      y: 11,
                                      text: "tick: #{Kernel.tick_count}")
  args.lowrez.labels  << args.lowrez
                               .default_label
                               .merge(x: 0,
                                      y: 5,
                                      text: "sprite_index: #{sprite_index}")
end

def how_to_move_a_sprite args
  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 32,
                                   y: 62, text: "Use Arrow Keys",
                                   alignment_enum: 1)

  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 32,
                                   y: 56, text: "Use WASD",
                                   alignment_enum: 1)

  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 32,
                                   y: 50, text: "Or Click",
                                   alignment_enum: 1)

  args.state.ship.x ||= 0
  args.state.ship.y ||= 0

  if args.lowrez.mouse_click
    args.state.ship.x = args.lowrez.mouse_click.x
    args.state.ship.y = args.lowrez.mouse_click.y
  end

  if args.lowrez.keyboard.left
    args.state.ship.x -= 1
  end

  if args.lowrez.keyboard.right
    args.state.ship.x += 1
  end

  if args.lowrez.keyboard.down
    args.state.ship.y -= 1
  end

  if args.lowrez.keyboard.up
    args.state.ship.y += 1
  end

  args.lowrez.sprites << {
    x: args.state.ship.x,
    y: args.state.ship.y,
    w: 5,
    h: 5,
    path: 'sprites/lowrez-ship-blue.png',
    angle: 0,
    r: 255,
    g: 255,
    b: 255,
    a: 255
  }
end

def how_to_determine_collision args
  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 32,
                                   y: 62, text: "Click Anywhere",
                                   alignment_enum: 1)

  if args.lowrez.mouse_click
    if !args.state.ship_one
      args.state.ship_one = { x: args.lowrez.mouse_click.x - 10,
                              y: args.lowrez.mouse_click.y - 10,
                              w: 20,
                              h: 20 }
    elsif !args.state.ship_two
      args.state.ship_two = { x: args.lowrez.mouse_click.x - 10,
                              y: args.lowrez.mouse_click.y - 10,
                              w: 20,
                              h: 20 }
    else
      args.state.ship_one = nil
      args.state.ship_two = nil
    end
  end

  if args.state.ship_one
    args.lowrez.sprites << args.state.ship_one.merge(path: 'sprites/lowrez-ship-blue.png', a: 100)
  end

  if args.state.ship_two
    args.lowrez.sprites << args.state.ship_two.merge(path: 'sprites/lowrez-ship-red.png', a: 100)
  end

  if args.state.ship_one && args.state.ship_two
    if args.state.ship_one.intersect_rect? args.state.ship_two
      args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 31,
                                   y: 5,
                                   text: "Collision!",
                                   alignment_enum: 1)
    else
      args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 31,
                                   y: 5,
                                   text: "No Collision.",
                                   alignment_enum: 1)
    end
  else
      args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(x: 31,
                                   y: 6,
                                   text: "--",
                                   alignment_enum: 1)
  end
end

def how_to_create_buttons args
  args.state.button_style = { w: 62, h: 10, r: 80, g: 80, b: 80 }
  args.state.label_style  = { r: 80, g: 80, b: 80 }

  args.state.button_message ||= "Press a Button!"
  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(args.state.label_style)
                            .merge(x: 32,
                                   y: 62,
                                   text: args.state.button_message,
                                   alignment_enum: 1)

  args.state.button_one_border = args.state.button_style.merge( x: 1, y: 32)
  args.lowrez.borders << args.state.button_one_border
  args.lowrez.labels  << args.lowrez
                             .default_label
                             .merge(args.state.label_style)
                             .merge(x: args.state.button_one_border.x + 2,
                                    y: args.state.button_one_border.y + LOWREZ_FONT_SM_HEIGHT + 2,
                                    text: "Button One")

  args.state.button_two_border = args.state.button_style.merge( x: 1, y: 20)

  args.lowrez.borders << args.state.button_two_border
  args.lowrez.labels << args.lowrez
                            .default_label
                            .merge(args.state.label_style)
                            .merge(x: args.state.button_two_border.x + 2,
                                   y: args.state.button_two_border.y + LOWREZ_FONT_SM_HEIGHT + 2,
                                   text: "Button Two")

  args.state.last_button_clicked ||= "--"

  if args.lowrez.mouse_click
    if args.lowrez.mouse_click.inside_rect? args.state.button_one_border
      args.state.last_button_clicked = "One Clicked!"
    elsif args.lowrez.mouse_click.inside_rect? args.state.button_two_border
      args.state.last_button_clicked = "Two Clicked!"
    else
      args.state.last_button_clicked = "--"
    end
  end

  args.lowrez.labels << args.lowrez
                             .default_label
                             .merge(args.state.label_style)
                             .merge(x: 32,
                                    y: 5,
                                    text: args.state.last_button_clicked,
                                    alignment_enum: 1)
end

def render_debug args
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
      size_enum: -1.5
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
