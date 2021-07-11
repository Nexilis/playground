package com.rockthejvm

import scala.concurrent.Future
import scala.util.{Failure, Success, Try}
import scala.concurrent.ExecutionContext.Implicits.global

object Advanced extends App {

  // lazy evaluation 
  lazy val aLazyValue = 2
  lazy val lazyValueWithSideEffect = {
    println("I'm lazy")
    43
  }
  println("I'm eager")
  val eagerValue = lazyValueWithSideEffect + 1
  // especially useful in infinite collections


  // "pseudo-collections": Option, Try
  def methodWhichCanReturnNull(): String = "hello, Scala"
  val anOption = Option(methodWhichCanReturnNull()) // Some("hello, Scala") OR None
  // nice trick to remove defensive null checks

  val stringProcessing = anOption match {
    case Some(string) => s"I have obtained a valid string: $string"
    case None => "I obtained nothing"
  }

  def methodWhichCanThrowException(): String = throw new RuntimeException
  try {
    methodWhichCanThrowException()
  } catch {
    case e: Exception => "defend from evil exception"
  }

  val aTry = Try(methodWhichCanThrowException())
  val anotherStringProcessing = aTry match {
    case Success(validValue) => s"I have obtained a valid string $validValue"
    case Failure(ex) => s"I have obtained an exception: $ex"
  }


  // asynchronous programming
  val aFuture = Future {
    println("Loading...")
    Thread.sleep(1000)
    println("I have a computed value")
    67
  }
  Thread.sleep(2000)

  // future is a "collection" which contains a value when it's evaluated
  // future is composable with map, flatMap and filter


  // Implicits basics
  // #1. implicit arguments
  def aMethodWithImplicitArgs(implicit arg: Int) = arg + 1
  implicit val myImplicitInt = 46
  println(aMethodWithImplicitArgs) // aMethodWithImplicitArgs(myImplicitInt)

  // #2. implicit conversions
  implicit class MyRichInteger(n: Int) {
    def isEven() = n% 2 == 0
  }

  println(23.isEven()) // only works because MyRichInteger is implicit
}
