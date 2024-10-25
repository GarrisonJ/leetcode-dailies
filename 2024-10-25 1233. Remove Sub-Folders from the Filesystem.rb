# @param {String[]} folder
# @return {String[]}
def remove_subfolders(folder)
  graph = {}

  folder.each do |dir|
    nodes = dir.split('/')
    nodes.shift
    head = graph
    nodes.each do |node|
      head[node] = {} unless head.has_key?(node)
      head = head[node]
    end
    head['end'] = true
  end
  result = []
  folder.each do |dir|
    nodes = dir.split('/')
    nodes.shift
    head = graph
    sub_dir = false
    nodes.size.times do |i|
      head = head[nodes[i]]
      sub_dir = true if i != nodes.size - 1 && head['end']
    end
    result << dir unless sub_dir
  end
  result
end
