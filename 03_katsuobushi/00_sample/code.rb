# 問題: ABC078-B ISU
# https://atcoder.jp/contests/abc078/tasks/abc078_b

X, Y, Z = readline.chomp.split.map(&:to_i)

# 残りスペース
# 左側の余白は最初から引いておく
rest_space = X - Z

# 1人が座るのに必要なスペース
# 自分のサイズ + 右側に必要な余白
unit_space = Y + Z

# あとは割るだけで良い
puts rest_space / unit_space
