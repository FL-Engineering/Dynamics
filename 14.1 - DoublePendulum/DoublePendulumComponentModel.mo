model DoublePendulumComponentModel
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false)  annotation(
    Placement(visible = true, transformation(origin = {-78, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = 1.570796326794897))  annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 5)  annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1 annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {66, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass1(m = 5)  annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {0, 255, 0})  annotation(
    Placement(visible = true, transformation(origin = {12, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(color_x = {255, 255, 0})  annotation(
    Placement(visible = true, transformation(origin = {104, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = -90, n = {0, 0, 1})  annotation(
    Placement(visible = true, transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-146, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x = {255, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-66, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-50, 0}, {-36, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{-16, 0}, {2, 0}}));
  connect(pointMass.frame_a, revolute1.frame_a) annotation(
    Line(points = {{2, 0}, {22, 0}}));
  connect(revolute1.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{42, 0}, {56, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, pointMass1.frame_a) annotation(
    Line(points = {{76, 0}, {98, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, fixedFrame1.frame_a) annotation(
    Line(points = {{76, 0}, {82, 0}, {82, -44}, {94, -44}}));
  connect(fixedTranslation.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{-16, 0}, {-8, 0}, {-8, -46}, {2, -46}}, color = {95, 95, 95}));
  connect(fixed.frame_b, fixedRotation.frame_a) annotation(
    Line(points = {{-136, 0}, {-112, 0}}, color = {95, 95, 95}));
  connect(fixedRotation.frame_b, revolute.frame_a) annotation(
    Line(points = {{-92, 0}, {-70, 0}}, color = {95, 95, 95}));
  connect(fixedRotation.frame_b, fixedFrame2.frame_a) annotation(
    Line(points = {{-92, 0}, {-88, 0}, {-88, -42}, {-76, -42}}));

annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.001));
end DoublePendulumComponentModel;
