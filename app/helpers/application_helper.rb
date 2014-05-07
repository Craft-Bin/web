module ApplicationHelper

  def btn(text, type=nil, options={})
    btn_options = options
    btn_options[:class] = 'btn'

    btn_options[:href] = options[:link] if options[:link]
    btn_options[:href] = options[:url] if options[:url]

    class_type = 'default'
    if %w(primary success info warning danger link).include? type.to_s
      class_type = type.to_s
    end
    btn_options[:class] += ' btn-' + class_type

    class_size = nil
    size = options[:size]
    class_size = 'lg' if size.to_s == 'lg' or size.to_s == 'large'
    class_size = 'sm' if size.to_s == 'sm' or size.to_s == 'small'
    class_size = 'xs' if size.to_s == 'xs' or size.to_s == 'extra_small' or size.to_s == 'extra small'
    if class_size
      btn_options[:class] += ' btn-' + class_size
    end
    if options[:class]
      btn_options[:class] += ' ' + options[:class].to_s
    end
    content_tag(:a, text, btn_options)
  end

  def btn_class(type)
    {:class => 'btn btn-' + type.to_s}
  end

  def form_class
    {:class => 'form-control'}
  end

  def btn_size(type, size, text, url)
    content_tag(:a, text, :class => 'btn btn-' + type.to_s + ' btn-' + size.to_s, href: url)
  end

  def icon(name, size=1, fw=nil)
    options = {}
    options[:class] = 'fa fa-' + name.to_s.gsub('_', '-')
    if size > 1 and size < 6
      options[:class] += ' fa-' + size.to_s + 'x'
    end
    if fw.to_s == 'fw'
      options[:class] += ' fa-fw'
    end
    content_tag(:i, '', options)
  end

end
