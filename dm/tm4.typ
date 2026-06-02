#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node, shapes

#import "../template.typ": *
#show: template.with([Дискретная математика. Теормин --- IV])

#let pair(a, b) = $chevron.l #a, #b chevron.r$
#let stirling(n, k) = $vec(delim: "{", #n, #k)$

= Комбинаторика <combinatorics>

== Ordered arrangements <ordered-arrangements>

Будем обозначать $[n]$ как множество натуральных чисел от $1$ до $n$.

_Упорядоченная расстановка_ $n$ элементов конечного множества $X$ --- отображение $s : [n] -> X$.

По сути это присвоение элементам из $X$ номеров из $[n]$, благодаря чему и устанавливается порядок. Таким образом можно описать строку, последовательность, кортеж и т.п.

== Permutations <permutations>

_Перестановка_ множества $X$ --- биекция $pi : [n] -> X$, причем обычно $X = [n]$.

Пример перестановки чисел $i in [5]$:

#figure(
  table(
    stroke: (x, y) => if (x == 0) { (right: 1pt) } + if (y == 0) { (bottom: 1pt) },
    columns: 6,
    [$i$], [1], [2], [3], [4], [5],
    [$pi(i)$], [3], [4], [2], [5], [1],
  ),
)

Множество всех перестановок $[n]$ обозначается как $S_n$. Его мощность вычисляется по формуле:

$
  abs(S_n) = n!
$

== k-permutations <k-permutations>

_$k$-перестановка_ --- упорядоченная расстановка $k$ _различных_ элементов из $x$, то есть инъекция $pi : [k] -> X$

Множество всех $k$-перестановок множества $[n]$ обозначается как $P(n, k)$. Его мощность вычисляется по формуле:

$
  abs(P(n, k)) = n dot (n-1) dot ... dot (n - k + 1) = n! / (n-k)!
$

Эта формула также обозначается как $n^underline(k)$ или $(n)_k$.

В частности, $S_n = P(n, n)$.

== Cyclic permutations <cyclic-permutations>

Циклическая $k$-перестановка --- расстановка $k$ элементов из $[n]$ по кругу.

Например, пусть $n = k = 3$. Тогда расстановки $(1, 2, 3), (2, 3, 1)$ и $(3, 1, 2)$ будут считаться идентичными:

#figure(
  render(diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0.75, 0), $1$, name: <1>),
    node((0, 1), $2$, name: <2>),
    node((1.5, 1), $3$, name: <3>),
    edge(<1>, <2>, "-}>"),
    edge(<2>, <3>, "-}>"),
    edge(<3>, <1>, "-}>"),
  )),
)

Но $(1, 2, 3)$ и $(1, 3, 2)$ --- различные.

#figure(
  render(grid(
    columns: 3,
    column-gutter: 2em,
    align: center + horizon,
    diagram(
      spacing: 2em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((0.75, 0), $1$, name: <1>),
      node((0, 1), $2$, name: <2>),
      node((1.5, 1), $3$, name: <3>),
      edge(<1>, <2>, "-}>"),
      edge(<2>, <3>, "-}>"),
      edge(<3>, <1>, "-}>"),
    ),
    $eq.not$,
    diagram(
      spacing: 2em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((0.75, 0), $1$, name: <1>),
      node((0, 1), $3$, name: <3>),
      node((1.5, 1), $2$, name: <2>),
      edge(<1>, <3>, "-}>"),
      edge(<3>, <2>, "-}>"),
      edge(<2>, <1>, "-}>"),
    ),
  )),
)

Множество всех циклических $k$-перестановок обозначается как $P_c (n, k)$. Его мощность вычисляется по формуле:

$
  abs(P_c (n, k)) = n! / (k dot (n-k)!)
$

== Unordered arrangements <unordered-permutations>

_Неупорядоченная расстановка_ $k$ элементов множества $X$ --- #link(<multisets>)[мультимножество] $S = pair(X, r)$ мощности $k$.

Более интересным является частный случай, когда кратность каждого элемента из $S$ равна единице. Тогда просто $S subset.eq X$. И из этого также следует, что все элементы $S$ различные. Все это в совокупности подводит к понятию $k$-сочетаний...

== k-combinations <k-combinations>

_$k$-сочетание множества_ $X$ --- неупорядоченная расстановка $k$ _различных_ элементов из $X$. Или же просто подмножество $X$ мощности $k$.

Множество всех $k$-сочетаний обозначается так:

$
  binom(X, k) = {A subset.eq X | abs(A) = k}
$

Например, множество ребер в простом неориентированном графе --- это 2-сочетания его вершин, то есть $E subset.eq binom(V, 2)$.

Если $abs(X) = n$, то имеет место обозначение:

$
  binom(n, k) := abs(binom(X, k))
$

и вычисляется по формуле:

$
  binom(n, k) = n! / (k! dot (n-k)!)
$


== Binomial theorem <binomial-thm>

$
  (x + y)^n = sum_(k = 0)^n binom(n, k) dot x^k dot y^(n - k),
$

где $n$ --- целое неотрицательное.

== Multisets <multisets>

_Мультимножество_ --- такое множество, которое допускает повторяющиеся элементы. Обозначается как $M = pair(X, r)$, где:
- $X$ --- базовое множество,
- $r : X -> NN_0$ --- функция кратности.

Например, пусть дано:

$
  X = {a, b, c}, quad r(a) = 2, quad r(b) = 1, quad r(c) = 3.
$

Тогда $M = pair(X, r)$ выглядит так:

$
  M = {a, a, b, c, c, c}^* = {2 dot a, space 1 dot b, space 3 dot c}
$

P.S. Также встречается нотация кратности $r_a = 2, space r_b = 1, space r_c = 3$.


== Permutations of multisets <multiset-permutations>

Пусть $M$ --- конечное мультимножество над базовым множеством $X$. _$k$-перестановка_ $M$ --- упорядоченная расстановка $k$ элементов из $M$, при которой перестановка совпадающих элементов не важна.

Уточнение: $k = sum k_i$, то есть это сумма кратностей элементов перестановки.

Более интересен частный случай, когда $n = k$. Количество всех перестановок $M$ равно  _мультиномиальному коэффициенту_, который вычисляется по формуле:

$
  binom(n, k_1, ..., k_r) = n! / (k_1 ! space ... space k_r !)
$

== Combinations of infinite multisets <inf-multiset-permutations>

Пусть дано мультимножество $S = pair(X, r)$, у которого $abs(X) = s$. И пусть $r_x >= k$ для выбранного $k$ (либо просто $r_x = oo$).

Количество $k$-сочетаний _достаточно большого_ (или _бесконечного_) мультимножества вычисляется по формуле:

$
  binom(k + s - 1, k) "или" binom(k + s - 1, s - 1)
$

Шары и перегородки...

== Multinomial theorem <multinomial-thm>

$
  (x_1 + ... + x_r)^n = sum_(0 <= k_1, ..., k_r <= n \ k_1 + ... k_r = n)^n binom(n, k_1, ..., k_r) dot x_1^k_1 dot ... dot x_r^k_r
$

Биномиальная теорема --- частный случай мультиномиальной при $r = 2$.

== Compositions <compositions>

- _Слабая композиция_ целого неотрицательного числа $k$ из $s$ частей --- решение уравнения $b_1 + ... + b_s = k$, где $b_i >= 0$.

  Например, пусть $k = 3$ и $s = 2$. Тогда возможные решения для $b_1 + b_2 = 3$ таковы:
  - $(b_1, b_2) = (0, 3)$
  - $(b_1, b_2) = (3, 0)$
  - $(b_1, b_2) = (1, 2)$
  - $(b_1, b_2) = (2, 1)$

  Общее число слабых композиций считается по формуле:

  $
    binom(k + s - 1, k, s - 1)
  $

- _Композиция_ целого положительного $k$ из $s$ частей ---- решение того же уравнения, но $b_i > 0$. Общее число композиций вычисляется по формуле:

  $
    binom(k - 1, s - 1)
  $

== Stirling numbers of the second kind <stirling-2nd-kind>

_Число Стирлинга второго типа_ --- количество различных разбиений множества $X$ мощности $n$ на $k$ блоков. Обозначается как $S(n, k)$ или $stirling(n, k)$ и вычисляется по рекурсивной формуле:

$
  stirling(n, k) = cases(
    1 quad &n = k = 0,
    0 quad &n = 0 "или" k = 0,
    stirling(n - 1, k - 1) + k dot stirling(n - 1, k) quad &"в остальных случаях"
  )
$

== Bell numbers <bell>

_Число Белла_ --- количество всевозможных разбиений $X$ ($abs(X) = n$) на произвольное количество блоков. Обозначается как $B_n$ и вычисляется по формуле:

$
  B_n = sum_(k=0)^n stirling(n, k)
$

== Integer partitions <int-partitions>

_Разбиение_ целого положительного числа $n$ на $k$ положительных слагаемых --- решение уравнения $n = a_1 + ... + a_k$, где $a_1 >= a_2 >= ... >= a_k >= 1$. Порядок слагаемых не важен.

Количество различных $k$-разбиений обозначается как $p_k (n)$ вычисляется по рекурсивной формуле:

$
  p_k (n) = cases(
    1 quad &n = k = 0,
    0 quad &n >= 1 "и" k = 0,
    0 quad &k >= n,
    p_k (n - k) + p_(k - 1) (n - 1) quad &1 <= k <= n
  )
$

Количество всевозможных разбиений (т.н. _функция разбиения_):

$
  p(n) = sum_(k = 0)^n p_k (n)
$

== Principle of Inclusion-Exclusion <pie>

Пусть дано:
- конечное множество $X$,
- свойства $P_1, ..., P_m$.

Определим следующие множества:
- $X_i = {x in X | x "обладает свойством" P_i}$,
- $S subset.eq [m]$,
- $N(S) = {x in X | forall i in S : x "обладает свойством" P_i}$, или же $N(S) = inter.big_(i in S) X_i$.

Количество элементов из $X$, которые не удовлетворяют никаким из свойств $P_1, ..., P_m$ вычисляется по формуле:

$
  abs(x without (X_1 union ... union X_m)) = sum_(S subset.eq [m]) (-1)^abs(S) abs(N(S))
$

Это и называется принципом включений-исключений.

// = Рекуррентные соотношения <recurrencies>

// == Recurrence relations <recurrency-rels>

// == Solving recurrence relations using characteristic equations <recurrency-char-eq>

// == Generating functions <generating-fns>

// == Power series and operations on power series <power-series>

// == Solving linear recurrences using generating functions <linear-recurrencies-gen-fns>

// == Solving combinatorial problems using generating functions <comb-problems-gen-fns>

// == Operators and annihilators <operators-annihilators>

// == Solving linear recurrences using annihilators <linear-recurrencies-annihilators>

// == Catalan numbers <catalan>

// == Generalized binomial theorem <generalized-binomial-thm>

// == Gamma function <gamma-fn>

// == Divide-and-Conquer algorithms analysis using recursion trees <div-conquer-analysis>

// == Master theorem <master-thm>

// == Akra–Bazzi method <akra-bazzi>

