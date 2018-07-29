import scala.util.Random

object RobotNames {
  // Keep a set of already used robot names
  var used: Set[String] = Set()
}

class Robot() {
  var name: String = generateName

  private def generateName: String = {
    var robotName = ""

    while(robotName == "" || RobotNames.used.contains(robotName)) {
      robotName = Random.alphanumeric.filter(_.isLetter)
        .take(2)
        .mkString
        .toUpperCase
        .concat(
          Random.alphanumeric.filter(_.isDigit)
            .take(3)
            .mkString
        )
    }

    RobotNames.used += robotName
    robotName
  }

  def reset(): Unit = name = generateName
}
