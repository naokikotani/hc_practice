
members = ['A', 'B', 'C', 'D', 'E', 'F']

# 2 + 4 のグループか 3 + 3 のグループ化を決めるのに使用する
is_group_division_2_and_4 = rand(2).zero?

members.shuffle!

if is_group_division_2_and_4
  group_1 = members[0..1].sort
  group_2 = members[2..5].sort
else
  group_1 = members[0..2].sort
  group_2 = members[3..5].sort
end

print group_1
print group_2
