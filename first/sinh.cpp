#include <iostream>
#include <iomanip>

const int N = 1'000'000'000;

double sinh(double x) {
  double ans = x, tmp = x;
  for (int i = 1; i <= N; i++) {
    tmp *= x / (2 * i) * x / (2 * i + 1);
    ans += tmp;
  }
  return ans;
}

int main(int argc, char** argv) {
  if (argc == 1)
    throw std::runtime_error("Illegal count of arguments error");
  std::cout << std::fixed << std::setprecision(12)
            << sinh(std::stod(argv[1])) << '\n';
}
