buf = []; idx = 0

detection_size = 14

while ch = STDIN.getc
    buf << ch
    idx = idx.succ
    buf.shift if buf.size > detection_size
    if buf.uniq.size == detection_size
      puts idx
      exit 0
    end
end
