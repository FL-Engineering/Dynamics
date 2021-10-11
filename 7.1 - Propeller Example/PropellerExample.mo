model PropellerExample
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false)  annotation(
    Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = -1.5708), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-36, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(color_x = {0, 255, 0}) annotation(
    Placement(visible = true, transformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(useSupport = true, w_fixed = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = -90, n = {0, 0, 1})  annotation(
    Placement(visible = true, transformation(origin = {-64, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-28, 0}, {-14, 0}, {-14, 0}, {-14, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{6, 0}, {32, 0}, {32, 0}, {30, 0}}, color = {95, 95, 95}));
  connect(pointMass.frame_a, fixedFrame1.frame_a) annotation(
    Line(points = {{30, 0}, {52, 0}}, color = {95, 95, 95}));
  connect(revolute.support, constantSpeed.support) annotation(
    Line(points = {{-44, 10}, {-46, 10}, {-46, 20}, {-46, 20}}));
  connect(constantSpeed.flange, revolute.axis) annotation(
    Line(points = {{-36, 30}, {-30, 30}, {-30, 10}, {-38, 10}, {-38, 10}}));
  connect(fixedRotation.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{-64, 68}, {-64, 68}, {-64, 74}, {-46, 74}, {-46, 74}}));
  connect(revolute.frame_a, fixedRotation.frame_a) annotation(
    Line(points = {{-48, 0}, {-64, 0}, {-64, 48}, {-64, 48}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-74, 0}, {-48, 0}, {-48, 0}, {-48, 0}}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end PropellerExample;
