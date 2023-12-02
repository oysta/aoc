Node = Struct.new(:name, :size, :children)

current_dir = Node.new("/", 0, [])

ROOT_DIR = current_dir

nav_stack = []
candidates = []

ARGF.readline

pop_dir = lambda {
  if current_dir.size < 100_000
    candidates << current_dir
  end
  new_dir = nav_stack.pop
  new_dir.size = new_dir.size + current_dir.size
  return new_dir
}

ARGF.readlines.map(&:chomp).each do |line|
  case line
  when /^\$ ls/
    next
  when /^dir/
    next
  when /^\$ cd/
    name = line.delete_prefix("$ cd ")
    if name == ".."
      new_dir = pop_dir.()
    else
      nav_stack << current_dir
      new_dir = Node.new(name, 0, [])
      current_dir.children << new_dir
    end
    current_dir = new_dir
  else
    size, name = line.split(" ")
    current_dir.size = current_dir.size + size.to_i
  end
end

while !nav_stack.empty?
  current_dir = pop_dir.()
end

puts "Sum of large directories: " + candidates.sum(&:size).to_s

free_space = (70_000_000 - ROOT_DIR.size)
space_needed = (30_000_000 - free_space)

search_queue = [ROOT_DIR]
deletion_candidates = []

while !search_queue.empty?
  dir = search_queue.pop
  if dir.size >= space_needed
    deletion_candidates << dir
  end
  search_queue.concat(dir.children)
end

puts "Directory to free: " + deletion_candidates.map(&:size).min.to_s

