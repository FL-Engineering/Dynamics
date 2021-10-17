model Pendulum
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = -0.785398)) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 2) annotation(
    Placement(visible = true, transformation(origin = {12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-70, 0}, {-60, 0}, {-60, 0}, {-60, 0}}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-40, 0}, {-26, 0}, {-26, 0}, {-26, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{-6, 0}, {12, 0}, {12, 0}, {12, 0}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
end Pendulum;
