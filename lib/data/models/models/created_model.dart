class BuildModel {
  late List<double> xTrain;
  late List<double> yTrain;
  final double w;
  final double b;
  final double alpha;
  final int count;
  late List<double>? result;

  BuildModel(
      {required this.xTrain,
      required this.yTrain,
      required this.w,
      required this.b,
      required this.alpha,
      required this.count,
      this.result});
}
