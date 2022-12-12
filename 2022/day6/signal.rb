buf = []; idx = 0

while ch = STDIN.getc
    buf << ch
    idx = idx.succ
    if buf.size > 4
      buf.shift
    end
    if buf.uniq.size == 4
      puts idx
      exit 0
    end
end
