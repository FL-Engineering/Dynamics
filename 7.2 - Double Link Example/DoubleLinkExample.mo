model DoubleLinkExample
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false)  annotation(
    Placement(visible = true, transformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = -1.5708), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0.75, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1) annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-36, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(color_x = {0, 255, 0}) annotation(
    Placement(visible = true, transformation(origin = {24, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(useSupport = true, w_fixed = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0.75, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {76, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x = {255, 255, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(useSupport = true, w_fixed = 0.5) annotation(
    Placement(visible = true, transformation(origin = { 30, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = -90, n = {0, 0, 1}) annotation(
    Placement(visible = true, transformation(origin = {-64, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-72, 0}, {-48, 0}, {-48, 0}, {-48, 0}}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-28, 0}, {-14, 0}, {-14, 0}, {-14, 0}}, color = {95, 95, 95}));
  connect(revolute.support, constantSpeed.support) annotation(
    Line(points = {{-44, 10}, {-46, 10}, {-46, 20}, {-46, 20}}));
  connect(constantSpeed.flange, revolute.axis) annotation(
    Line(points = {{-36, 30}, {-30, 30}, {-30, 10}, {-38, 10}, {-38, 10}}));
  connect(fixedTranslation.frame_b, fixedFrame1.frame_a) annotation(
    Line(points = {{6, 0}, {14, 0}, {14, 78}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, revolute1.frame_a) annotation(
    Line(points = {{6, 0}, {30, 0}, {30, 0}, {30, 0}}));
  connect(revolute1.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{50, 0}, {66, 0}, {66, 0}, {66, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, pointMass.frame_a) annotation(
    Line(points = {{86, 0}, {106, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, fixedFrame2.frame_a) annotation(
    Line(points = {{86, 0}, {94, 0}, {94, 52}, {100, 52}}));
  connect(revolute1.support, constantSpeed1.support) annotation(
    Line(points = {{34, 10}, {30, 10}, {30, 22}, {30, 22}}));
  connect(revolute1.axis, constantSpeed1.flange) annotation(
    Line(points = {{40, 10}, {48, 10}, {48, 32}, {40, 32}, {40, 32}, {40, 32}}));
  connect(revolute.frame_a, fixedRotation.frame_a) annotation(
    Line(points = {{-48, 0}, {-64, 0}, {-64, 34}}));
  connect(fixedRotation.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{-64, 54}, {-64, 54}, {-64, 78}, {-46, 78}, {-46, 78}}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end DoubleLinkExample;
