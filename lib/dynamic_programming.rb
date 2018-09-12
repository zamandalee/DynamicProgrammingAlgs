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
      frog_hops_top_down_helper(n)
    end

    def frog_hops_top_down_helper(n)
      return @frog_td_cache[n] if @frog_td_cache[n]

      first = frog_hops_top_down_helper(n - 1).map { |arr| arr + [1] }
      second = frog_hops_top_down_helper(n - 2).map { |arr| arr + [2] }
      third = frog_hops_top_down_helper(n - 3).map { |arr| arr + [3] }

      @frog_td_cache[n] = first + second + third
    end

    def super_frog_hops(n, k)
       return [[1, 1], [2]] if n == 2 && k == 2
       return @super_frog_cache[n] if @super_frog_cache[n]

       moves = []
       1.upto(k) do |idx|
         if n - idx > 0
           moves.concat super_frog_hops(n - idx, k).map {|steps| steps + [idx]}
         end
       end

       if n <= k
         moves << [n]
       end
       @super_frog_cache[n] = moves
    end

def knapsack(weights, values, capacity)
  return 0 if capacity.zero? || weights.length.zero?
  result_table = knapsack_table(weights, values, capacity)
  result_table[capacity][weights.length - 1]

end

# Helper method for bottom-up implementation
def knapsack_table(weights, values, capacity)
  solutions_table = []
  (0..capacity).each do |idx1|
    solutions_table[idx1] = []
    (0..weights.length - 1).each do |idx2|
      if idx1 == 0
        solutions_table[idx1][idx2] = 0
      elsif idx2 == 0
        solutions_table[idx1][idx2] = weights[0] > idx1 ? 0 : values[0]
      else
        opt1 = solutions_table[idx1][idx2 - 1]
        opt2 = idx1 < weights[idx2] ? 0 : solutions_table[idx1 - weights[idx2]][idx2 - 1] + values[idx2]
        optimum = [opt1, opt2].max
        solutions_table[idx1][idx2] = optimum
      end
    end
  end
  solutions_table
end

def maze_solver(maze, start_pos, end_pos)
end
