model SingleMassSpringSystem
  inner Modelica.Mechanics.MultiBody.World world(axisColor_x = {255, 0, 0}, gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(visible = true, transformation(origin = {-80, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 5, sphereColor = {255, 165, 0}) annotation(
    Placement(visible = true, transformation(origin = {48, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring spring(c = 50, s_unstretched = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-14, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(animation = false, s(fixed = true, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixed.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-62, 0}, {-24, 0}, {-24, 0}, {-24, 0}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, pointMass.frame_a) annotation(
    Line(points = {{-4, 0}, {48, 0}, {48, 0}, {48, 0}}));
  connect(spring.frame_a, prismatic.frame_a) annotation(
    Line(points = {{-24, 26}, {-32, 26}, {-32, 0}, {-24, 0}, {-24, 0}}));
  connect(spring.frame_b, prismatic.frame_b) annotation(
    Line(points = {{-4, 26}, {6, 26}, {6, 0}, {-4, 0}, {-4, 0}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end SingleMassSpringSystem;
