ThisBuild / scalaVersion := "2.12.18"
ThisBuild / organization := "vexsatv"

val spinalVersion = "1.10.1"

lazy val spinalDeps = Seq(
  "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion,
  "com.github.spinalhdl" %% "spinalhdl-lib"  % spinalVersion,
  compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)
)

lazy val vexriscv = RootProject(file("vendor/VexRiscv"))

lazy val vexsatv = (project in file("."))
  .dependsOn(vexriscv)
  .settings(
    name := "vexsatv",
    libraryDependencies ++= spinalDeps
  )