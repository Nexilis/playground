package com.rockthejvm

object Basics extends App {
  val meaningOfLife: Int = 42 // immutable

  // Int, Boolean, Char, Double, Float, String
  val aBoolean = false // type inference

  // strings
  val aString = "I like Scala"
  val aComposedString = "I" + " concatenated a string"
  val anInterpolatedString = s"The meaning of life is $meaningOfLife"

  // expressions = structures that can be reduced to a value
  // in Scala ifs are also expressions
  val anExpression = 2 + 3
  var ifExpression = if (meaningOfLife > 43) 56 else 999
  var chainedIfExpression =
    if (meaningOfLife > 43) 56
    else if (meaningOfLife < 0) -2
    else 0

  // code blocks
  val aCodeBlock = {
    val aLocalVal = 67
    // code block needs to return something
    aLocalVal + 3
  }

  // define a function
  def myFunction(x: Int, y: String): String = y + " " + x

  def myFunctionWithCodeBlock(x: Int, y: String): String = {
    y + " " + x
  }

  // recursive functions
  def factorial(n: Int): Int =
    if (n <= 1) 1
    else n * factorial(n - 1)

  // the Unit type -> type of side effects, e.g.
  println("I like Scala")

  def myUnitReturningFunc(): Unit = {
    print("Side effect returning Unit")
    val theUnit = ()
    theUnit
  }

}
