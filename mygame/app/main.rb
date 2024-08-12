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
    [ 9,  9,  9, 10, 10, 10, 10, 10, 16,  1, 21, 23,  0, 37, 18, 40,  9, 43, 41, 18, 39,  0, 21, 23,  1, 24, 10, 10, 10, 10, 10,  9,  9,  9 ],
    [ 9,  9,  9, 12, 12, 12, 12, 12, 20,  1, 22, 20,  0, 24, 10, 10,  9, 10, 10, 10, 16,  0, 22, 20,  1, 22, 12, 12, 12, 12, 12,  9,  9,  9 ],
    [ 9,  9,  9,  9,  9,  9,  9,  9,  9,  3,  0,  0,  4, 24, 10,  6,  4,  0,  6, 10, 16,  4,  0,  0,  3,  9,  9,  9,  9,  9,  9,  9,  9,  9 ],
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
    ].reverse unless args.state.new_wave

  args.state.pacman = {
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
    speed: 2,
    ghost_score: 200,
    offset: [
      { x: 0, y: 1 },
      { x: 1, y: 1 },
      { x: 1, y: 0 },
      { x: 0, y: 0 },
      { x: 0, y: 1 }
    ]
  }

  args.state.blinky = {
    x: 67, # world coords
    y: 90,
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
    skip_frame: :true,
    entered_pen_time: 0
    #offset: [
    #  [0,   0],  # no offset
    #  [0,   2],  # 2 tiles up
    #  [2,   0],  # 2 tiles right
    #  [0,  -2],  # 2 tiles down
    #  [-2,  0]   # 2 tiles left
    #]
  }

  args.state.pinky = {
    x: 67,
    y: 78,
    home_x: 4, # grid coors, home corner when scatter mode
    home_y: 37,
    target_x: 15,
    target_y: 25,
    grid_x: 16,
    grid_y: 19,
    move_x: 0,
    move_y: 0,
    dir: 4,
    pen: :yes,
    mode: :chase, # mode either chase or scatter
    speed: 10,
    skip_frame: :true,
    entered_pen_time: 0
  }

  args.state.inky = {
    x: 67 + 6,
    y: 78,
    home_x: 30, # grid coors, home corner when scatter mode
    home_y: 2,
    target_x: 15,
    target_y: 25,
    grid_x: 16 + 2,
    grid_y: 19,
    move_x: 0,
    move_y: 0,
    dir: 4,
    pen: :yes,
    mode: :chase, # mode either chase or scatter
    speed: 10,
    skip_frame: :true,
    entered_pen_time: 120,
    offset: [
      [0,  0],  # nothing for dir 0
      [0,  2],  # 2 tiles up
      [2,  0],  # 2 tiles right
      [0, -2],  # 2 tiles down
      [-2, 0]   # 2 tiles left
    ]
  }

  args.state.clyde = {
    x: 67 - 6 ,
    y: 78,
    home_x: 2, # grid coors, home corner when scatter mode
    home_y: 2,
    target_x: 15,
    target_y: 25,
    grid_x: 16 - 1,
    grid_y: 19,
    move_x: 0,
    move_y: 0,
    dir: 4,
    pen: :yes,
    mode: :chase, # mode either chase or scatter
    speed: 10,
    skip_frame: :true,
    entered_pen_time: 240
  }

  args.state.fruits = [
    { fruit: "cherries"  , score: 100 },
    { fruit: "strawberry", score: 300 },
    { fruit: "orange"    , score: 500 },
    { fruit: "apple"     , score: 700 },
    { fruit: "melon"     , score: 1000 },
    { fruit: "galaxian"  , score: 2000 }
  ]

  # args.state.dots_eaten = 0
  args.state.should_draw = true
  # @my_var = "testing testing"
  args.state.new_level_timer = nil
  args.state.new_wave = nil
end

def reset(args)
  args.state.pacman_is_dead = nil
end

def tick(args)
  if Kernel.tick_count.zero?
    init args 
    args.state.pacman.lives = 3
    args.state.pacman.score = 0
    args.state.dots_eaten = 0
    args.state.next_life_threshold = 10000
    args.state.fruit = 0 # this is the first fruit, cherries, and will be incremented as they are eaten
    args.state.fruit_target_dots = nil
    args.state.draw_fruit = :false
  end
  args.lowrez.background_color = [0, 0, 0]
  check_all_dots_eaten_blink_maze_start_new_level args
  draw_maze args if args.state.should_draw == true # draw_maze args
  draw_dots args
  fruit_handling args
  draw_score args
  if args.state.should_draw == true
    draw_pinky args
    draw_inky args
    draw_blinky args
    draw_clyde args
  end
  check_for_extra_life args
  draw_lives args
  draw_pacman args unless args.state.pacman_is_dead
  draw_pacman_death_anim args if args.state.pacman_is_dead
  check_pacman_hit_status args
  # render_debug args
  return if game_has_lost_focus?
  player_input args if Kernel.tick_count.zmod? args.state.pacman.speed
  ghost_mode args
  return if args.state.pacman.dir == 0 # pacman has not moved yet, the game has not started
  unless args.state.level_complete == true # || args.state.pacman_is_dead == true
    move_blinky args if Kernel.tick_count.zmod? args.state.blinky.speed
    move_pinky args if Kernel.tick_count.zmod? args.state.pinky.speed
    move_inky args if Kernel.tick_count.zmod? args.state.inky.speed
    move_clyde args if Kernel.tick_count.zmod? args.state.clyde.speed
  end
  exit_ghost_pen args
  check_ghosts args # this may not be needed when they have different logic

  if args.inputs.keyboard.key_down.forward_slash
    args.state.show_fps = !args.state.show_fps # ^true # @show_fps = !@show_fps
  end

  if args.state.show_fps
    args.lowrez.labels  << {
    x: 34,
    y: 57,
    text: "#{args.gtk.current_framerate.to_sf}",
    size_enum: LOWREZ_FONT_TI,
    alignment_enum: 1,
    r: 0xF4, # f4ec9b
    g: 0xEC,
    b: 0x9B,
    a: 255,
    font: LOWREZ_FONT_PATH
    }
  end
  # puts60 "dots eaten: #{args.state.dots_eaten}"
end

def fruit_handling(args)
  args.state.bonus_shown ||= 0      # Number of times the bonus has been shown
  args.state.bonus_active ||= false # Is the bonus currently active?
  args.state.bonus_timer ||= 0      # Timer for how long the bonus is active

  # Check if the bonus should start
  if args.state.bonus_shown < 2
    if args.state.dots_eaten >= 70 && args.state.bonus_shown == 0
      start_bonus(args)
    elsif args.state.dots_eaten >= 170 && args.state.bonus_shown == 1
      start_bonus(args)
    end
  end

  # Handle the duration of the bonus
  if args.state.bonus_active
    args.state.bonus_timer -= 1
    if args.state.bonus_timer <= 0
      end_bonus(args)
    end
  end

  def start_bonus(args)
    args.state.bonus_active = true
    args.state.bonus_timer = 9 * 60 # 9 seconds, assuming 60 frames per second
    args.state.bonus_shown += 1
  end

  def end_bonus(args)
    args.state.bonus_active = false
  end

  if args.state.bonus_active == true
    #  args.state.fruits = [
    # { fruit: "cherries"  , score: 100 }.
    sprite_path  = "sprites/#{args.state.fruits[args.state.fruit].fruit}.png"
    args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + 67,
    y: (0 - args.state.pacman.my) + 66,
    w: 8,
    h: 8,
    path: sprite_path,
    anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
    anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
    angle: 0
    }
    # args.state.fruits = [
    #   { fruit: "cherries"  , score: 100 },
    #   { fruit: "strawberry", score: 300 },
    #   { fruit: "orange"    , score: 500 },
    #   { fruit: "apple"     , score: 700 },
    #   { fruit: "melon"     , score: 1000 },
    #   { fruit: "galaxian"  , score: 2000 }
    # ]

    # "pacman position in map mx, my:   #{32 + args.state.pacman.mx}, #{31 + args.state.pacman.my}"
    if args.state.pacman.mx == 34 && args.state.pacman.my == 35
      args.state.bonus_active = false
      args.state.bonus_active = false # Is the bonus currently active?
      args.state.bonus_timer = 0      # Timer for how long the bonus is active
      args.state.pacman.score += args.state.fruits[args.state.fruit].score
      args.state.fruit += 1 if args.state.fruit < 5
    end
  end
end

def check_for_extra_life(args)
  if args.state.pacman.score >= args.state.next_life_threshold
    args.state.pacman.lives += 1
    args.state.next_life_threshold += 10000
  end
end

def check_all_dots_eaten_blink_maze_start_new_level(args)
  # Check if the condition to start alternating is met
  # puts60 "this is a test: #{@my_var}"
  # if @state.dots_eaten > 4
  if args.state.dots_eaten > 243
    # Initialize alternating_start if not already set
    args.state.alternating_start ||= args.state.tick_count
    args.state.level_complete = true
    args.state.bonus_shown = 0
  else
    # Reset alternating_start to stop alternating if the condition is no longer met
    args.state.alternating_start = nil
    args.state.fruit_target_dots = nil
  end

  # If alternating_start is set, manage the alternating logic
  if args.state.alternating_start
    # Determine how many frames have passed since the alternating began
    elapsed_frames = args.state.tick_count - args.state.alternating_start

    # Check if the alternating should still be active
    if elapsed_frames < 300
      # Determine if we're in the drawing phase or the skipping phase
      cycle_position = elapsed_frames % (2 * 30)

      # Draw only if we're in the first x frames of the cycle (drawing phase)
      # puts60 "cycle: #{cycle_position}"
      args.state.should_draw = cycle_position < 30
    else
      # After y frames, revert to calling draw_me every frame
      args.state.alternating_start = nil
      args.state.level_complete = false
      args.state.should_draw = true
      args.state.pacman.anim = :yes
      current_score = args.state.pacman.score
      current_lives = args.state.pacman.lives
      current_dots = args.state.dots_eaten
      current_dots = 0 if args.state.dots_eaten > 243
      args.state.alternating_start = nil
      init args
      args.state.pacman.lives = current_lives
      args.state.pacman.score = current_score
      args.state.dots_eaten = current_dots
    end
  else
    # Normal behavior: call draw_me every frame
    args.state.should_draw = true
  end
end

def check_ghosts(args)
  # sometimes ghosts are drawn right over each other
  # blinky, pinky, inky and clyde
  # Define the pairs
  x1, y1 = 1, 2
  x2, y2 = 3, 4
  x3, y3 = 5, 6
  x4, y4 = 1, 2

  # Put the pairs in an array
  #pairs = {
  #  blinky: [args.state.blinky.x, args.state.blinky.y],
  #  pinky: [args.state.pinky.x, args.state.pinky.y],
  #  inky: [args.state.inky.x, args.state.inky.y],
  #  clyde: [args.state.clyde.x, args.state.clyde.y]
  #}

  # if they are not in the pen, and in chase mode, one of them needs to skip a frame
  pairs = {}
  pairs[:blinky] = [args.state.blinky.x, args.state.blinky.y] if args.state.blinky.pen == :no #&& args.state.blinky.mode == :chase
  pairs[:pinky]  = [args.state.pinky.x , args.state.pinky.y]  if args.state.pinky.pen == :no  #&& args.state.pinky.mode == :chase
  pairs[:inky]   = [args.state.inky.x  , args.state.inky.y]   if args.state.inky.pen == :no   #&& args.state.inky.mode == :chase
  pairs[:clyde]  = [args.state.clyde.x , args.state.clyde.y]  if args.state.clyde.pen == :no  #&& args.state.clyde.mode == :chase

  return if pairs.size < 2

  # Create a hash to store the pairs and their corresponding keys
  pair_values = Hash.new { |hash, key| hash[key] = [] }

  # Populate the pair_values hash
  pairs.each do |key, value|
    pair_values[value] << key
  end

  # Find all pairs with more than one key (i.e., duplicate pairs)
  duplicates = pair_values.select { |_, keys| keys.size > 1 }

  if duplicates.empty?
    # putz "All pairs are unique."
  else
    # putz "Duplicate pairs found:"
    duplicates.each do |pair, keys|
      # putz "The first duplicate key is: #{keys.first}"
      # putz "Pair (#{pair[0]}, #{pair[1]}) is shared by: #{keys.join(', ')}"
      # putz "Ok so the info looks like #{pairs[keys.first]}"
      # putz "mode: #{args.state[keys.first].mode}"
      # putz "#{keys.first} is skipping a frame"
      args.state[keys.first].skip_frame = :true unless args.state[keys.first].mode == :eyes
    end
  end
end

def exit_ghost_pen(args)
  # blinky
  if ((args.state.blinky.pen ==:yes) && (args.state.blinky.entered_pen_time.elapsed_time > 60 * 9)) # 9 seconds
    args.state.blinky.speed = 2
    args.state.blinky.mode = :ghost_exit
    args.state.blinky.skip_frame = :true
   end

  if ((args.state.blinky.mode == :ghost_exit) && (args.state.blinky.x == 65))
    args.state.blinky.dir = 1
  end

  if ((args.state.blinky.mode == :ghost_exit) && (args.state.blinky.y == 90))
    args.state.blinky.mode = :chase
    args.state.blinky.dir = 4
    args.state.blinky.pen = :no
  end

  # pinky
  if ((args.state.pinky.pen ==:yes) && (args.state.pinky.entered_pen_time.elapsed_time > 60 * 9)) # 9 seconds
    args.state.pinky.speed = 3
    args.state.pinky.mode = :ghost_exit
    args.state.pinky.skip_frame = :true
   end

  if ((args.state.pinky.mode == :ghost_exit) && (args.state.pinky.x == 65))
    args.state.pinky.dir = 1
  end

  if ((args.state.pinky.mode == :ghost_exit) && (args.state.pinky.y == 90))
    args.state.pinky.mode = :chase
    args.state.pinky.dir = 4
    args.state.pinky.pen = :no
  end

  # inky
  if ((args.state.inky.pen ==:yes) && (args.state.inky.entered_pen_time.elapsed_time > 60 * 9)) # 9 seconds
    args.state.inky.speed = 3
    args.state.inky.mode = :ghost_exit
    args.state.inky.skip_frame = :true
   end

  if ((args.state.inky.mode == :ghost_exit) && (args.state.inky.x == 65))
    args.state.inky.dir = 1
  end

  if ((args.state.inky.mode == :ghost_exit) && (args.state.inky.y == 90))
    args.state.inky.mode = :chase
    args.state.inky.dir = 4
    args.state.inky.pen = :no
  end

  # clyde
  if ((args.state.clyde.pen ==:yes) && (args.state.clyde.entered_pen_time.elapsed_time > 60 * 9)) # 9 seconds
    args.state.clyde.speed = 3
    args.state.clyde.mode = :ghost_exit
    args.state.clyde.skip_frame = :true
   end

  if ((args.state.clyde.mode == :ghost_exit) && (args.state.clyde.x == 65))
    args.state.clyde.dir = 1
  end

  if ((args.state.clyde.mode == :ghost_exit) && (args.state.clyde.y == 90))
    args.state.clyde.mode = :chase
    args.state.clyde.dir = 4
    args.state.clyde.pen = :no
  end
end

def check_pacman_hit_status(args)
  # check if hit blinky
  if args.state.pacman.grid_x == args.state.blinky.grid_x && args.state.pacman.grid_y == args.state.blinky.grid_y && args.state.blinky.mode == :scatter
    args.state.pacman.score += args.state.pacman.ghost_score
    # putz "added: #{args.state.pacman.ghost_score}"
    args.state.pacman.ghost_score *= 2
    args.state.blinky.mode = :eyes
    args.state.blinky.target_x = 16
    args.state.blinky.target_y = 22
    args.state.blinky.speed = 1
  end

  # check if hit pinky
  if args.state.pacman.grid_x == args.state.pinky.grid_x && args.state.pacman.grid_y == args.state.pinky.grid_y && args.state.pinky.mode == :scatter
    args.state.pacman.score += args.state.pacman.ghost_score
    # putz "added: #{args.state.pacman.ghost_score}"
    args.state.pacman.ghost_score *= 2
    args.state.pinky.mode = :eyes
    args.state.pinky.target_x = 16
    args.state.pinky.target_y = 22
    args.state.pinky.speed = 1
  end

  # check if hit inky
  if args.state.pacman.grid_x == args.state.inky.grid_x && args.state.pacman.grid_y == args.state.inky.grid_y && args.state.inky.mode == :scatter
    args.state.pacman.score += args.state.pacman.ghost_score
    # putz "added: #{args.state.pacman.ghost_score}"
    args.state.pacman.ghost_score *= 2
    args.state.inky.mode = :eyes
    args.state.inky.target_x = 16
    args.state.inky.target_y = 22
    args.state.inky.speed = 1
  end

  # check if hit clyde
  if args.state.pacman.grid_x == args.state.clyde.grid_x && args.state.pacman.grid_y == args.state.clyde.grid_y && args.state.clyde.mode == :scatter
    args.state.pacman.score += args.state.pacman.ghost_score
    # putz "added: #{args.state.pacman.ghost_score}"
    args.state.pacman.ghost_score *= 2
    args.state.clyde.mode = :eyes
    args.state.clyde.target_x = 16
    args.state.clyde.target_y = 22
    args.state.clyde.speed = 1
  end

  if args.state.pacman.grid_x == args.state.blinky.grid_x && args.state.pacman.grid_y == args.state.blinky.grid_y && args.state.blinky.mode == :chase
    unless args.state.pacman_is_dead == true
      args.state.pacman_is_dead = true 
      args.state.death_start = Kernel.tick_count
    end
  end
  if args.state.pacman.grid_x == args.state.pinky.grid_x && args.state.pacman.grid_y == args.state.pinky.grid_y && args.state.pinky.mode == :chase
    unless args.state.pacman_is_dead == true
      args.state.pacman_is_dead = true
      args.state.death_start = Kernel.tick_count
    end
  end
  if args.state.pacman.grid_x == args.state.inky.grid_x && args.state.pacman.grid_y == args.state.inky.grid_y && args.state.inky.mode == :chase
    unless args.state.pacman_is_dead == true
      args.state.pacman_is_dead = true
      args.state.death_start = Kernel.tick_count
    end
  end
  if args.state.pacman.grid_x == args.state.clyde.grid_x && args.state.pacman.grid_y == args.state.clyde.grid_y && args.state.clyde.mode == :chase
    unless args.state.pacman_is_dead == true
      args.state.pacman_is_dead = true
      args.state.death_start = Kernel.tick_count
    end
  end
end

def ghost_mode(args)
  # Use Numeric#elapsed_time to determine how long it's been
  if args.state.pacman.powered_up.elapsed_time > 60 * 9 # 9 seconds
    # blinky
    unless args.state.blinky.pen == :yes || args.state.blinky.mode == :eyes
      args.state.blinky.speed = 2
      args.state.blinky.mode = :chase
      args.state.pacman.ghost_score = 200
    end

    # pinky
    unless args.state.pinky.pen == :yes || args.state.pinky.mode == :eyes
      args.state.pinky.speed = 3
      args.state.pinky.mode = :chase
      args.state.pacman.ghost_score = 200
    end

    # inky
    unless args.state.inky.pen == :yes || args.state.inky.mode == :eyes
      args.state.inky.speed = 3
      args.state.inky.mode = :chase
      args.state.pacman.ghost_score = 200
    end

    # clyde
    unless args.state.clyde.pen == :yes || args.state.clyde.mode == :eyes
      args.state.clyde.speed = 3
      args.state.clyde.mode = :chase
      args.state.pacman.ghost_score = 200
    end
  end
end

def distance(x1, y1, x2, y2)
  (x2 - x1)**2 + (y2 - y1)**2
end

def move_blinky(args)
  # move routine for when ghost is outside the pen only
  # return unless args.state.blinky.pen == :no

  #set target square to where pacman is
  if args.state.blinky.mode == :chase
    args.state.blinky.target_x = args.state.pacman.grid_x
    args.state.blinky.target_y = args.state.pacman.grid_y
  end

  move_x = args.state.blinky.move_x
  move_y = args.state.blinky.move_y
  point_x = args.state.blinky.x
  point_y = args.state.blinky.y

  # try to move forward
  case args.state.blinky[:dir]
    when 1
      if (((args.state.blinky.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor]) < 9) ||
         ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor] < 11) && (args.state.blinky.mode == :ghost_exit))
        move_x = 0
        move_y = 1
      else
        move_x = 0
        move_y = 0
      end
      args.state.blinky.y += 1 if (move_y == 0) && (((args.state.blinky.y - 2) % 4) != 0)
    when 2
      if (((args.state.blinky.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1]) < 9)
        move_x = 1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
        args.state.blinky.x += 1 if (move_x == 0) && (((args.state.blinky.x - 1) % 4) != 0)
    when 3
      if (((args.state.blinky.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor - 1][(point_x / 4).floor]) < 9)
        move_x = 0
        move_y = -1
      else
        move_x = 0
        move_y = 0
      end
        args.state.blinky.y -= 1 if (move_y == 0) && (((args.state.blinky.y - 2) % 4) != 0)
    when 4
      if (((args.state.blinky.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1]) < 9)
        move_x = -1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
      args.state.blinky.x -= 1 if (move_x == 0) && (((args.state.blinky.x - 1) % 4) != 0)
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  #if args.state.blinky_in_a_corner == :yes && args.state.blinky.skip_frame == :true && args.state.blinky.pen == :no
  if args.state.blinky.skip_frame == :true && args.state.blinky.pen == :no
    args.state.blinky.skip_frame = :false
    return
  end

  args.state.blinky.x += move_x
  args.state.blinky.y += move_y

  point_to_grid_blinky args, args.state.blinky.x, args.state.blinky.y

  # Ok we have moved, check if we are in a corner or at a junction where a turn decision/change of direction happens
  # 1 is an oridinary dot
  # 2 is a power pill
  # 3 is a junction, with a dot
  # 4 is a junction, without a dot
  # 5 is a corner, with a dot
  # 6 is a corner, without a dot

  args.state.blinky_in_a_corner = :no
  args.state.blinky_in_a_junction = :no
  blinky_over = args.state.maze[args.state.blinky.grid_y][args.state.blinky.grid_x]

  if (blinky_over == 5 || blinky_over == 6 || blinky_over == 7) && (((args.state.blinky.x - 1 ) % 4) == 0) && (((args.state.blinky.y - 2 ) % 4) == 0)
    args.state.blinky_in_a_corner = :yes
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  #if args.state.blinky_in_a_corner == :yes && args.state.blinky.skip_frame == :true && args.state.blinky.pen == :no
  #if args.state.blinky.skip_frame == :true && args.state.blinky.pen == :no
  #  args.state.blinky.skip_frame = :false
  #  return
  #end

  if (blinky_over == 3 || blinky_over == 4) && (((args.state.blinky.x - 1 ) % 4) == 0) && (((args.state.blinky.y - 2 ) % 4) == 0)
    args.state.blinky_in_a_junction = :yes
  end

  allowed_up = :no
  allowed_right = :no
  allowed_down = :no
  allowed_left = :no
  if args.state.blinky_in_a_corner == :yes || args.state.blinky_in_a_junction == :yes
    # we are at a corner or junction, capture the grid coordinates of the four possible options
    grid_up_x    = args.state.blinky.grid_x
    grid_up_y    = args.state.blinky.grid_y + 1

    grid_right_x = args.state.blinky.grid_x + 1
    grid_right_y = args.state.blinky.grid_y

    grid_down_x  = args.state.blinky.grid_x
    grid_down_y  = args.state.blinky.grid_y - 1

    grid_left_x  = args.state.blinky.grid_x - 1
    grid_left_y  = args.state.blinky.grid_y

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
    elsif ((args.state.maze[grid_up_y][grid_up_x] < 11) && (args.state.blinky.mode == :ghost_exit))
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
    if args.state.blinky_in_a_corner == :yes
      args.state.blinky.skip_frame = :true unless args.state.blinky.pen == :yes
      case args.state.blinky.dir
        when 1
        # if going up, check left and right
          args.state.blinky.dir = 2 if allowed_right == :yes
          args.state.blinky.dir = 4 if allowed_left == :yes
        when 2
          # if going right, check up and down
          args.state.blinky.dir = 1 if allowed_up == :yes
          args.state.blinky.dir = 3 if allowed_down == :yes
          args.state.blinky.dir = 4 if ((allowed_left == :yes) && (args.state.blinky.pen == :yes))
        when 3
          # if going down, check left and right
          args.state.blinky.dir = 2 if allowed_right == :yes
          args.state.blinky.dir = 4 if allowed_left == :yes
        when 4
          # if going left, check up and down
          args.state.blinky.dir = 1 if allowed_up == :yes
          args.state.blinky.dir = 3 if allowed_down == :yes
          args.state.blinky.dir = 2 if ((allowed_right == :yes) && (args.state.blinky.pen == :yes))
      end
    end

    # for a junction loop over the directions optionally skipping the opposite
    # To break a tie, the ghost prefers directions in this order: up, left, down, right
    if args.state.blinky_in_a_junction == :yes
    # this sets a default in the case there is a tie in the distance
      case args.state.blinky.dir
        when 1 # up
        # if going up, check left, right and up
          args.state.blinky.dir = 2 if allowed_right == :yes
          # args.state.blinky.dir = 3 if (allowed_down == :yes && args.state.blinky.mode == :scatter)
          args.state.blinky.dir = 4 if allowed_left == :yes
          args.state.blinky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:down) # unless args.state.blinky.mode == :scatter
        when 2 # right
          # if going right, check up, down, and right
          args.state.blinky.dir = 2 if allowed_right == :yes
          args.state.blinky.dir = 3 if allowed_down == :yes
          # args.state.blinky.dir = 4 if (allowed_left == :yes && args.state.blinky.mode == :scatter)
          args.state.blinky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:left) # unless args.state.blinky.mode == :scatter
        when 3 # down
          # if going down, check left, right, and down
          args.state.blinky.dir = 2 if allowed_right == :yes
          args.state.blinky.dir = 3 if allowed_down == :yes
          args.state.blinky.dir = 4 if allowed_left == :yes
          # args.state.blinky.dir = 1 if (allowed_up == :yes && args.state.blinky.mode == :scatter)
          points_to_check.delete(:up) # unless args.state.blinky.mode == :scatter
        when 4 # left
          # if going left, check up, down and left
          # args.state.blinky.dir = 2 if (allowed_right == :yes && args.state.blinky.mode == :scatter)
          args.state.blinky.dir = 3 if allowed_down == :yes
          args.state.blinky.dir = 4 if allowed_left == :yes
          args.state.blinky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:right) # unless args.state.blinky.mode == :scatter
      end

      # check if we have a shortest distance to target without a tie
      distances = {}

      if args.state.blinky.mode == :scatter
        target_x = args.state.blinky.home_x
        target_y = args.state.blinky.home_y
      else
        target_x = args.state.blinky.target_x
        target_y = args.state.blinky.target_y
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
            args.state.blinky.dir = 1
          when :right
            args.state.blinky.dir = 2
          when :down
            args.state.blinky.dir = 3
          when :left
            args.state.blinky.dir = 4
        end
      end
    end
  end
  args.state.blinky.allowed_up = allowed_up
  args.state.blinky.allowed_right = allowed_right
  args.state.blinky.allowed_down = allowed_down
  args.state.blinky.allowed_left = allowed_left

  if args.state.blinky.mode == :eyes
    # ghost is just above the pen, put him in it
    if ((args.state.blinky.grid_x == 16) && (args.state.blinky.grid_y == 22))
      args.state.blinky.speed = 10
      args.state.blinky.pen = :yes
      args.state.blinky.mode = :chase
      args.state.blinky.dir = 4
      args.state.blinky.x = 67
      args.state.blinky.y = 78
      args.state.blinky.grid_x = 16
      args.state.blinky.grid_y = 19
      args.state.blinky.entered_pen_time = Kernel.tick_count
      args.state.blinky.target_x = 15 # a square north of the pen exit
      args.state.blinky.target_y = 25
    end
  end
end

def move_pinky(args)
  # move routine for when ghost is outside the pen only
  # return unless args.state.pinky.pen == :no

  if args.state.pinky.mode == :chase
    # set target square offset four tiles away from pacman in the direction pacman is currently moving
    case args.state.pacman.dir
      # up
      when 1
        tx = args.state.pacman.grid_x
        ty = args.state.pacman.grid_y + 4

      # right
      when 2
        tx = args.state.pacman.grid_x + 4
        ty = args.state.pacman.grid_y

      # down
      when 3
        tx = args.state.pacman.grid_x
        ty = args.state.pacman.grid_y - 4

      # left
      when 4
        tx = args.state.pacman.grid_x - 4
        ty = args.state.pacman.grid_y
    end
    args.state.pinky.target_x = tx
    args.state.pinky.target_y = ty
  end

  move_x = args.state.pinky.move_x
  move_y = args.state.pinky.move_y
  point_x = args.state.pinky.x
  point_y = args.state.pinky.y

  # try to move forward
  case args.state.pinky[:dir]
    when 1
      if (((args.state.pinky.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor]) < 9) ||
         ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor] < 11) && (args.state.pinky.mode == :ghost_exit))
        move_x = 0
        move_y = 1
      else
        move_x = 0
        move_y = 0
      end
      args.state.pinky.y += 1 if (move_y == 0) && (((args.state.pinky.y - 2) % 4) != 0)
    when 2
      if (((args.state.pinky.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1]) < 9)
        move_x = 1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
        args.state.pinky.x += 1 if (move_x == 0) && (((args.state.pinky.x - 1) % 4) != 0)
    when 3
      if (((args.state.pinky.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor - 1][(point_x / 4).floor]) < 9)
        move_x = 0
        move_y = -1
      else
        move_x = 0
        move_y = 0
      end
        args.state.pinky.y -= 1 if (move_y == 0) && (((args.state.pinky.y - 2) % 4) != 0)
    when 4
      if (((args.state.pinky.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1]) < 9)
        move_x = -1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
      args.state.pinky.x -= 1 if (move_x == 0) && (((args.state.pinky.x - 1) % 4) != 0)
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  #if args.state.pinky_in_a_corner == :yes && args.state.pinky.skip_frame == :true && args.state.pinky.pen == :no
  if args.state.pinky.skip_frame == :true && args.state.pinky.pen == :no
    args.state.pinky.skip_frame = :false
    return
  end

  args.state.pinky.x += move_x
  args.state.pinky.y += move_y

  point_to_grid_pinky args, args.state.pinky.x, args.state.pinky.y

  # Ok we have moved, check if we are in a corner or at a junction where a turn decision/change of direction happens
  # 1 is an oridinary dot
  # 2 is a power pill
  # 3 is a junction, with a dot
  # 4 is a junction, without a dot
  # 5 is a corner, with a dot
  # 6 is a corner, without a dot

  args.state.pinky_in_a_corner = :no
  args.state.pinky_in_a_junction = :no
  pinky_over = args.state.maze[args.state.pinky.grid_y][args.state.pinky.grid_x]

  if (pinky_over == 5 || pinky_over == 6 || pinky_over == 7) && (((args.state.pinky.x - 1 ) % 4) == 0) && (((args.state.pinky.y - 2 ) % 4) == 0)
    args.state.pinky_in_a_corner = :yes
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  #if args.state.pinky_in_a_corner == :yes && args.state.pinky.skip_frame == :true && args.state.pinky.pen == :no
  #if args.state.pinky.skip_frame == :true && args.state.pinky.pen == :no
  #  args.state.pinky.skip_frame = :false
  #  return
  #end

  if (pinky_over == 3 || pinky_over == 4) && (((args.state.pinky.x - 1 ) % 4) == 0) && (((args.state.pinky.y - 2 ) % 4) == 0)
    args.state.pinky_in_a_junction = :yes
  end

  allowed_up = :no
  allowed_right = :no
  allowed_down = :no
  allowed_left = :no
  if args.state.pinky_in_a_corner == :yes || args.state.pinky_in_a_junction == :yes
    # we are at a corner or junction, capture the grid coordinates of the four possible options
    grid_up_x    = args.state.pinky.grid_x
    grid_up_y    = args.state.pinky.grid_y + 1

    grid_right_x = args.state.pinky.grid_x + 1
    grid_right_y = args.state.pinky.grid_y

    grid_down_x  = args.state.pinky.grid_x
    grid_down_y  = args.state.pinky.grid_y - 1

    grid_left_x  = args.state.pinky.grid_x - 1
    grid_left_y  = args.state.pinky.grid_y

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
    elsif ((args.state.maze[grid_up_y][grid_up_x] < 11) && (args.state.pinky.mode == :ghost_exit))
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
    if args.state.pinky_in_a_corner == :yes
      args.state.pinky.skip_frame = :true unless args.state.pinky.pen == :yes
      case args.state.pinky.dir
        when 1
        # if going up, check left and right
          args.state.pinky.dir = 2 if allowed_right == :yes
          args.state.pinky.dir = 4 if allowed_left == :yes
        when 2
          # if going right, check up and down
          args.state.pinky.dir = 1 if allowed_up == :yes
          args.state.pinky.dir = 3 if allowed_down == :yes
          args.state.pinky.dir = 4 if ((allowed_left == :yes) && (args.state.pinky.pen == :yes))
        when 3
          # if going down, check left and right
          args.state.pinky.dir = 2 if allowed_right == :yes
          args.state.pinky.dir = 4 if allowed_left == :yes
        when 4
          # if going left, check up and down
          args.state.pinky.dir = 1 if allowed_up == :yes
          args.state.pinky.dir = 3 if allowed_down == :yes
          args.state.pinky.dir = 2 if ((allowed_right == :yes) && (args.state.pinky.pen == :yes))
      end
    end

    # for a junction loop over the directions optionally skipping the opposite
    # To break a tie, the ghost prefers directions in this order: up, left, down, right
    if args.state.pinky_in_a_junction == :yes
    # this sets a default in the case there is a tie in the distance
      case args.state.pinky.dir
        when 1 # up
        # if going up, check left, right and up
          args.state.pinky.dir = 2 if allowed_right == :yes
          # args.state.pinky.dir = 3 if (allowed_down == :yes && args.state.pinky.mode == :scatter)
          args.state.pinky.dir = 4 if allowed_left == :yes
          args.state.pinky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:down) # unless args.state.pinky.mode == :scatter
        when 2 # right
          # if going right, check up, down, and right
          args.state.pinky.dir = 2 if allowed_right == :yes
          args.state.pinky.dir = 3 if allowed_down == :yes
          # args.state.pinky.dir = 4 if (allowed_left == :yes && args.state.pinky.mode == :scatter)
          args.state.pinky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:left) # unless args.state.pinky.mode == :scatter
        when 3 # down
          # if going down, check left, right, and down
          args.state.pinky.dir = 2 if allowed_right == :yes
          args.state.pinky.dir = 3 if allowed_down == :yes
          args.state.pinky.dir = 4 if allowed_left == :yes
          # args.state.pinky.dir = 1 if (allowed_up == :yes && args.state.pinky.mode == :scatter)
          points_to_check.delete(:up) # unless args.state.pinky.mode == :scatter
        when 4 # left
          # if going left, check up, down and left
          # args.state.pinky.dir = 2 if (allowed_right == :yes && args.state.pinky.mode == :scatter)
          args.state.pinky.dir = 3 if allowed_down == :yes
          args.state.pinky.dir = 4 if allowed_left == :yes
          args.state.pinky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:right) # unless args.state.pinky.mode == :scatter
      end

      # check if we have a shortest distance to target without a tie
      distances = {}

      if args.state.pinky.mode == :scatter
        target_x = args.state.pinky.home_x
        target_y = args.state.pinky.home_y
      else
        target_x = args.state.pinky.target_x
        target_y = args.state.pinky.target_y
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
            args.state.pinky.dir = 1
          when :right
            args.state.pinky.dir = 2
          when :down
            args.state.pinky.dir = 3
          when :left
            args.state.pinky.dir = 4
        end
      end
    end
  end
  args.state.pinky.allowed_up = allowed_up
  args.state.pinky.allowed_right = allowed_right
  args.state.pinky.allowed_down = allowed_down
  args.state.pinky.allowed_left = allowed_left

  if args.state.pinky.mode == :eyes
    # ghost is just above the pen, put him in it
    if ((args.state.pinky.grid_x == 16) && (args.state.pinky.grid_y == 22))
      args.state.pinky.speed = 10
      args.state.pinky.pen = :yes
      args.state.pinky.mode = :chase
      args.state.pinky.dir = 4
      args.state.pinky.x = 67
      args.state.pinky.y = 78
      args.state.pinky.grid_x = 16
      args.state.pinky.grid_y = 19
      args.state.pinky.entered_pen_time = Kernel.tick_count
      args.state.pinky.target_x = 15 # a square north of the pen exit
      args.state.pinky.target_y = 25
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

def move_inky(args)
  # move routine for when ghost is outside the pen only
  # return unless args.state.inky.pen == :no

  # e needs Pac-Man's current tile/orientation and Blinky's current tile to calculate his final target
  # To determine Inky's target, we must first establish an intermediate offset two tiles in front of Pac-Man in the direction
  # he is moving. Now imagine drawing a vector from the center of the red ghost's current tile to the center of the offset tile,
  # then double the vector length by extending it out just as far again beyond the offset tile.

  # Inputs (Pac-Man's position and direction, Blinky's position)
  #pac_x, pac_y = 10, 10
  #pac_dir = :right  # Can be :up, :down, :left, or :right
  #blinky_x, blinky_y = 8, 8
  # Step 1: Calculate the intermediate offset tile (2 tiles ahead of Pac-Man)

  offset_x, offset_y = args.state.inky.offset[args.state.pacman.dir]
  #putz "offset x, y: #{offset_x}, #{offset_y}"
  intermediate_x = args.state.pacman.grid_x + offset_x
  intermediate_y = args.state.pacman.grid_y + offset_y
  #putz "intermediate x, y: #{intermediate_x}, #{intermediate_y}"

  #grid_x = args.state.pinky.target_x
  #grid_y = args.state.pinky.target_y

  # Step 2: Calculate the vector from Blinky to the intermediate tile
  vector_x = intermediate_x - args.state.blinky.grid_x
  vector_y = intermediate_y - args.state.blinky.grid_y
  #putz "vector x, y: #{vector_x}, #{vector_y}"

  # Calculate the screen coordinates for the highlighted grid cell
  # Step 3: Double the vector to get Inky's target
  inky_target_x = intermediate_x + vector_x
  inky_target_y = intermediate_y + vector_y
  #putz "inky target x, y: #{inky_target_x}, #{inky_target_y}"

  #tx.cap_min_max(4, 29)
  #ty.cap_min_max(4, 32)

=begin
# Output Inky's target position
puts "Inky's target position is (#{inky_target_x}, #{inky_target_y})"

=end

  #set target square to where pacman is
  if args.state.inky.mode == :chase
    #args.state.inky.target_x = args.state.pacman.grid_x
    #args.state.inky.target_y = args.state.pacman.grid_y
    args.state.inky.target_x = inky_target_x.cap_min_max(4, 29)
    args.state.inky.target_y = inky_target_y.cap_min_max(4, 32)

  end

=begin
  if args.state.pinky.mode == :chase
    #tx = args.state.pacman.grid_x
    #ty = args.state.pacman.grid_y
    # set target square offset four tiles away from pacman in the direction pacman is currently moving
    case args.state.pacman.dir
      # up
      when 1
        tx = args.state.pacman.grid_x
        ty = args.state.pacman.grid_y + 4

      # right
      when 2
        tx = args.state.pacman.grid_x + 4
        ty = args.state.pacman.grid_y

      # down
      when 3
        tx = args.state.pacman.grid_x
        ty = args.state.pacman.grid_y - 4

      # left
      when 4
        tx = args.state.pacman.grid_x - 4
        ty = args.state.pacman.grid_y
    end

  #tx.cap_min_max(4, 29)
  #ty.cap_min_max(4, 32)
  # if args.state.pinky.mode == :chase
    args.state.pinky.target_x = tx
    args.state.pinky.target_y = ty
  end

  move_x = args.state.pinky.move_x
  move_y = args.state.pinky.move_y
  point_x = args.state.pinky.x
  point_y = args.state.pinky.y

=end

  move_x = args.state.inky.move_x
  move_y = args.state.inky.move_y
  point_x = args.state.inky.x
  point_y = args.state.inky.y

  # try to move forward
  case args.state.inky[:dir]
    when 1
      if (((args.state.inky.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor]) < 9) ||
         ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor] < 11) && (args.state.inky.mode == :ghost_exit))
        move_x = 0
        move_y = 1
      else
        move_x = 0
        move_y = 0
      end
      args.state.inky.y += 1 if (move_y == 0) && (((args.state.inky.y - 2) % 4) != 0)
    when 2
      if (((args.state.inky.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1]) < 9)
        move_x = 1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
        args.state.inky.x += 1 if (move_x == 0) && (((args.state.inky.x - 1) % 4) != 0)
    when 3
      if (((args.state.inky.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor - 1][(point_x / 4).floor]) < 9)
        move_x = 0
        move_y = -1
      else
        move_x = 0
        move_y = 0
      end
        args.state.inky.y -= 1 if (move_y == 0) && (((args.state.inky.y - 2) % 4) != 0)
    when 4
      if (((args.state.inky.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1]) < 9)
        move_x = -1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
      args.state.inky.x -= 1 if (move_x == 0) && (((args.state.inky.x - 1) % 4) != 0)
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  # if args.state.inky_in_a_corner == :yes && args.state.inky.skip_frame == :true && args.state.inky.pen == :no
  if args.state.inky.skip_frame == :true && args.state.inky.pen == :no
    args.state.inky.skip_frame = :false
    return
  end

  args.state.inky.x += move_x
  args.state.inky.y += move_y

  point_to_grid_inky args, args.state.inky.x, args.state.inky.y

  # Ok we have moved, check if we are in a corner or at a junction where a turn decision/change of direction happens
  # 1 is an oridinary dot
  # 2 is a power pill
  # 3 is a junction, with a dot
  # 4 is a junction, without a dot
  # 5 is a corner, with a dot
  # 6 is a corner, without a dot

  args.state.inky_in_a_corner = :no
  args.state.inky_in_a_junction = :no
  inky_over = args.state.maze[args.state.inky.grid_y][args.state.inky.grid_x]

  if (inky_over == 5 || inky_over == 6 || inky_over == 7) && (((args.state.inky.x - 1 ) % 4) == 0) && (((args.state.inky.y - 2 ) % 4) == 0)
    args.state.inky_in_a_corner = :yes
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  # if args.state.inky_in_a_corner == :yes && args.state.inky.skip_frame == :true && args.state.inky.pen == :no
  #if args.state.inky.skip_frame == :true && args.state.inky.pen == :no
  #  args.state.inky.skip_frame = :false
  #  return
  #end

  if (inky_over == 3 || inky_over == 4) && (((args.state.inky.x - 1 ) % 4) == 0) && (((args.state.inky.y - 2 ) % 4) == 0)
    args.state.inky_in_a_junction = :yes
  end

  allowed_up = :no
  allowed_right = :no
  allowed_down = :no
  allowed_left = :no
  if args.state.inky_in_a_corner == :yes || args.state.inky_in_a_junction == :yes
    # we are at a corner or junction, capture the grid coordinates of the four possible options
    grid_up_x    = args.state.inky.grid_x
    grid_up_y    = args.state.inky.grid_y + 1

    grid_right_x = args.state.inky.grid_x + 1
    grid_right_y = args.state.inky.grid_y

    grid_down_x  = args.state.inky.grid_x
    grid_down_y  = args.state.inky.grid_y - 1

    grid_left_x  = args.state.inky.grid_x - 1
    grid_left_y  = args.state.inky.grid_y

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
    elsif ((args.state.maze[grid_up_y][grid_up_x] < 11) && (args.state.inky.mode == :ghost_exit))
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
    if args.state.inky_in_a_corner == :yes
      args.state.inky.skip_frame = :true unless args.state.inky.pen == :yes
      case args.state.inky.dir
        when 1
        # if going up, check left and right
          args.state.inky.dir = 2 if allowed_right == :yes
          args.state.inky.dir = 4 if allowed_left == :yes
        when 2
          # if going right, check up and down
          args.state.inky.dir = 1 if allowed_up == :yes
          args.state.inky.dir = 3 if allowed_down == :yes
          args.state.inky.dir = 4 if ((allowed_left == :yes) && (args.state.inky.pen == :yes))
        when 3
          # if going down, check left and right
          args.state.inky.dir = 2 if allowed_right == :yes
          args.state.inky.dir = 4 if allowed_left == :yes
        when 4
          # if going left, check up and down
          args.state.inky.dir = 1 if allowed_up == :yes
          args.state.inky.dir = 3 if allowed_down == :yes
          args.state.inky.dir = 2 if ((allowed_right == :yes) && (args.state.inky.pen == :yes))
      end
    end

    # for a junction loop over the directions optionally skipping the opposite
    # To break a tie, the ghost prefers directions in this order: up, left, down, right
    if args.state.inky_in_a_junction == :yes
    # this sets a default in the case there is a tie in the distance
      case args.state.inky.dir
        when 1 # up
        # if going up, check left, right and up
          args.state.inky.dir = 2 if allowed_right == :yes
          # args.state.inky.dir = 3 if (allowed_down == :yes && args.state.inky.mode == :scatter)
          args.state.inky.dir = 4 if allowed_left == :yes
          args.state.inky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:down) # unless args.state.inky.mode == :scatter
        when 2 # right
          # if going right, check up, down, and right
          args.state.inky.dir = 2 if allowed_right == :yes
          args.state.inky.dir = 3 if allowed_down == :yes
          # args.state.inky.dir = 4 if (allowed_left == :yes && args.state.inky.mode == :scatter)
          args.state.inky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:left) # unless args.state.inky.mode == :scatter
        when 3 # down
          # if going down, check left, right, and down
          args.state.inky.dir = 2 if allowed_right == :yes
          args.state.inky.dir = 3 if allowed_down == :yes
          args.state.inky.dir = 4 if allowed_left == :yes
          # args.state.inky.dir = 1 if (allowed_up == :yes && args.state.inky.mode == :scatter)
          points_to_check.delete(:up) # unless args.state.inky.mode == :scatter
        when 4 # left
          # if going left, check up, down and left
          # args.state.inky.dir = 2 if (allowed_right == :yes && args.state.inky.mode == :scatter)
          args.state.inky.dir = 3 if allowed_down == :yes
          args.state.inky.dir = 4 if allowed_left == :yes
          args.state.inky.dir = 1 if allowed_up == :yes
          points_to_check.delete(:right) # unless args.state.inky.mode == :scatter
      end

      # check if we have a shortest distance to target without a tie
      distances = {}

      if args.state.inky.mode == :scatter
        target_x = args.state.inky.home_x
        target_y = args.state.inky.home_y
      else
        target_x = args.state.inky.target_x
        target_y = args.state.inky.target_y
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
            args.state.inky.dir = 1
          when :right
            args.state.inky.dir = 2
          when :down
            args.state.inky.dir = 3
          when :left
            args.state.inky.dir = 4
        end
      end
    end
  end
  args.state.inky.allowed_up = allowed_up
  args.state.inky.allowed_right = allowed_right
  args.state.inky.allowed_down = allowed_down
  args.state.inky.allowed_left = allowed_left

  if args.state.inky.mode == :eyes
    # ghost is just above the pen, put him in it
    if ((args.state.inky.grid_x == 16) && (args.state.inky.grid_y == 22))
      args.state.inky.speed = 10
      args.state.inky.pen = :yes
      args.state.inky.mode = :chase
      args.state.inky.dir = 4
      args.state.inky.x = 67
      args.state.inky.y = 78
      args.state.inky.grid_x = 16
      args.state.inky.grid_y = 19
      args.state.inky.entered_pen_time = Kernel.tick_count
      args.state.inky.target_x = 15 # a square north of the pen exit
      args.state.inky.target_y = 25
    end
  end
end

def move_clyde(args)
  # move routine for when ghost is outside the pen only
  # return unless args.state.clyde.pen == :no

  # During chase mode, Clyde's targeting logic changes based on his proximity to Pac-Man.
  # He first calculates the Euclidean distance between his tile and Pac-Man's tile.
  # If the distance between them is eight tiles or more, Clyde targets Pac-Man directly just as Blinky does.
  # If the distance between them is less than eight tiles, however, Clyde switches his target to the tile he normally
  # uses during scatter mode and heads for his corner until he gets far enough away to start targeting Pac-Man again

  # calc the distance from clyde to pacman
  # putz "distance: #{distance(args.state.clyde.grid_x, args.state.clyde.grid_y, args.state.pacman.grid_x, args.state.pacman.grid_y)}"

  #set target square to where pacman is
  if args.state.clyde.mode == :chase
    if distance(args.state.clyde.grid_x, args.state.clyde.grid_y, args.state.pacman.grid_x, args.state.pacman.grid_y) > 65
      # puts60 "chase"
      args.state.clyde.target_x = args.state.pacman.grid_x
      args.state.clyde.target_y = args.state.pacman.grid_y
    else
      # puts60 "flee"
      args.state.clyde.target_x = args.state.clyde.home_x
      args.state.clyde.target_y = args.state.clyde.home_y
    end
  end

  move_x = args.state.clyde.move_x
  move_y = args.state.clyde.move_y
  point_x = args.state.clyde.x
  point_y = args.state.clyde.y

  # try to move forward
  case args.state.clyde[:dir]
    when 1
      if (((args.state.clyde.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor]) < 9) ||
         ((args.state.maze[(point_y / 4).floor + 1][(point_x / 4).floor] < 11) && (args.state.clyde.mode == :ghost_exit))
        move_x = 0
        move_y = 1
      else
        move_x = 0
        move_y = 0
      end
      args.state.clyde.y += 1 if (move_y == 0) && (((args.state.clyde.y - 2) % 4) != 0)
    when 2
      if (((args.state.clyde.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor + 1]) < 9)
        move_x = 1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
        args.state.clyde.x += 1 if (move_x == 0) && (((args.state.clyde.x - 1) % 4) != 0)
    when 3
      if (((args.state.clyde.x - 1) % 4) == 0) && ((args.state.maze[(point_y / 4).floor - 1][(point_x / 4).floor]) < 9)
        move_x = 0
        move_y = -1
      else
        move_x = 0
        move_y = 0
      end
        args.state.clyde.y -= 1 if (move_y == 0) && (((args.state.clyde.y - 2) % 4) != 0)
    when 4
      if (((args.state.clyde.y + 2) % 4) == 0) && ((args.state.maze[(point_y / 4).floor][(point_x / 4).floor - 1]) < 9)
        move_x = -1
        move_y = 0
      else
        move_x = 0
        move_y = 0
      end
      args.state.clyde.x -= 1 if (move_x == 0) && (((args.state.clyde.x - 1) % 4) != 0)
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  # if args.state.clyde_in_a_corner == :yes && args.state.clyde.skip_frame == :true && args.state.clyde.pen == :no
  if args.state.clyde.skip_frame == :true && args.state.clyde.pen == :no
    args.state.clyde.skip_frame = :false
    return
  end

  args.state.clyde.x += move_x
  args.state.clyde.y += move_y

  point_to_grid_clyde args, args.state.clyde.x, args.state.clyde.y

  # Ok we have moved, check if we are in a corner or at a junction where a turn decision/change of direction happens
  # 1 is an oridinary dot
  # 2 is a power pill
  # 3 is a junction, with a dot
  # 4 is a junction, without a dot
  # 5 is a corner, with a dot
  # 6 is a corner, without a dot

  args.state.clyde_in_a_corner = :no
  args.state.clyde_in_a_junction = :no
  clyde_over = args.state.maze[args.state.clyde.grid_y][args.state.clyde.grid_x]

  if (clyde_over == 5 || clyde_over == 6 || clyde_over == 7) && (((args.state.clyde.x - 1 ) % 4) == 0) && (((args.state.clyde.y - 2 ) % 4) == 0)
    args.state.clyde_in_a_corner = :yes
  end

  # stall ghost slightly in a corner, helps a tiny bit ;)
  # if args.state.clyde_in_a_corner == :yes && args.state.clyde.skip_frame == :true && args.state.clyde.pen == :no
  #if args.state.clyde.skip_frame == :true && args.state.clyde.pen == :no
  #  args.state.clyde.skip_frame = :false
  #  return
  #end

  if (clyde_over == 3 || clyde_over == 4) && (((args.state.clyde.x - 1 ) % 4) == 0) && (((args.state.clyde.y - 2 ) % 4) == 0)
    args.state.clyde_in_a_junction = :yes
  end

  allowed_up = :no
  allowed_right = :no
  allowed_down = :no
  allowed_left = :no
  if args.state.clyde_in_a_corner == :yes || args.state.clyde_in_a_junction == :yes
    # we are at a corner or junction, capture the grid coordinates of the four possible options
    grid_up_x    = args.state.clyde.grid_x
    grid_up_y    = args.state.clyde.grid_y + 1

    grid_right_x = args.state.clyde.grid_x + 1
    grid_right_y = args.state.clyde.grid_y

    grid_down_x  = args.state.clyde.grid_x
    grid_down_y  = args.state.clyde.grid_y - 1

    grid_left_x  = args.state.clyde.grid_x - 1
    grid_left_y  = args.state.clyde.grid_y

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
    elsif ((args.state.maze[grid_up_y][grid_up_x] < 11) && (args.state.clyde.mode == :ghost_exit))
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
    if args.state.clyde_in_a_corner == :yes
      args.state.clyde.skip_frame = :true unless args.state.clyde.pen == :yes
      case args.state.clyde.dir
        when 1
        # if going up, check left and right
          args.state.clyde.dir = 2 if allowed_right == :yes
          args.state.clyde.dir = 4 if allowed_left == :yes
        when 2
          # if going right, check up and down
          args.state.clyde.dir = 1 if allowed_up == :yes
          args.state.clyde.dir = 3 if allowed_down == :yes
          args.state.clyde.dir = 4 if ((allowed_left == :yes) && (args.state.clyde.pen == :yes))
        when 3
          # if going down, check left and right
          args.state.clyde.dir = 2 if allowed_right == :yes
          args.state.clyde.dir = 4 if allowed_left == :yes
        when 4
          # if going left, check up and down
          args.state.clyde.dir = 1 if allowed_up == :yes
          args.state.clyde.dir = 3 if allowed_down == :yes
          args.state.clyde.dir = 2 if ((allowed_right == :yes) && (args.state.clyde.pen == :yes))
      end
    end

    # for a junction loop over the directions optionally skipping the opposite
    # To break a tie, the ghost prefers directions in this order: up, left, down, right
    if args.state.clyde_in_a_junction == :yes
    # this sets a default in the case there is a tie in the distance
      case args.state.clyde.dir
        when 1 # up
        # if going up, check left, right and up
          args.state.clyde.dir = 2 if allowed_right == :yes
          # args.state.clyde.dir = 3 if (allowed_down == :yes && args.state.clyde.mode == :scatter)
          args.state.clyde.dir = 4 if allowed_left == :yes
          args.state.clyde.dir = 1 if allowed_up == :yes
          points_to_check.delete(:down) # unless args.state.clyde.mode == :scatter
        when 2 # right
          # if going right, check up, down, and right
          args.state.clyde.dir = 2 if allowed_right == :yes
          args.state.clyde.dir = 3 if allowed_down == :yes
          # args.state.clyde.dir = 4 if (allowed_left == :yes && args.state.clyde.mode == :scatter)
          args.state.clyde.dir = 1 if allowed_up == :yes
          points_to_check.delete(:left) # unless args.state.clyde.mode == :scatter
        when 3 # down
          # if going down, check left, right, and down
          args.state.clyde.dir = 2 if allowed_right == :yes
          args.state.clyde.dir = 3 if allowed_down == :yes
          args.state.clyde.dir = 4 if allowed_left == :yes
          # args.state.clyde.dir = 1 if (allowed_up == :yes && args.state.clyde.mode == :scatter)
          points_to_check.delete(:up) # unless args.state.clyde.mode == :scatter
        when 4 # left
          # if going left, check up, down and left
          # args.state.clyde.dir = 2 if (allowed_right == :yes && args.state.clyde.mode == :scatter)
          args.state.clyde.dir = 3 if allowed_down == :yes
          args.state.clyde.dir = 4 if allowed_left == :yes
          args.state.clyde.dir = 1 if allowed_up == :yes
          points_to_check.delete(:right) # unless args.state.clyde.mode == :scatter
      end

      # check if we have a shortest distance to target without a tie
      distances = {}

      if args.state.clyde.mode == :scatter
        target_x = args.state.clyde.home_x
        target_y = args.state.clyde.home_y
      else
        target_x = args.state.clyde.target_x
        target_y = args.state.clyde.target_y
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
            args.state.clyde.dir = 1
          when :right
            args.state.clyde.dir = 2
          when :down
            args.state.clyde.dir = 3
          when :left
            args.state.clyde.dir = 4
        end
      end
    end
  end
  args.state.clyde.allowed_up = allowed_up
  args.state.clyde.allowed_right = allowed_right
  args.state.clyde.allowed_down = allowed_down
  args.state.clyde.allowed_left = allowed_left

  if args.state.clyde.mode == :eyes
    # ghost is just above the pen, put him in it
    if ((args.state.clyde.grid_x == 16) && (args.state.clyde.grid_y == 22))
      args.state.clyde.speed = 10
      args.state.clyde.pen = :yes
      args.state.clyde.mode = :chase
      args.state.clyde.dir = 4
      args.state.clyde.x = 67
      args.state.clyde.y = 78
      args.state.clyde.grid_x = 16
      args.state.clyde.grid_y = 19
      args.state.clyde.entered_pen_time = Kernel.tick_count
      args.state.clyde.target_x = 15 # a square north of the pen exit
      args.state.clyde.target_y = 25
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
  args.state.pinky.entered_pen_time = Kernel.tick_count
  args.state.inky.entered_pen_time = Kernel.tick_count + 120
  args.state.clyde.entered_pen_time = Kernel.tick_count + 240
  args.state.fruit_timer_start = Kernel.tick_count
  args.state.draw_fruit = :false
end

def draw_game_over(args)
  args.lowrez.labels  << {
    x: 34,
    y: 57,
    text: "Game Over",
    size_enum: LOWREZ_FONT_TI,
    alignment_enum: 1,
    r: 0xF4, # f4ec9b
    g: 0xEC,
    b: 0x9B,
    a: 255,
    font: LOWREZ_FONT_PATH
  }
  args.state.pinky.entered_pen_time = Kernel.tick_count
  args.state.inky.entered_pen_time = Kernel.tick_count + 120
  args.state.clyde.entered_pen_time = Kernel.tick_count + 240
end


def grid_highlight(args)
  grid_x = args.state.pacman.grid_x
  grid_y = args.state.pacman.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * 4 - args.state.pacman.mx
  y = grid_y * 4 - args.state.pacman.my

  args.lowrez.primitives << {
    x: x,
    y: y,
    w: 4,
    h: 4,
    r: 255,
    g: 0,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def target_highlight_pinky(args)
  grid_x = args.state.pinky.target_x
  grid_y = args.state.pinky.target_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * 4
  y = grid_y * 4

  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + x,
    y: (0 - args.state.pacman.my) + y,
    w: 4,
    h: 4,
    r: 0,
    g: 255,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def grid_highlight_blinky(args)
  grid_x = args.state.blinky.grid_x
  grid_y = args.state.blinky.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * 4
  y = grid_y * 4

  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + x,
    y: (0 - args.state.pacman.my) + y,
    w: 4,
    h: 4,
    r: 0,
    g: 255,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def grid_highlight_pinky(args)
  grid_x = args.state.pinky.grid_x
  grid_y = args.state.pinky.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * 4
  y = grid_y * 4

  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + x,
    y: (0 - args.state.pacman.my) + y,
    w: 4,
    h: 4,
    r: 0,
    g: 255,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def grid_highlight_inky(args)
  grid_x = args.state.inky.grid_x
  grid_y = args.state.inky.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * 4
  y = grid_y * 4

  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + x,
    y: (0 - args.state.pacman.my) + y,
    w: 4,
    h: 4,
    r: 0,
    g: 255,
    b: 0,
    a: 128,
    path: :pixel
  }
end

def grid_highlight_clyde(args)
  grid_x = args.state.clyde.grid_x
  grid_y = args.state.clyde.grid_y

  # Calculate the screen coordinates for the highlighted grid cell
  x = grid_x * 4
  y = grid_y * 4

  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + x,
    y: (0 - args.state.pacman.my) + y,
    w: 4,
    h: 4,
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


def point_to_grid_blinky(args, point_x, point_y)
  # determine which grid section a point is in
  size_x = 4 # 136 / 34
  size_y = 4 # 148 / 37

  args.state.blinky.grid_x = (point_x / size_x).floor
  args.state.blinky.grid_y = (point_y / size_y).floor
end

def point_to_grid_pinky(args, point_x, point_y)
  # determine which grid section a point is in
  size_x = 4 # 136 / 34
  size_y = 4 # 148 / 37

  args.state.pinky.grid_x = (point_x / size_x).floor
  args.state.pinky.grid_y = (point_y / size_y).floor
end

def point_to_grid_inky(args, point_x, point_y)
  # determine which grid section a point is in
  size_x = 4 # 136 / 34
  size_y = 4 # 148 / 37

  args.state.inky.grid_x = (point_x / size_x).floor
  args.state.inky.grid_y = (point_y / size_y).floor
end

def point_to_grid_clyde(args, point_x, point_y)
  # determine which grid section a point is in
  size_x = 4 # 136 / 34
  size_y = 4 # 148 / 37

  args.state.clyde.grid_x = (point_x / size_x).floor
  args.state.clyde.grid_y = (point_y / size_y).floor
end

# 1 up, 2 right, 3 down, 4 left (0 for stationary until a key is pressed)
def player_input(args)
  move_x = args.state.pacman.move_x
  move_y = args.state.pacman.move_y

  point_x = 32 + args.state.pacman.mx
  point_y = 31 + args.state.pacman.my

  return if args.state.level_complete == true
  return if args.state.pacman_is_dead == true

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

  # update grid with new value when eating dots
  case args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x]
    when 1
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 0
      args.state.pacman.score += 10
      args.state.dots_eaten += 1
      # puts60 "sounds that are paused: #{args.audio.select { |_, sound| sound[:paused] == true }.length}"
      # args.audio[:win].paused = false if args.state.ship.state == :win unless args.audio[:win].nil?
      # args.audio[:title].playtime = 0
      args.audio[:small_dots] ||= {
        input: 'sounds/wakka-wakka.ogg',  # Filename
        x: 0.0, y: 0.0, z: 0.0,      # Relative position to the listener, x, y, z from -1.0 to 1.0
        gain: 1.0,                   # Volume (0.0 to 1.0)
        pitch: 1.0,                  # Pitch of the sound (1.0 = original pitch)
        paused: false,               # Set to true to pause the sound at the current playback position
        looping: false               # Set to true to loop the sound/music until you stop it
      }
    when 3
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 4
      args.state.pacman.score += 10
      args.state.dots_eaten += 1
    when 5
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 6
      args.state.pacman.score += 10
      args.state.dots_eaten += 1
    when 2
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 0
      args.state.pacman.score += 50
      args.state.dots_eaten += 1
      args.state.pacman.powered_up = Kernel.tick_count
      # play the big dot sound
      args.audio[rand] = {
        input: 'sounds/big-dot.ogg',  # Filename
        x: 0.0, y: 0.0, z: 0.0,      # Relative position to the listener, x, y, z from -1.0 to 1.0
        gain: 1.0,                   # Volume (0.0 to 1.0)
        pitch: 1.0,                  # Pitch of the sound (1.0 = original pitch)
        paused: false,               # Set to true to pause the sound at the current playback position
        looping: false               # Set to true to loop the sound/music until you stop it
      }

      # blinky
      unless args.state.blinky.mode ==:eyes || args.state.blinky.pen == :yes
        args.state.blinky.speed = 8
        args.state.blinky.mode = :scatter
      end

      # pinky
      unless args.state.pinky.mode ==:eyes || args.state.pinky.pen == :yes
        args.state.pinky.speed = 8
        args.state.pinky.mode = :scatter
      end

      # inky
      unless args.state.inky.mode ==:eyes || args.state.inky.pen == :yes
        args.state.inky.speed = 8
        args.state.inky.mode = :scatter
      end

      # clyde
      unless args.state.clyde.mode ==:eyes || args.state.clyde.pen == :yes
        args.state.clyde.speed = 8
        args.state.clyde.mode = :scatter
      end
    when 7
      args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x] = 6
      args.state.pacman.score += 50
      args.state.dots_eaten += 1
      args.state.pacman.powered_up = Kernel.tick_count
      # play the big dot sound
      args.audio[rand] = {
        input: 'sounds/big-dot.ogg',  # Filename
        x: 0.0, y: 0.0, z: 0.0,      # Relative position to the listener, x, y, z from -1.0 to 1.0
        gain: 0.2,                   # Volume (0.0 to 1.0)
        pitch: 1.0,                  # Pitch of the sound (1.0 = original pitch)
        paused: false,               # Set to true to pause the sound at the current playback position
        looping: false                # Set to true to loop the sound/music until you stop it
      }

      # blinky
      unless args.state.blinky.mode ==:eyes || args.state.blinky.pen == :yes
        args.state.blinky.speed = 8
        args.state.blinky.mode = :scatter
      end

      # pinky
      unless args.state.pinky.mode ==:eyes || args.state.pinky.pen == :yes
        args.state.pinky.speed = 8
        args.state.pinky.mode = :scatter
      end

      # inky
      unless args.state.inky.mode ==:eyes || args.state.inky.pen == :yes
        args.state.inky.speed = 8
        args.state.inky.mode = :scatter
      end

      # clyde
      unless args.state.clyde.mode ==:eyes || args.state.clyde.pen == :yes
        args.state.clyde.speed = 8
        args.state.clyde.mode = :scatter
      end
  end

  args.state.pacman.move_x = move_x
  args.state.pacman.move_y = move_y
  
  #unless args.state.level_complete == true
    args.state.pacman.mx += move_x
    args.state.pacman.my += move_y
  #end

  # args.state.map_origin_x = 32 + args.state.pacman.mx
  # args.state.map_origin_y = 31 + args.state.pacman.my

  point_to_grid args, (32 + args.state.pacman.mx), (31 + args.state.pacman.my)
end

def draw_blinky(args)
  sprite_path  = "sprites/blinky-#{args.state.blinky.dir}.png"
  sprite_path  = "sprites/ghost-flee.png" if args.state.blinky.mode == :scatter
  sprite_path  = "sprites/ghost-eyes-#{args.state.blinky.dir}.png" if args.state.blinky.mode == :eyes
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + args.state.blinky.x,
    y: (0 - args.state.pacman.my) + args.state.blinky.y,
    w: 8,
    h: 8,
    path: sprite_path,
    anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
    anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
    angle: 0
  }
end

def draw_pinky(args)
  sprite_path  = "sprites/pinky-#{args.state.pinky.dir}.png"
  sprite_path  = "sprites/ghost-flee.png" if args.state.pinky.mode == :scatter
  sprite_path  = "sprites/ghost-eyes-#{args.state.pinky.dir}.png" if args.state.pinky.mode == :eyes
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + args.state.pinky.x,
    y: (0 - args.state.pacman.my) + args.state.pinky.y,
    w: 8,
    h: 8,
    path: sprite_path,
    anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
    anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
    angle: 0
  }
end

def draw_inky(args)
  sprite_path  = "sprites/inky-#{args.state.inky.dir}.png"
  sprite_path  = "sprites/ghost-flee.png" if args.state.inky.mode == :scatter
  sprite_path  = "sprites/ghost-eyes-#{args.state.inky.dir}.png" if args.state.inky.mode == :eyes
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + args.state.inky.x,
    y: (0 - args.state.pacman.my) + args.state.inky.y,
    w: 8,
    h: 8,
    path: sprite_path,
    anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
    anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
    angle: 0
  }
end

def draw_clyde(args)
  sprite_path  = "sprites/clyde-#{args.state.clyde.dir}.png"
  sprite_path  = "sprites/ghost-flee.png" if args.state.clyde.mode == :scatter
  sprite_path  = "sprites/ghost-eyes-#{args.state.clyde.dir}.png" if args.state.clyde.mode == :eyes
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx + 1) + args.state.clyde.x,
    y: (0 - args.state.pacman.my) + args.state.clyde.y,
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

  args.state.pacman.anim = :no if args.state.level_complete == true
  if args.state.pacman.anim == :yes
    sprite_index = start_animation_on_tick.frame_index count: 3,     # how many sprites?
                                                       hold_for: 4, # how long to hold each sprite?
                                                       repeat: true  # should it repeat?
    args.state.pacman.frame = sprite_index
  else
    sprite_index = args.state.pacman.frame
  end

  if sprite_index
    sprite_path  = "sprites/lowrez-pac-#{sprite_index}.png"
    args.lowrez.primitives << {
      x: args.state.pacman[:x] + args.state.pacman.offset[args.state.pacman.dir].x,
      y: args.state.pacman[:y] + args.state.pacman.offset[args.state.pacman.dir].y,
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

def draw_pacman_death_anim(args)
  # start_animation_on_tick = 1
  # args.state.pacman.anim = :no if args.state.level_complete == true
  if args.state.pacman_is_dead == true
    sprite_index = args.state.death_start.frame_index count: 12,     # how many sprites?
                                                     hold_for: 9,   # how long to hold each sprite?
                                                      repeat: false  # should it repeat?
  #args.state.pacman.frame = sprite_index
  #else
    #  sprite_index = 0
  end
  
  # args.state.new_wave = nil
  # putz "sprite index: #{sprite_index}"

  if sprite_index
    sprite_path  = "sprites/pac-death-#{sprite_index}.png"
    args.lowrez.primitives << {
      x: args.state.pacman[:x] + args.state.pacman.offset[1].x,
      y: args.state.pacman[:y] + args.state.pacman.offset[1].y,
      w: 8,
      h: 8,
      path: sprite_path,
      anchor_x: 0.5, # position horizontally at 0.5 of the sprite's width
      anchor_y: 0.5, # position vertically at 0.5 of the sprite's height
      angle: 0
    }
  #else
  #  countdown_in_seconds = ((start_animation_on_tick - Kernel.tick_count) / 60).round(1)
  else
    args.state.new_level_timer ||= Kernel.tick_count
    args.state.game_over_timer ||= Kernel.tick_count

    if args.state.new_level_timer.elapsed_time > 60
      args.state.new_wave = :true
      args.state.pacman.lives -= 1
      args.state.draw_fruit = :false
      
      args.state.game_over = :true if args.state.pacman.lives < 0

      current_score = args.state.pacman.score
      current_lives = args.state.pacman.lives
      init args unless args.state.game_over == :true
      args.state.pacman.lives = current_lives
      args.state.pacman.score = current_score
      args.state.pacman_is_dead = nil unless args.state.game_over == :true
    end unless args.state.game_over == :true
    
    if args.state.game_over == :true
      draw_game_over args
      # we stay here until the player releases a key
      
      #if args.inputs.keyboard.keys.down_or_held.size > 1
        #putz "something is pressed or is held"
        #putz "keys: #{args.inputs.keyboard.keys}"
        # ]}
        # - 003281 [Game] something is pressed or is held
        # - 003281 [Game] keys: {:down=>[], :held=>[], :down_or_held=>[], :up=>[]}
        # - 0032
      #else
      #  puts60 "nothing pressed/held"
      #end
      
      if args.state.key_released 
        # putz "a key is released"
        args.state.pacman_is_dead = nil
        args.state.game_over = nil
        args.state.new_wave = nil
        init args
        args.state.level_complete = :true
        args.state.pacman.lives = 3
        args.state.pacman.score = 0
        args.state.dots_eaten = 0
        args.state.key_released = nil
        args.state.next_life_threshold = 10000
        args.state.fruit_target_dots = nil
        args.state.bonus_shown = nil
        args.state.bonus_active = nil
        args.state.bonus_timer = nil
      end
        
      # keys: {:down=>[:left_arrow, :raw_key], :held=>[], :down_or_held=>[:left_arrow, :raw_key], :up=>[]}
        
      if args.inputs.keyboard.keys.down_or_held.size > 1
        #putz "a key is pressed"
        #putz "keys: #{args.inputs.keyboard.keys}"
        # Set a flag when any key is pressed
        args.state.key_pressed = :true
      elsif args.state.key_pressed
        # When no key is active (released) and a key was previously pressed, set the release flag
        args.state.key_released = :true
        args.state.key_pressed = nil
      end
    end
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
      # putz "lost focus"
      # audio[:music].paused = true
    else
      # putz "gained focus"
      # audio[:music].paused = false
    end
  end
  $gtk.args.state.lost_focus = current_focus
end

def render_debug(args)
  grid_highlight args
  grid_highlight_inky args
  grid_highlight_pinky args
  grid_highlight_blinky args
  grid_highlight_clyde args
  target_highlight_pinky args
  
  # this is the point to determine which part of the grid red ghost is in
  args.lowrez.primitives << {
    x: (0 - args.state.pacman.mx) + args.state.blinky.x,
    y: (0 - args.state.pacman.my) + args.state.blinky.y,
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
    "pacman position in map mx, my:   #{32 + args.state.pacman.mx}, #{31 + args.state.pacman.my}",
    "grid position grid_x, grid_y:   #{args.state.pacman.grid_x}, #{args.state.pacman.grid_y}",
    # "pacman coors on screen x, y:    #{args.state.pacman[:x] + args.state.pacman.offset[args.state.pacman.dir].x}, #{args.state.pacman[:y] + args.state.pacman.offset[args.state.pacman.dir].y}",
    # "maze status at grid coors:      #{args.state.maze[args.state.pacman.grid_y][args.state.pacman.grid_x]}",
    # "blinky map pos mx, my:       #{32 + args.state.blinky.mx}, #{31 + args.state.blinky.my}",
    # "blinky grid grid_x, grid_y:  #{args.state.blinky.grid_x}, #{args.state.blinky.grid_y}",
    # "blinky world coors x, y:    #{args.state.blinky[:x]}, #{args.state.blinky[:y]}",
    # "args.state.map_origin ox, oy:    #{args.state.map_origin_x}, #{args.state.map_origin_y}",
    # "blinky is hovering over:     #{args.state.maze[args.state.blinky.grid_y][args.state.blinky.grid_x]}",
    # "blinky in a maze corner:     #{args.state.blinky_in_a_corner}",
    # "blinky in a maze junction:   #{args.state.blinky_in_a_junction}",
    # "blinky is allowed up:        #{args.state.blinky.allowed_up}",
    # "blinky is allowed right:     #{args.state.blinky.allowed_right}",
    # "blinky is allowed down:      #{args.state.blinky.allowed_down}",
    # "blinky is allowed left:      #{args.state.blinky.allowed_left}",
    # "blinky is direction:         #{args.state.blinky.dir}",
    # "blinky is in mode:           #{args.state.blinky.mode}",
    "pinky world coors x, y:    #{args.state.pinky[:x]}, #{args.state.pinky[:y]}",
    # "args.state.map_origin ox, oy:    #{args.state.map_origin_x}, #{args.state.map_origin_y}",
    "pinky is hovering over:     #{args.state.maze[args.state.pinky.grid_y][args.state.pinky.grid_x]}",
    "pinky in a maze corner:     #{args.state.pinky_in_a_corner}",
    "pinky in a maze junction:   #{args.state.pinky_in_a_junction}",
    "pinky is allowed up:        #{args.state.pinky.allowed_up}",
    "pinky is allowed right:     #{args.state.pinky.allowed_right}",
    "pinky is allowed down:      #{args.state.pinky.allowed_down}",
    "pinky is allowed left:      #{args.state.pinky.allowed_left}",
    "pinky is direction:         #{args.state.pinky.dir}",
    "pinky is in mode:           #{args.state.pinky.mode}",
    "pinky is in playpen:        #{args.state.pinky.pen}"
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
