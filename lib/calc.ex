

defmodule CalculateWithThreeTokensRecursivelyClass do

    def tokenToInteger(twoNumberStringsInsideFn, index) do
        String.to_integer(Enum.at(twoNumberStringsInsideFn, index))
    end

    def getOperator(token) do
        add = fn (num1, num2) -> num1 + num2 end
        multiply = fn (num1, num2) -> num1 * num2 end
        division = fn (num1, num2) -> round(num1 / num2) end
        subtraction = fn (num1, num2) -> num1 - num2 end
        case {token} do
             {"+"} -> add
             {"*"} -> multiply
             {"/"} -> division
             {"-"} -> subtraction

        end
    end

    def calculateWithThreeTokens(tokens) do
        operator = getOperator(Enum.at(tokens, 1))

        firstNumber = tokenToInteger(tokens, 0)
        secondNumber = tokenToInteger(tokens, 2)
        operator.(firstNumber, secondNumber)
    end

    def findMultiplyDivide(tokens) do
        Enum.find_index(tokens, fn(x) -> (x === "*" || x === "/") end)
    end

    def calculateWithThreeTokensHere(tokens) when length(tokens) === 3 do
      calculateWithThreeTokens(tokens)
    end

    def calculateWithThreeTokensHere(tokens) when length(tokens) -  1 > 3 do
        indexOfMultiply = findMultiplyDivide(tokens)
        if is_integer(indexOfMultiply) do
            tokensToCalculateMultiply = [Enum.at(tokens, indexOfMultiply - 1), Enum.at(tokens, indexOfMultiply), Enum.at(tokens, indexOfMultiply + 1)]
            resultFromMultiply = calculateWithThreeTokens(tokensToCalculateMultiply)
            if indexOfMultiply - 2 === -1 do
                tokensToCalculateWithMultiplyStartingWithResult = [Integer.to_string(resultFromMultiply)] ++ Enum.slice(tokens, (indexOfMultiply + 2)..length(tokens))
                calculateWithThreeTokensHere(tokensToCalculateWithMultiplyStartingWithResult)
            else
                tokensToCalculateWithMultiply = Enum.slice(tokens, 0..indexOfMultiply - 2) ++ [Integer.to_string(resultFromMultiply)] ++ Enum.slice(tokens, (indexOfMultiply + 2)..length(tokens))
                calculateWithThreeTokensHere(tokensToCalculateWithMultiply)
            end
        else
            result = calculateWithThreeTokens(tokens)
            tokenLengthMinus1 = length(tokens) - 1
            tokens = Enum.slice(tokens, 3..(tokenLengthMinus1))
            threeTokens = [Integer.to_string(result), Enum.at(tokens, 0), Enum.at(tokens, 1)]
            threeAndOnTokens = Enum.slice(tokens, 2..length(tokens))
            calculateWithThreeTokensHere(threeTokens ++ threeAndOnTokens)
        end
    end
end

defmodule Calc do

    def main() do
        line = IO.gets("expression:")
        splitLine = String.split(line, "")
        splitLineWithoutEnd = Enum.slice(splitLine, 0..length(splitLine) - 3)
        lineWithoutEndString = Enum.join(splitLineWithoutEnd, "")
        output = eval(lineWithoutEndString)
        IO.puts(output)
        main()
    end

    def evalStatic(testString) do
        tokens = String.split(testString, " ")
        result = CalculateWithThreeTokensRecursivelyClass.calculateWithThreeTokensHere(tokens)
        result
    end

    def findIndexOfLeftParen(tokens) do
        Enum.find_index(tokens, fn(x) -> (x === "(") end)
    end

    def findIndexOfRightParen(tokens) do
        Enum.find_index(tokens, fn(x) -> (x === ")") end)
    end

    def eval(testString) do
        tokens = String.split(testString, "")
        indexOfLeftParen = findIndexOfLeftParen(tokens)
        if is_integer(indexOfLeftParen) do
            indexOfRightParen = findIndexOfRightParen(tokens)
            tokensFromParens = Enum.slice(tokens, indexOfLeftParen+1..indexOfRightParen-1)
            tokensFromParensString = Enum.join(tokensFromParens, "")
            resultFromParens = evalStatic(tokensFromParensString)
            beginningTokens = Enum.slice(tokens, 0..indexOfLeftParen - 1)
            resultFromParensArray = [Integer.to_string(resultFromParens)]
            endTokens = Enum.slice(tokens, indexOfRightParen + 1..length(tokens))
            newTokens = beginningTokens ++ resultFromParensArray ++ endTokens
            newTokensString = Enum.join(newTokens, "")
            eval(newTokensString)
        else
            evalStatic(testString)
        end
    end
end

test = fn (testString, expectedValue) ->
    IO.inspect testString
    IO.inspect Calc.eval(testString) === expectedValue
end


test.("2 + 3", 5)
test.("5 * 1", 5)
test.("20 / 4", 5)
test.("2 + 4", 6)
test.("2 * 4", 8)
test.("4 / 2", 2)
test.("4 - 2", 2)
test.("4 - 2 + 3", 5)

test.("4 - 2 + 3 + 5", 10)
test.("4 - 2 + 3 + 5 - 3 + 1", 8)

test.("4 * 2 / 4 * 6", 12)
test.("1 + 3 * 3 + 1", 11)
test.("24 / 6 + (5 - 4)", 5)

test.("24 / 6 + (5 - 4) + 5 + (2 - 3)", 9)

test.("24 / 6 + (5 - 4) + 5 * (26 - 3)", 120)
