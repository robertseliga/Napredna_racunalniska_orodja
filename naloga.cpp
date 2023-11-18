#include <iostream>
#include <cmath>

using namespace std;



// Funkcija za izraèun arctan(x/2) z uporabo Taylor vrste
double atan_taylor_series(double x) {
    double result = 0.0;
    double term = x;  
    double x_squared = (x * x);
    double divisor = 1.0;

    for (int i = 1; i <= 1000; ++i) {  // poveèevanje èlenov
        if (i % 2 == 0) {
            result -= term / divisor;
        }
        else {
            result += term / divisor;
        }
        term *= x_squared;
        divisor += 2.0;
    }

    return result;
}

// integralska funkcija
double f(double x) {
    return exp(3 * x) * atan_taylor_series(x / 2);
}

// funkcija trapezne metode
double trapezoidalMethod(double a, double b, int n) {
    double h = (b - a) / n;  // Corrected calculation of h
    double integral = (f(a) + f(b)) / 2;

    for (int i = 1; i < n; ++i) {
        double x = a + i * h;
        integral += f(x);
    }

    return integral * h;
}

int main() {
    // Meje
    double a = 0.0;
    double b = 3.14159265358979323846 / 4.0;

    // Št. intervalov
    int n;

    cout << "Vpisi st. zeljenih intervalov: ";
    cin >> n;

    // izracun integrala s trapezno metodo
    double result = trapezoidalMethod(a, b, n);

    // izpis vrednosti resitve
    cout << "Aproksimirana vrednost integrala: " << result << endl;

    return 0;
}