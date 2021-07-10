package com.rockthejvm

object FunctionalProgramming extends App {
  // Scala is OO
  class Person(name: String) {
    def apply(age: Int) = println(s"I have aged $age years")
  }

  val bob = new Person("Bob")
  bob.apply(43)
  bob(43)

  /*
    Scala runs on the JVM
    Functional programming / functions as first class citizens:
    - functions compositions
    - pass functions as args
    - return functions as results

    Conclusion: FunctionX = Function1, Function2, ... Function22
   */

  val simpleIncrementer = new Function1[Int, Int] {
    override def apply(arg: Int): Int = arg + 1
  }
  simpleIncrementer.apply(23) // 24
  simpleIncrementer(23)
  // defined a function

  // Important: all Scala functions of instances of FunctionX types
  val stringConcatenator = new Function2[String, String, String] {
    override def apply(arg1: String, arg2: String): String = arg1 + arg2
  }

  println(stringConcatenator("I like", "Scala"))

  // syntax sugars
  val doubler: Function1[Int, Int] = (x: Int) => 2 * x
  val doubler2: Int => Int = (x: Int) => 2 * x
  val doubler3 = (x: Int) => 2 * x
  doubler(4) // 8
  doubler2(4) // 8
  doubler3(4) // 8
  /*
  new Function1[Int, Int] {
    override def apply(x: Int) = 2 * x
  }
   */

  // higher-order functions: take functions as args/return functions as results
  val aMappedList = List(1, 2, 3).map(x => x + 1)
  println(aMappedList)

  val aFlatMappedList = List(1, 2, 3).flatMap(x => List(x, 2 * x))
  println(aFlatMappedList)

  // alternative syntax
  val aFlatMappedList2 = List(1, 2, 3).flatMap { x =>
    List(x, 2 * x)
  }

  val aFilteredList = List(1, 2, 3, 4, 5).filter(x => x <= 3)
  println(aFilteredList)

  // alternative syntax
  val aFilteredList2 = List(1, 2, 3, 4, 5).filter(_ <= 3)

  // all pairs between the numbers 1,2,3 and the letters 'a', 'b', 'c'
  val allPairs = List(1, 2, 3).flatMap(x => List('a', 'b', 'c').map(y => s"$x-$y"))
  println(allPairs)

  // alternative syntax - for comprehensions
  val alternativePairs = for {
    number <- List(1,2,3)
    letter <- List('a', 'b', 'c')
  } yield s"$number-$letter"

  // Collections
  // Lists
  val aList = List(1,2,3,4,5)
  val firstElement = aList.head
  val rest = aList.tail
  val aPrependedList = 0 :: aList // 0,1,2,3,4,5
  val enExtendedList = 0 +: aList :+ 6 // 0,1,2,3,4,5,6

  // Sequences
  val aSequence: Seq[Int] = Seq(1,2,3)
  val accessedElement = aSequence(1) // element at index 1: 2

  // Vectors: fast Seq impl
  val aVector = Vector(1,2,3,4,5)

  // Sets
  val aSet = Set(1,1,2,3) // 1,2,3
  val setHas3 = aSet.contains(5)
  val addedSet = aSet + 5 // 1,2,3,5
  val aRemovedSet = aSet - 3 // 1,2

  // Ranges, lazy evaluated
  val aRange = 1 to 1000
  val twoByTwo = aRange.map(x => x * 2).toList // 2,4...2000

  // Tuples
  val aTuple = ("Bon Jovi", "Rock", "1982")

  // Maps
  val aPhoneBook: Map[String, Int] = Map(
    ("Daniel", 12314),
    ("John", 53453),
    "Jane" -> 523234
  )
}
