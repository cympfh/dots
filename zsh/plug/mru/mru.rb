history_path = ENV['HOME'] + '/.zsh_pwd_history'

memo = {}
open(history_path, 'r').readlines.each.with_index do |line, i|
  memo[line.chomp] = i
end

open(history_path, 'w') do |f|
  memo.to_a.sort_by {|item| item[1]}.each do |line, i|
    f.puts line
  end
end
