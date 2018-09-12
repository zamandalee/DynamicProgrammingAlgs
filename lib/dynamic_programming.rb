class DynamicProgramming
  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_td_cache = {
      1 => [[1]],
      2 => [[1,1],[2]],
      3 => [[1,1,1], [2,1], [1,2], [3]]
    }
    @super_frog_cache = {1 => [[1]]}
  end

  def blair_nums(n)
    # 2 * n - 3 expresses the nth odd number
    return @blair_cache[n] if @blair_cache[n]

    num = blair_nums(n - 1) + blair_nums(n - 2) + (2 * n - 3)
    @blair_cache[n] = num
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]],
              2 => [[1,1],[2]],
              3 => [[1,1,1], [2,1], [1,2], [3]] }
    return cache if n <= 3

    (4..n).each do |num|
      first = cache[num - 1].map { |arr| arr + [1] }
      second = cache[num - 2].map { |arr| arr + [2] }
      third = cache[num - 3].map { |arr| arr + [3] }
      cache[num] = first + second + third
    end

    cache
  end

  def frog_hops_top_down(n)
  end

  def frog_hops_top_down_helper(n)
  end

  def super_frog_hops(n, k)
  end

  def knapsack(weights, values, capacity)
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
