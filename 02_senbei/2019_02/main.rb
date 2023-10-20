def main
    n, m = intary
    seibutu = intary.each_with_index.sort
    ans = Array.new(3,0)
    a = seibutu[0][0] * n
    bc = m - a
    diffb = seibutu[1][0] - seibutu[0][0]
    diffc = seibutu[2][0] - seibutu[0][0]
    (0..n).each do |i|
        next if diffb != 0 && (bc - i * diffc) % diffb != 0
        ans[seibutu[2][1]] = i
        diffb == 0 ? ans[seibutu[1][1]] = 0 : ans[seibutu[1][1]] = (bc - i * diffc) / diffb
        ans[seibutu[0][1]] = n - (i + ans[seibutu[1][1]])
        if ans[seibutu[1][1]] < 0 || ans[seibutu[0][1]] < 0
            next
        end
        next if ans.sum != n || ans[seibutu[0][1]] * seibutu[0][0] + ans[seibutu[1][1]] * seibutu[1][0] + ans[seibutu[2][1]] * seibutu[2][0] != m
        puts ans.join(" ")
        return
    end
    puts "-1 -1 -1"
end

#----------------------------------------------------------------------------------
require "set"
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