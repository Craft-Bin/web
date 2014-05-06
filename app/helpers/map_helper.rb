module MapHelper

  def get_color(type)
    colors = {
        1 => '#969696',
        2 => '#74E305',
        3 => '#A36E12',
        18 => '#05FF16'
    }
    c = colors[type]
    c == nil ? 'gray' : c
  end

  def create_map(blocks, name)
    img = Magick::ImageList.new(File.join(Rails.root, 'map.png').to_s)
    default_draw_x = 20
    draw_x = default_draw_x
    draw_max = 110
    interval = 5
    draw_y = 20
    for x in 0..(blocks.length - 1)
      for z in 0..(blocks[x].length - 1)
        if draw_x > draw_max or z == blocks[x].length - 1
          draw_x = default_draw_x
          draw_y += interval
        else
          draw_x += interval
        end
        puts "doing stuff at #{x} : #{z}"
        block = blocks[x][z]
        rect = Magick::Draw.new
        color = get_color block
        rect.fill color
        rect.rectangle(draw_x, draw_y, draw_x + interval, draw_y + interval)
        rect.draw img
      end
    end
    img.write(File.join(Rails.root, name).to_s)
  end

end