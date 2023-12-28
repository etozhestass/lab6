#include <fstream>
#include <random>

int main(int argc, char** argv) {
  srand(time(NULL));
  int cnt, n = std::stoi(argv[1]);
  std::fstream tmp(".size", std::fstream::in);
  tmp >> cnt;
  for (int i = 1; i <= n; i++) {
    std::string name = "files/file" + std::to_string(i);
    std::fstream fout(name, std::fstream::out);
    for (int i = 0; i < cnt; i++)
      fout << rand() % 10 << ' ';
  }
}
