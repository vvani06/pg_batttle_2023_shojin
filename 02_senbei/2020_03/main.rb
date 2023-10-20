def main
    $h,$w = intary
    py, pw, $qy, $qw = intary
    $qw -= 1
    $qy -= 1
    $map = make_map($h,"s")
    $ans = 0
    $judge = false
    $goal = false
    $visited = Set.new(["#{pw - 1} #{py - 1} 1"])
    saiki(pw - 1, py - 1, 1)
    if $goal
        puts $ans
    else
        puts -1
    end
end

#----------------------------------------------------------------------------------
require "set"
def saiki(w, y, way)
    (-1..2).each do |i|
        break if $judge
        if w - 1 >= 0 && $map[y][w - 1] == "." && (way + i) % 4 == 0
            $ans += 1
            if $visited.include?("#{w - 1} #{y} 0")
                $ans = -1
                return
            end
            if y == $qy && w - 1 == $qw
                $goal = true
                return
            end
            $visited << "#{w - 1} #{y} 0"
            saiki(w - 1, y, 0)
            $judge = true
        elsif y - 1 >= 0 && $map[y - 1][w] != nil && $map[y - 1][w] == "." && (way + i) % 4 == 1
            $ans += 1
            if $visited.include?("#{w} #{y - 1} 1")
                $ans = -1
                return
            end
            if y - 1 == $qy && w == $qw
                $goal = true
                return
            end
            $visited << "#{w} #{y - 1} 1"
            saiki(w, y - 1, 1)
            $judge = true
        elsif w + 1 < $w && $map[y][w + 1] == "." && (way + i) % 4 == 2
            $ans += 1
            if $visited.include?("#{w + 1} #{y} 2")
                $ans = -1
                return
            end
            if y == $qy && w + 1 == $qw
                $goal = true
                return
            end
            $visited << "#{w + 1} #{y} 2"
            saiki(w + 1, y, 2)
            $judge = true
        elsif y + 1 < $h && $map[y + 1][w] != nil && $map[y + 1][w] == "." && (way + i) % 4 == 3
            $ans += 1
            if $visited.include?("#{w} #{y + 1} 3")
                $ans = -1
                return
            end
            if y + 1 == $qy && w == $qw
                $goal = true
                return
            end
            $visited << "#{w} #{y + 1} 3"
            saiki(w, y + 1, 3)
            $judge = true
        end
    end
end

def int
    gets.chomp.to_i
end

def intary
    gets.chomp.split(" ").map(&:to_i)
end

def str
    gets.chomp
end

def strary
    gets.chomp.split("")
end

def is_lower?(c)
    c != c.upcase
end

def grouping(ary)
    ary.slice_when { |a, b| a != b }.to_a
end

def number?(str)
nil != (str =~ /\A[0-9]+\z/)
end

def make_tree(n, path, way = false)
    if n != 0
        tree = {}
        path.times do |i|
            u,v = intary
            tree[u] ? tree[u] << v : tree[u] = v
            if way
                tree[v] ? tree[v] << u : tree[v] = u
            end
        end
    else
        tree = Array.new(n+1) {Array.new}
        path.times do |i|
            u,v = intary
            tree[u] << v
            if way
                tree[v] << u
            end
        end
    end
    return tree
end

def make_visited(n)
    Array.new(n+1, false)
end

def make_map(n, type)
    map = []
    if type == "s"
        n.times do |i|
            map << strary
        end
    elsif type == "i"
        n.times do |i|
            map << intary
        end
    end
    return map
end

def nisinsu(int)
    return int.to_s(2).chomp
end

def zeroume(keta, int)
    sprintf("%0#{keta}d", int)
end

# 約数列挙
def divisors(n)
    result = []
    
    doit = ->(pd, acc) {
        return if pd.empty?
        x, *xs = pd
        (0..x[1]).each do |i|
            e = acc * x[0] ** i
            result << e
            doit.(xs, e)
        end
    }
    doit.(n.prime_division, 1)
    
    result.uniq.sort
end
# 累積和作成
def ruiseki(arr)
    s = Array.new(arr.size + 1)
    s[0] = 0
    (0...arr.size).each do |i|
        s[i+1] = s[i] + arr[i]
    end
    return s
end

main