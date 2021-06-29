package com.rockthejvm

object ObjectOrientation extends App {
  // extends App is java equivalent to: public static void main(String[] args)

  // class and instance
  class Animal {
    val age = 0

    def eat() = print("I'm eating")
  }

  val anAnimal = new Animal

  // inheritance
  class Dog extends Animal

  class Cat(name: String) extends Animal // constructor definition

  val aCat = new Cat("Lassie")

  // constructor args are not fields
  // this fails: aCat.name

  class Fox(val name: String) extends Animal

  val aFox = new Fox("John")
  println(aFox.name)

  // subtype polymorphism
  val aDeclaredAnimal: Animal = new Cat("Hachi")
  aDeclaredAnimal.eat() // the most derived method will be called at runtime

  // abstract class
  abstract class WalkingAnimal {
    val hasLegs = true // by def public, can restrict with private or protected

    def walk(): Unit
  }

  trait Carnivore {
    def eat(animal: Animal): Unit
  }

  trait Philosopher {
    def ?!(thought: String): Unit // valid method name
  }

  // interface - single-class inheritance and multi-trait "mixing"
  class Crocodile extends Animal with Carnivore with Philosopher {
    override def eat(animal: Animal): Unit = println("I am eating you, animal!")

    override def ?!(thought: String): Unit = println(s"I was thinking: $thought")
  }

  val aCroc = new Crocodile
  aCroc.eat(aCat)
  aCroc eat aCat // infix notation  = object method argument, only aval for methods with one argument
  aCroc ?! "What if we could fly?"

  // operators in Scala are actually methods
  val basicMath = 1 + 2
  val equivalentBasicMath = 1.+(2)

  // anonymous classes - in place class definition and instance initialization
  val dinosaur = new Carnivore {
    override def eat(animal: Animal): Unit = print("I am a dinosaur so I can eat pretty much anything")
  }

  // singleton object
  object MySingleton { // the only instance of the MySingleton type
    val mySpecialValue = 3423
    def mySpecialMethod(): Int = 1254
    def apply(x: Int): Int = x + 1 // allow to invoke class as function
  }

  MySingleton.mySpecialMethod()
  MySingleton.apply(65)
  MySingleton(65) // equivalent to above

  class Vehicle {
    val age = 0
  }
  object Vehicle { // companion object (to Vehicle class)
    // companions can access each other's private fields/methods
    val canRunIndefinitely = false
  }
  val carRunsForever = Vehicle.canRunIndefinitely // "static" fields/methods

  /*
    case classes = lightweight data structures with boilerplate
    - sensible equals and hash code
    - serialization
    - companion with apply
    - pattern matching
   */
  case class Person(name: String, age: Int)

  // may be constructed without new
  val bob = Person("Bob", 54) // same as Person.apply("Bob", 54)

  /*
  exceptions
   */
  try {
    val x: String = null
    x.length
  } catch {
    case _: Exception => "some error message"
  } finally {
    // execute code no matter what
  }

  /*
  generics
   */
  abstract class MyList[T] {
    def head: T
    def tail: MyList[T]
  }

  // using a generic with a concrete type
  val aList: List[Int] = List(1,2,3) // List.apply(1,2,3)
  val first = aList.head
  var rest = aList.tail
  val aStringList = List("hello", "Scala")
  val firstString = aStringList.head

  // POINT #1: Scala usually operates with immutable values - YAY! :)
  // POINT #2: Scala is closest to the OO ideal

}