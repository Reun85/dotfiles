#include <bits/stdc++.h>

#define MULTI true

// ──────────────────────────────────────────────────────────────────────
//
// Contest: $(CONTEST)
// Problem: $(PROBLEM)
//
// URL: $(URL)
// ──────────────────────────────────────────────────────────────────────
// Judge: $(JUDGE)
// Memory Limit: $(MEMLIM)
// Time Limit: $(TIMELIM)
// Start: $(DATE)

using namespace std;
using ll = long long;
template <typename T> using Vec = vector<T>;
using u8 = uint8_t;
using u16 = uint16_t;
using u32 = uint32_t;
using u64 = uint64_t;
// Largest available size
using usize = u64;

using i8 = int8_t;
using i16 = int16_t;
using i32 = int32_t;
using i64 = int64_t;
// Largest available size
using isize = i64;
using pi32 = std::pair<i32, i32>;
using pu32 = std::pair<u32, u32>;
const char alphabet_ASCII[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
                               'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
                               's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
const char ALPHABET_ASCII[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
                               'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                               'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

template <typename T> std::vector<T> read_into_vec(usize n) {
  std::vector<T> vec(n);
  for (usize i = 0; i < n; i++) {
    std::cin >> vec[i];
  }
  return std::move(vec);
}

template <typename T, typename Q>
std::ostream &operator<<(std::ostream &os, const std::pair<T, Q> &inp) {
  return os << "(" << inp.first << ", " << inp.second << ")";
}
template <typename T, typename Q>
std::istream &operator>>(std::istream &os, std::pair<T, Q> &inp) {
  os >> inp.first >> inp.second;
  return os;
}

template <typename T>
std::ostream &operator<<(std::ostream &os, const Vec<T> inp) {
  if (inp.size() == 0) {
    os << "[]";
    return os;
  }

  auto itr = inp.begin()++;
  os << "[";
  os << *itr;
  while (++itr != inp.end()) {
    os << ", " << *itr;
  }
  os << "]";
  return os;
}

// ╭───────────────────────╮
// │ define variables here │
// ╰───────────────────────╯

// ╭───────────────────────────────────╮
// │ set start state of variables here │
// ╰───────────────────────────────────╯
void pre() {
  // ...
}
// ╭───────────────────────────────────╮
// │ clear used resources if necessary │
// ╰───────────────────────────────────╯
void end() {
  // ...
}

// ╭───────────────────────╮
// │ read and solve a case │
// ╰───────────────────────╯
void solve() {
  // ...
}

int main() {
  cin.tie(NULL)->sync_with_stdio(false);
  pre();
#if MULTI == true
  int t;
  cin >> t;
  for (int i = 0; i < t; t++) {
    solve();
  }
#else
  solve();
#endif
  end();
  std::cout << std::flush;
}
