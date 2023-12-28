#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
  int sz = std::stoi(argv[1]);
  std::string name = "files/file" + std::string(argv[2]);
  std::fstream fin(name, std::fstream::in);
  std::fstream fout(name, std::fstream::app);
  int tmp;
  for (int j = 0; j < sz; j++) {
    fin >> tmp;
    fout << tmp * 2 << ' ';
  }
}
