object SumOfMultiples {
  def sum(factors: Set[Int], limit: Int): Int = (0 until limit).filter(x => factors.exists(x % _ == 0)).sum
}