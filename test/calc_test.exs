defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "2 + 3" do
    assert Calc.eval("2 + 3") == 5
  end

  test "5 * 1" do
    assert Calc.eval("5 * 1") == 5
  end

  test "5 / 1" do
    assert Calc.eval("5 / 1") == 5
  end

  test "20 / 4" do
    assert Calc.eval("20 / 4") == 5
  end

  test "26 + 4" do
    assert Calc.eval("26 + 4") == 30
  end

  test "40 * 0" do
    assert Calc.eval("40 * 0") == 0
  end

  test "30 / 10" do
    assert Calc.eval("30 / 10") == 3
  end

  test "4 - 2 + 3" do
    assert Calc.eval("4 - 2 + 3") == 5
  end

  test "4 - 2 + 3 + 5" do
    assert Calc.eval("4 - 2 + 3 + 5") == 10
  end

  test "4 - 2 + 3 + 5 - 3 + 1" do
    assert Calc.eval("4 - 2 + 3 + 5 - 3 + 1") == 8
  end

  test "4 * 2 / 4 * 6" do
    assert Calc.eval("4 * 2 / 4 * 6") == 12
  end

  test "100 + 30 * 3 - 90" do
    assert Calc.eval("100 + 30 * 3 - 90") == 100
  end

  test "30 / 10 * 5 + 20 - 5" do
    assert Calc.eval("30 / 10 * 5 + 20 - 5") == 30
  end

  test "24 / 6 + (5 - 4)" do
    assert Calc.eval("24 / 6 + (5 - 4)") == 5
  end

  test "24 / 6 + (5 - 4) + 5 + (2 - 3)" do
    assert Calc.eval("24 / 6 + (5 - 4) + 5 + (2 - 3)") == 9
  end

  test "1 + 3 * 3 + 1" do
    assert Calc.eval("1 + 3 * 3 + 1") == 11
  end

  test "24 / 6 + (5 - 4) + 5 * (26 - 3)" do
    assert Calc.eval("24 / 6 + (5 - 4) + 5 * (26 - 3)") == 120
  end

  test "(20 / 4) + (10 * 7) - 5" do
    assert Calc.eval("(20 / 4) + (10 * 7) - 5") == 70
  end
end
