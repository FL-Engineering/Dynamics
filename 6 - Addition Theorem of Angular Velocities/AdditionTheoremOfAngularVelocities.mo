model AdditionTheoremOfAngularVelocities
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(visible = true, transformation(origin = {-88, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(w(fixed = true, start = 3.14159 / 2)) annotation(
    Placement(visible = true, transformation(origin = {-48, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-52, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(color_x = {0, 255, 0}) annotation(
    Placement(visible = true, transformation(origin = {52, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(diameter = 1, length = 0.1, r = {0, 0, 0.1}) annotation(
    Placement(visible = true, transformation(origin = {18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, 0, 0.5}) annotation(
    Placement(visible = true, transformation(origin = {-16, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(w(fixed = true, start = 3.14159 / 2)) annotation(
    Placement(visible = true, transformation(origin = {58, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, 0, 0.5}) annotation(
    Placement(visible = true, transformation(origin = {92, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(diameter = 1, length = 0.1, r = {0, 0, 0.1}) annotation(
    Placement(visible = true, transformation(origin = {126, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x = {255, 255, 0}) annotation(
    Placement(visible = true, transformation(origin = {162, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_a, world.frame_b) annotation(
    Line(points = {{-58, 2}, {-76, 2}, {-76, 2}, {-78, 2}}));
  connect(fixedFrame.frame_a, world.frame_b) annotation(
    Line(points = {{-62, 58}, {-72, 58}, {-72, 2}, {-78, 2}, {-78, 2}, {-78, 2}}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-38, 2}, {-26, 2}, {-26, 2}, {-26, 2}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, bodyCylinder.frame_a) annotation(
    Line(points = {{-6, 2}, {8, 2}, {8, 2}, {8, 2}}));
  connect(bodyCylinder.frame_b, fixedFrame1.frame_a) annotation(
    Line(points = {{28, 2}, {38, 2}, {38, 50}, {42, 50}, {42, 50}, {42, 50}}));
  connect(bodyCylinder.frame_b, revolute1.frame_a) annotation(
    Line(points = {{28, 2}, {48, 2}, {48, 2}, {48, 2}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{68, 2}, {82, 2}, {82, 2}, {82, 2}}));
  connect(fixedTranslation1.frame_b, bodyCylinder1.frame_a) annotation(
    Line(points = {{102, 2}, {116, 2}, {116, 2}, {116, 2}}, color = {95, 95, 95}));
  connect(bodyCylinder1.frame_b, fixedFrame2.frame_a) annotation(
    Line(points = {{136, 2}, {152, 2}, {152, 2}, {152, 2}}));
  annotation(
    experiment(StartTime = 0, StopTime = 4));
  annotation(
    uses(Modelica(version = "3.2.3")));
end AdditionTheoremOfAngularVelocities;
