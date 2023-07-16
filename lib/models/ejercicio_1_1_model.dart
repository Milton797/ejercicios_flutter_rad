class Calculadora {
  double division(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      throw Exception("Error: No se puede dividir entre cero");
    }
  }

  double multiplicacion(double a, double b) {
    return a * b;
  }

  double resta(double a, double b) {
    return a - b;
  }

  double suma(double a, double b) {
    return a + b;
  }
}
