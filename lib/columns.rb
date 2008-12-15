class String

  def align_left(width)
    str = truncate(width)
    str << " " * (width - str.length)
  end

  def align_right(width)
    str = truncate(width)
    " " * (width - str.length) << str
  end

  def align_center(width)
    str = truncate(width)
    padding = (width - str.length) / 2
    " " * padding << str << " " * padding
  end

  def truncate(chars)
    if self.length > chars-3
      self[0,chars-3]+'...'
    else
      self
    end
  end

end

class TableRow < String

  def initialize(*columns)
    columns.each do |cell|
      self << cell.align_left(20)
    end
  end

end
