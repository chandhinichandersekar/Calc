defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  #tokenToInteger tests

  test "token To Integer" do
    assert CalculateWithThreeTokensRecursivelyClass.tokenToInteger(["20", "/", "6"], 0) == 20
  end

  test "token To Integer at different index" do
    assert CalculateWithThreeTokensRecursivelyClass.tokenToInteger(["1", "+", "27"], 2) == 27
  end

  #calculateWithThreeTokens  and getOperator tests

  test "calculate sum  when there are 3 tokens" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokens(["1", "+", "10"]) == 11
  end

  test "calculate difference  when there are 3 tokens" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokens(["18", "-", "10"]) == 8
  end

  test "calculate product  when there are 3 tokens" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokens(["32", "*", "20"]) == 640
  end

  test "calculate division  when there are 3 tokens" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokens(["12", "/", "10"]) == 1
  end

  #findMultiplyDivide tests

  test "find multiply operator index from token" do
    assert CalculateWithThreeTokensRecursivelyClass.findMultiplyDivide(["20", "*", "11"]) == 1
  end

  test "find divide operator index from tokens" do
    assert CalculateWithThreeTokensRecursivelyClass.findMultiplyDivide(["20", "+", "11", "-", "8", "/", "2" ]) == 5
  end

  #calculateWithThreeTokensHere tests

  test "calculate tokens when length is 3 and operator is +" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["20", "/", "2" ]) == 10
  end

  test "calculate tokens when length is 3 and operator is -" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["36", "-", "7" ]) == 29
  end

  test "calculate tokens when length is 3 and operator is /" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["48", "/", "7" ]) == 7
  end

  test "calculate tokens when length is 3 and operator is *" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["200", "*", "45" ]) == 9000
  end

  test "calculate tokens when length is > 3 and has operations + and -" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["22", "-", "2", "+", "5", "-", "2" ]) == 23
  end

  test "calculate tokens when length is > 3 and has operators * and /" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["20", "/", "2", "*", "3", "/", "3" ]) == 10
  end

  test "calculate tokens when length is > 3 and has all four operators" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["25", "/", "5", "+", "10", "-", "3", "*", "2" ]) == 9
  end

  test "calculate tokens when length is > 3 and has all four operators with division rounded off" do
    assert CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(["144", "/", "11", "+", "22", "-", "2", "*", "15" ]) == 5
  end

  #evalStatic tests

   test "calculate when there are three tokens and operator is /" do
     assert Calc.evalStatic("25 / 5") == 5
   end

   test "calculate when there are three tokens and operator is *" do
     assert Calc.evalStatic("36 * 10") == 360
   end

   test "calculate when there are three tokens and operator is +" do
     assert Calc.evalStatic("321 + 4") == 325
   end

   test "calculate when there are three tokens and operator is -" do
     assert Calc.evalStatic("234 - 34") == 200
   end

   #findIndexOfLeftParen tests
   test "find the index of left parenthesis" do
     assert Calc.findIndexOfLeftParen(["10", "+", "2", "(", "39", "*", "12", ")", "-", "25"]) == 3
   end

   test "find the index of left parenthesis test 2" do
     assert Calc.findIndexOfLeftParen(["19", "(", "23", "+", "245", ")", "-", "35", "+", "122"]) == 1
   end

   #findIndexOfRightParen tests
   test "find the index of right parenthesis" do
     assert Calc.findIndexOfRightParen(["26", "*", "18", "(", "22", "/", "13", ")", "+", "100"]) == 7
   end

   test "find the index of right parenthesis test 2" do
     assert Calc.findIndexOfRightParen(["134", "+", "45", "*", "22", "(", "13", "+", "100", ")"]) == 9
   end

   #getBeginningTokensBasedOnIndexOfLeftParen tests
   test "when index of left paren is zero" do
     assert Calc.getBeginningTokensBasedOnIndexOfLeftParen(["(", "23", "+", "12", ")", "/", "7"], 0) == []
   end

   test "when index of left paren is greater than zero" do
     assert Calc.getBeginningTokensBasedOnIndexOfLeftParen(["67", "+", "(", "43", "+", "88", ")", "/", "3"], 2) == ["67", "+"]
   end

  #eval tests

  test "three tokens with + operator" do
    assert Calc.eval("2 + 3") == 5
  end

  test "three tokens with * operator" do
    assert Calc.eval("5 * 1") == 5
  end

  test "three tokens with / operator" do
    assert Calc.eval("5 / 1") == 5
  end

  test "three tokens with double digit / operator" do
    assert Calc.eval("20 / 4") == 5
  end

  test "three tokens with double digit + operator" do
    assert Calc.eval("26 + 4") == 30
  end

  test "multiplication with zero" do
    assert Calc.eval("40 * 0") == 0
  end

  test "three tokens with double digit integers and / operator" do
    assert Calc.eval("30 / 10") == 3
  end

  test "more than three tokens and operators + and -" do
    assert Calc.eval("4 - 2 + 3") == 5
  end

  test "more than three tokens with + and -" do
    assert Calc.eval("4 - 2 + 3 + 5") == 10
  end

  test "longer string with + and - operators" do
    assert Calc.eval("4 - 2 + 3 + 5 - 3 + 1") == 8
  end

  test "more than 3 tokens with * and / operator" do
    assert Calc.eval("4 * 2 / 4 * 6") == 12
  end

  test "string with all four operators" do
    assert Calc.eval("100 + 30 * 3 - 90") == 100
  end

  test "longer string with all four operators" do
    assert Calc.eval("30 / 10 * 5 + 20 - 5") == 30
  end

  test "string with single parenthesis" do
    assert Calc.eval("24 / 6 + (5 - 4)") == 5
  end

  test "string with multiple parenthesis" do
    assert Calc.eval("24 / 6 + (5 - 4) + 5 + (2 - 3)") == 9
  end

  test "string with + and *" do
    assert Calc.eval("1 + 3 * 3 + 1") == 11
  end

  test "longer string with multiple parenthesis and double digit integers" do
    assert Calc.eval("24 / 6 + (5 - 4) + 5 * (26 - 3)") == 120
  end

  test "string starting with parenthesis" do
    assert Calc.eval("(20 / 4) + (10 * 7) - 5") == 70
  end

end
