#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes
#import "@preview/finite:0.5.1" as finite: automaton, transition-table

#import "../template.typ": *
#show: template.with([Дискретная математика. Теормин --- II])

= Графы <graphs>

Для начала, стоит дать определение графа. Есть два подхода:

+ Абстрактный. В нем граф --- кортеж $G = (V, E, F)$, где:
  - $V$ --- конечное множество вершин;
  - $E$ --- конечное множество ребер;
  - $F$ --- множество функций, задающих структуру графа.

+ Структурный. В нем граф --- кортеж $G = (V, E)$, где:
  - $V$ --- множество вершин;
  - $E$ --- множество ребер.

== Directed and undirected graphs <dir-undir-graphs>

_Направленный_ граф --- граф, ребра которого имеют четко отличимые начало и конец ребра.

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((1, 0), $c$, name: <c>),
    edge(<a>, <b>, "-}>"),
    edge(<a>, <c>, "-}>"),
    edge(<b>, <c>, "-}>"),
  ),
)

- В абстрактном подходе, направление задается двумя функциями:
  - $"begin" : E -> V$;
  - $"end" : E -> V$.
- В структурном подходе, $E subset.eq V times V$ (то есть ребро просто описывается парой вершин $chevron.l "from", "to" chevron.r$).

В _ненаправленном_ графе ребро описывается просто двумя равноправными концами.

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((1, 0), $c$, name: <c>),
    node((1, 1), $d$, name: <d>),
    edge(<a>, <b>),
    edge(<a>, <c>),
    edge(<b>, <d>),
    edge(<a>, <d>),
  ),
)

- В абстрактом подходе, ребро описывается функцией $"ends" : E -> binom(V, 2)$
- В структурном подходе, $E subset.eq binom(V, 2)$.

_P.S._ $binom(V, 2) = {{u, v} | u, v in V, u != v}$, то есть просто множество из двух вершин.

== Simple graphs and pseudographs <simple-pseudo-graphs>

_Простой граф_ --- граф без петель и кратных ребер.

_Псевдограф_ --- граф, допускающий петли и кратные ребра.

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((1, 0), $c$, name: <c>),
    edge(<a>, <a>, bend: 120deg),
    edge(<a>, <b>, bend: 10deg),
    edge(<a>, <b>, bend: -10deg),
    edge(<a>, <c>),
    edge(<b>, <c>, bend: 15deg),
    edge(<b>, <c>),
    edge(<b>, <c>, bend: -15deg),
  ),
)

== Multiedges and multigraphs <multi-edges-graph>

- _Кратные ребра_ --- ребра, соединяющие одну и ту же пару вершин.
- _Мультиграф_ --- граф, допускающий кратные ребра, но не допускающий петли.

== Null, empty, singleton graphs <null-empty-singleton-graphs>

- _Нуль-граф_ --- граф без вершин.
- _Пустой граф_ --- граф без ребер.
- _Синглтон-граф_ (_тривиальный граф_) --- граф с одной вершиной.

== Complete graph <complete-graph>

_Полный граф_ $K_n$ --- граф c $n$ вершинами, где каждая пара вершин соединена ребром.

#figure(
  [
    #grid(
      columns: 2,
      column-gutter: 2em,
      align: horizon,
      diagram(
        spacing: 2em,
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node-shape: circle,
        node((0.5, 0), $a$, name: <a>),
        node((0, 1), $b$, name: <b>),
        node((1, 1), $c$, name: <c>),
        edge(<a>, <c>),
        edge(<a>, <b>),
        edge(<b>, <c>),
      ),
      diagram(
        spacing: 1em,
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node-shape: circle,
        node((1, 0), $a$, name: <a>),
        node((0, 0.75), $b$, name: <b>),
        node((2, 0.75), $c$, name: <c>),
        node((0.5, 1.9), $d$, name: <d>),
        node((1.5, 1.9), $e$, name: <e>),
        edge(<a>, <b>),
        edge(<b>, <c>),
        edge(<c>, <d>),
        edge(<d>, <e>),
        edge(<e>, <a>),
        edge(<b>, <d>),
        edge(<c>, <e>),
        edge(<a>, <c>),
        edge(<a>, <d>),
        edge(<b>, <e>),
      )
    )
  ],
)

== Weighted graph <weighted-graph>

_Взвешенный граф_ --- граф, где каждому ребру сопоставлен _вес_ --- некоторое число.

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0.5, 0), $a$, name: <a>),
    node((-0.25, 1), $b$, name: <b>),
    node((1.25, 1), $c$, name: <c>),
    edge(<a>, <c>, label: 0.7, label-angle: auto,),
    edge(<a>, <b>, label: 2.39, label-angle: auto),
    edge(<b>, <c>, label: 33.7, label-anchor: "north", label-sep: -2pt),
  ),
)

- В абстрактном подходе, в $F$ добавляется функция $"weight" : E -> RR$.
- В структурном подходе, $E = V times V times RR$

== Planar graphs <planar-graph>

_Планарный граф_ --- граф, который можно нарисовать на плоскости без пересечений ребер. На примере $K_4$:

#figure(
  grid(
    columns: 3,
    column-gutter: 1em,
    align: center + horizon,
    diagram(
      spacing: 2em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((0, 0), $a$, name: <a>),
      node((1, 0), $b$, name: <b>),
      node((1, 1), $c$, name: <c>),
      node((0, 1), $d$, name: <d>),
      edge(<a>, <b>),
      edge(<b>, <c>),
      edge(<c>, <d>),
      edge(<a>, <d>),
      edge(<a>, <c>),
      edge(<b>, <d>),
    ),
    $==>$,
    diagram(
      spacing: 2em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((0.5, 0), $a$, name: <a>),
      node((0.5, 0.65), $b$, name: <b>),
      node((1.25, 1), $c$, name: <c>),
      node((-0.25, 1), $d$, name: <d>),
      edge(<a>, <b>),
      edge(<b>, <c>),
      edge(<c>, <d>),
      edge(<a>, <d>),
      edge(<a>, <c>),
      edge(<b>, <d>),
    ),
  )
)

Теорема (Куратовского): граф планарный тогда и только тогда, когда не содержит подграфов-подразделений $K_5$ или $K_(3,3)$.

_Подразделение_ графа $G$ получается в результате замены ребер путями, то есть в ребро "вставляется" вершина.

#figure(
  grid(
    columns: 3,
    column-gutter: 1em,
    align: center + horizon,
    diagram(
      spacing: 2em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((0.5, 0), $a$, name: <a>),
      node((-0.25, 1), $b$, name: <b>),
      node((1.25, 1), $c$, name: <c>),
      edge(<a>, <b>),
      edge(<b>, <c>),
      edge(<a>, <c>),
    ),
    $==>$,
    diagram(
      spacing: 2em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((0.5, 0), $a$, name: <a>),
      node((-0.25, 1), $b$, name: <b>),
      node((1.25, 1), $c$, name: <c>),
      node((0.85, 0.5), $x$, name: <x>, inset: 2pt),
      node((0.5, 1), $y$, name: <y>, inset: 2pt),
      node((0.15, 0.5), $z$, name: <z>, inset: 2pt),
      edge(<a>, <x>),
      edge(<x>, <c>),
      edge(<c>, <y>),
      edge(<y>, <b>),
      edge(<y>, <b>),
      edge(<b>, <z>),
      edge(<z>, <a>),
    ),
  )
)

== Hypergraphs <hypergraph>

_Гиперграф_ --- граф, ребра которого соединяют не пару, а произвольное подмножество вершин. Описывается функцией вида $"incidence" : E -> 2^V$. Либо можно описать с помощью матрицы инцидентности.

#figure(
  image("assets/hypergraph.svg", width: 50%),
)

== Subgraph, spanning subgraph <sub-spanning-graph>

$H = (V', E')$ называется _подграфом_ графа $G = (V, E)$, если:
$
  V' subset.eq V quad and quad E' subset.eq E
$
Обозначается как $H subset.eq G$.

_Охватывающий_ (_spanning_) подграф содержит все вершины: $V' = V$

== Induced subgraph <induced-graph>

_Индуцированный_ подграф $G[S]$ над подмножеством вершин $S subset.eq V$ --- подграф, содержащий все ребра между вершинами из $S$.

== Adjacency relation <adj-rel>

Пара вершин $u, v$ называют _смежными_, если существует ребро ${u, v} in E$.

== Incidence relation <inc-rel>

Ребро $e in E$ называется _инцидентным_ вершине $v in V$, если $v$ является концом $e$.

== Vertex degree <deg>

_Степень_ вершины $v$ --- число инцидентных ему ребер. Обозначается как $deg(v)$.

- $delta(G) = min_(v in V) deg(v)$ --- _минимальная степень графа $G$_.
- $Delta(G) = max_(v in V) deg(v)$ --- _максимальная степень графа $G$_.

== Regular graph <regular-graph>

$r$-регулярный граф --- граф, у которого каждая вершина имеет степень $r$.

#figure(
  diagram(
    spacing: 1em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((1, 0), $a$, name: <a>),
    node((0, 0.75), $b$, name: <b>),
    node((2, 0.75), $c$, name: <c>),
    node((0.5, 1.9), $d$, name: <d>),
    node((1.5, 1.9), $e$, name: <e>),
    edge(<a>, <b>),
    edge(<d>, <e>),
    edge(<b>, <d>),
    edge(<c>, <e>),
    edge(<a>, <c>),
  ),
  caption: "2-регулярный граф",
  supplement: none,
)

== Handshaking lemma <handshaking-lem>

Сумма всех степеней равна удвоенному количеству ребер:

$
  sum_(v in V) deg(v) = 2 abs(E)
$

== Graph isomorphism <graph-isomorphism>

Два графа $G_1 = (V_1, E_1)$ и $G_2 = (V_2, E_2)$ изоморфны, если существует биекция между вершинами $phi : V_1 -> V_2$, которая сохраняет смежность:

$
  {u, v} in E_1 quad<==>quad {phi(u), phi(v)} in E_2
$

Простыми словами, пара графов изоморфна, если у них одинаковая структура, но разные лейблы вершин.

#figure(
  grid(
    columns: 3,
    column-gutter: 3em,
    align: center + horizon,

    diagram(
      node-inset: 0.25em,
      node-shape: circle,
      node-stroke: 1pt,
      edge-stroke: 1pt,

      node((0, 0), $a$, name: <a>),
      node((2, 0), $b$, name: <b>),
      node((2, 2), $c$, name: <c>),
      node((0, 2), $d$, name: <d>),

      node((0.5, 0.5), $w$, name: <w>),
      node((1.5, 0.5), $x$, name: <x>),
      node((1.5, 1.5), $y$, name: <y>),
      node((0.5, 1.5), $z$, name: <z>),

      edge(<a>, <b>),
      edge(<b>, <c>),
      edge(<c>, <d>),
      edge(<a>, <d>),
      edge(<w>, <x>),
      edge(<x>, <y>),
      edge(<y>, <z>),
      edge(<w>, <z>),
      edge(<a>, <w>),
      edge(<b>, <x>),
      edge(<c>, <y>),
      edge(<d>, <z>),
    ),

    text(size: 16pt, $tilde.equiv$),

    diagram(
      node-inset: 0.25em,
      node-shape: circle,
      node-stroke: 1pt,
      edge-stroke: 1pt,

      node((0.5, 0), $a$, name: <a>),
      node((1.5, 1), $b$, name: <b>),
      node((0.5, 2), $c$, name: <c>),
      node((-0.5, 1), $d$, name: <d>),

      node((1.5, 0), $w$, name: <w>),
      node((2.5, 1), $x$, name: <x>),
      node((1.5, 2), $y$, name: <y>),
      node((0.5, 1), $z$, name: <z>),

      edge(<a>, <b>),
      edge(<b>, <c>),
      edge(<c>, <d>),
      edge(<a>, <d>),
      edge(<w>, <x>),
      edge(<x>, <y>),
      edge(<y>, <z>),
      edge(<w>, <z>),
      edge(<a>, <w>),
      edge(<b>, <x>),
      edge(<c>, <y>),
      edge(<d>, <z>),
    )
  ),
)

== Walks, paths, trails, cycles <walks-paths-trails-cycles>

- _Walk_ графа --- чередующаяся последовательность ребер и вершин:
  $
    (v_0, e_1, v_1, e_2, ..., e_k, v_k)
  $
  Начинается и заканчивается с вершины. Ребро соединяет левую и правую вершины в последовательности.
- _Trail_ --- walk без повторяющихся ребер.
- _Path_ --- walk без повторяющихся вершин.

Циклы:
- _Circuit_ --- замкнутый trail (то есть вершины в начале и конце последовательности совпадают).
- _Cycle_ --- замкнутый path.

_Длина_ пути (walk'а 🐺) --- количество ребер в нем.

== Eulerian path, cycle, graph <eulerian-graph>

- Эйлеров _путь_ --- путь (правильней сказать trail, ну просто нормального перевода на русский нет), посещающий _каждое_ ребро ровно один раз.
- Эйлеров _цикл_ --- замкнутый эйлеров путь.
- Граф _эйлеров_, если есть эйлеров цикл.

== Eccentricity of a vertex <ecc>

_Расстояние_ между вершинами $u, v$ --- длина кратчайшего пути между ними. Обозначается как $"dist"(u, v)$.

_Эксцентриситет_ вершины $v$ --- максимально возможное расстояние от вершины $v$:
$
  "ecc"(v) = max_(v in V) "dist"(v, u)
$

== Radius and diameter of a graph <rad-diam>

- _Радиус_ графа --- минимальнй эксцентриситет:
  $
    "rad"(G) = min_(v in V) "ecc"(v)
  $
- Диаметр графа --- максимальный эксцентриситет:
  $
    "diam"(G) = max_(v in V) "ecc"(v)
  $

Есть теорема о том, что для всякого связного графа:
$
  "rad"(G) <= "diam"(G) <= 2 "rad"(G)
$

== Center of a graph <graph-center>

_Центр_ графа --- множество вершин, у которых эксцентриситет равен радиусу:

$
  "center"(G) = {v in V | "ecc"(v) = "rad"(G)}
$

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 0), $a$, name: <a>),
    node((1, 0), $b$, name: <b>, fill: green.transparentize(70%)),
    node((2, 0), $c$, name: <c>, fill: green.transparentize(70%)),
    node((3, 0), $d$, name: <d>),
    edge(<a>, <b>),
    edge(<c>, <d>),
    edge(<b>, <c>),
  ),
)

== Centroid of a tree <tree-centroid>

_Центроида_ дерева --- вершина, при удалении которой, каждое дерево из полученного леса будет иметь не более, чем $abs(V)/2$ вершин. #footnote[https://usaco.guide/plat/centroid?lang=cpp#centroids]

== Clique <clique>

_Клика_ --- полный подграф.

- Клика _максимальная_, если в нее нельзя добавить вершин.
- Клика _наибольшая_, если число вершин в ней максимально возможный.
- _Кликовое число_ $omega(G)$ --- число вершин в наибольшей клике.

== Independent set <indepentent-set>

_Независимое множество_ $S subset.eq V$ --- множество попарно несмежных вершин.

_Он же stable set._

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 0.5), $a$, name: <a>),
    node((1, 0), $b$, name: <b>, fill: green.transparentize(70%)),
    node((1, 1), $c$, name: <c>, fill: green.transparentize(70%)),
    node((2, 0.5), $d$, name: <d>),
    node((3, 0.5), $e$, name: <e>, fill: green.transparentize(70%)),
    edge(<a>, <b>),
    edge(<c>, <d>),
    edge(<a>, <c>),
    edge(<b>, <d>),
    edge(<d>, <e>),
  ),
)

== Matching, perfect matching <matching>

_Паросочетание_ $M subset.eq E$ --- множество попарно несмежных ребер (т.е. между любой парой ребер нет общей вершины).

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((0, 2), $c$, name: <c>),
    node((2, 0.5), $x$, name: <x>),
    node((2, 1.5), $y$, name: <y>),
    edge(<a>, <x>, stroke: blue + 2pt),
    edge(<b>, <x>),
    edge(<b>, <y>, stroke: blue + 2pt),
    edge(<c>, <x>),
  ),
)

- Паросочетание _максимальное_, если в нее нельзя добавить ребер.
- Паросочетание _наибольшее_, если оно максимально возможного размера.
- _Совершенное паросочетание_ покрывает все вершины.

== Vertex cover, edge cover <vertex-edge-cover>

- _Вершинное покрытие_ $R subset.eq V$ --- такое множество вершин, что все ребра графа инцидентны какой-либо вершине из $R$.
- _Реберное покрытие_ $F subset.eq E$ --- такое множество ребер, что все вершины графа смежны с любым ребром из $F$.

== Tree, forest <tree-forest>

- _Дерево_ --- связный ациклический граф.
- _Лес_ --- ациклический граф (система непересекающихся деревьев).

#figure(
  diagram(
    spacing: 0.5em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((1, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((2, 1), $c$, name: <c>),
    node((3, 2), $d$, name: <d>),
    node((1, 2), $e$, name: <e>),
    edge(<a>, <b>),
    edge(<c>, <d>),
    edge(<a>, <c>),
    edge(<c>, <e>),
  ),
)

== Minimum spanning tree <mst>

_Минимальное остовное дерево_ связного графа --- подграф-дерево, содержащий все вершины, сумма весов ребер которой минимальна.

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0.5, 0), $a$, name: <a>),
    node((-0.25, 1), $b$, name: <b>),
    node((1.25, 1), $c$, name: <c>),
    edge(<a>, <c>, label: 0.7, label-angle: auto, stroke: blue + 2pt),
    edge(<a>, <b>, label: 2.39, label-angle: auto, stroke: blue + 2pt),
    edge(<b>, <c>, label: 33.7, label-anchor: "north", label-sep: -2pt),
  ),
)

== Prüfer code <prufer>

_Код Прюфера_ --- однозначная кодировка дерева в виде последовательности из $n - 2$ вершин.

Алгоритм кодирования:
+ Удаляем лист с наименьшим номером;
+ Записываем в последовательность номер вершины, смежной с удаленным листом;
+ Повторяем процесс, пока не останется всего 2 вершины.

#figure(
  grid(
    columns: 9,
    column-gutter: 1em,
    align: center + horizon,
    diagram(
      spacing: 0.5em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((1, 0), $1$, name: <a>, fill: blue.transparentize(50%), stroke: blue),
      node((0, 1), $2$, name: <b>, stroke: red),
      node((2, 1), $3$, name: <c>),
      node((3, 2), $4$, name: <d>),
      node((1, 2), $5$, name: <e>),
      edge(<a>, <b>),
      edge(<c>, <d>),
      edge(<a>, <c>),
      edge(<c>, <e>),
    ),
    $==>$,
    diagram(
      spacing: 0.5em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((1, 0), $1$, name: <a>, stroke: red),
      node((2, 1), $3$, name: <c>, fill: blue.transparentize(50%), stroke: blue),
      node((3, 2), $4$, name: <d>),
      node((1, 2), $5$, name: <e>),
      edge(<c>, <d>),
      edge(<a>, <c>),
      edge(<c>, <e>),
    ),
    $==>$,
    diagram(
      spacing: 0.5em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((2, 1), $3$, name: <c>, fill: blue.transparentize(50%), stroke: blue),
      node((3, 2), $4$, name: <d>, stroke: red),
      node((1, 2), $5$, name: <e>),
      edge(<c>, <d>),
      edge(<c>, <e>),
    ),
    $==>$,
    diagram(
      spacing: 0.5em,
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node-shape: circle,
      node((2, 1), $3$, name: <c>),
      node((1, 2), $5$, name: <e>),
      edge(<c>, <e>),
    ),
    $==>$,
    $(1, 3, 3)$
  )
)

== Bipartite graph <bipartite-graph>

Граф $G = (V, E)$ --- _двудольный_, если его вершины можно разбить на два непересекающихся множества, чтобы ребра соединяли вершины из этих двух множеств.

#figure(
  diagram(
    spacing: 2em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node(enclose: ((0, 0), (0.25, 2.5)), snap: -1, stroke: (dash: "dashed"), name: <asdf>, inset: 8pt, shape: shapes.rect, corner-radius: 8pt),
    node(enclose: ((2, 0.5), (2.25, 1.75)), snap: -1, stroke: (dash: "dashed"), name: <asdf>, inset: 8pt, shape: shapes.rect, corner-radius: 8pt),
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((0, 2), $c$, name: <c>),
    node((2, 0.5), $x$, name: <x>),
    node((2, 1.5), $y$, name: <y>),
    edge(<a>, <x>),
    edge(<b>, <x>),
    edge(<b>, <y>),
    edge(<c>, <x>),
  ),
)

Теорема: граф двудольный тогда и только тогда, когда не содержит циклов нечетной длины.

== Connectivity in undirected graphs <connectivity-undir>

- Две вершины в ненаправленном графе называют _связными_, если существует путь между ними.
- Граф называют _связным_, если все вершины попарно связные.
- _Компонента связности_ --- максимально связный подграф.

== Strong and weak connectivity in directed graphs <connectivity-dir>

- Направленный граф _слабо связный_, если замена ребер на ненаправленные приводит к связному графу.
- Направленный граф _полусвязный_, если для любой пары вершин $u, v in V$ есть путь $u -> v$ _или_ $v -> u$.
- Направленный граф _сильно связный_, если между любыми двумя вершинами есть путь в обе стороны.

_Компонента слабой/сильной/полу- связности_ --- максимально соответственно связный подграф.

== Condensation of a directed graph <scc-condensation>

_Конденсация_ направленного графа --- сжатие компонент сильной связности в одну вершину.

== Vertex connectivity <vertex-connectivity>

_Вершинная связность_ $kappa(G)$ --- минимальное количество вершин, которое надо удалить, чтобы $G$ перестал быть связным, либо состоял из одной вершины.

== Edge connectivity <edge-connectivity>

_Реберная связность_ $lambda(G)$ --- минимальное количество ребер, которое надо удалить, чтобы $G$ перестал быть связным.

== k-connected graph <k-connected-graph>

- Граф _$k$-вершинно-связный_ (или же просто $k$-связный), если $kappa(G) >= k$.

  Другими словами, у графа больше, чем $k$ вершин, и при удалении менее, чем $k$ вершин сохранится связность.

- Граф _$k$-реберно-связный_, если $lambda(G) >= k$.

  Другими словами, при удалении менее, чем $k$ ребер сохранится связность.

== Biconnectivity <biconnectivity>

Граф _двусвязный_, если при удалении любой одной вершины сохранится связность.

== Articulation point, bridge <bridge-cut-vertex>

_Точка сочленения_ (_шарнир_) --- вершина, при удалении которой увеличится количество компонент связности.

#figure(
  diagram(
    spacing: 2em,
    node-shape: circle,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((1, 0.5), $c$, name: <c>, fill: purple.transparentize(75%)),
    node((2, 0), $d$, name: <d>),
    node((2, 1), $e$, name: <e>),
    edge(<a>, <b>),
    edge(<a>, <c>),
    edge(<b>, <c>),
    edge(<c>, <d>),
    edge(<d>, <e>),
    edge(<c>, <e>),
  ),
)

_Мост_ --- ребро, при удалении которой увеличится количество компонент связности.

#figure(
  diagram(
    spacing: 2em,
    node-shape: circle,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0, 0), $a$, name: <a>),
    node((0, 1), $b$, name: <b>),
    node((1, 0.5), $c$, name: <c>),
    node((3, 0.5), $d$, name: <d>),
    node((4, 0), $e$, name: <e>),
    node((4, 1), $f$, name: <f>),
    edge(<a>, <b>),
    edge(<a>, <c>),
    edge(<b>, <c>),
    edge(<c>, <d>, stroke: 2pt + purple),
    edge(<d>, <e>),
    edge(<e>, <f>),
    edge(<d>, <f>),
  ),
)

== Blocks, block-cut tree <blocks>

- _Блок_ --- максимальный связный подграф без точек сочленения. Другими словами, это или двусвязный подграф, или мост, или изолированная вершина.
- _Block-cut дерево_ --- двудольное дерево, в котором одна доля --- блоки, сжатые в одну вершину, а вторая доля --- точки сочленения, соединяющие блоки.

= Чето там выделенное другим цветом <idk>

== Euler's theorem for graphs <euler-thm>

- Связный граф имеет эйлеров _цикл_ тогда и только тогда, когда каждая вершина имеет четную степень.
- Связный граф имеет эйлеров _путь_ тогда и только тогда, когда ровно две вершины имеют нечетную степень.

== Hamiltonian path, cycle, graph <hamiltonian>

- _Гамильтонов путь_ --- путь, в котором каждая вершина графа посещена ровно один раз.
- _Гамильтонов цикл_ --- замкнутный гамильтонов путь.
- Граф _гамильтонов_, если содержит гамильтонов цикл.

Проверка графа на гамильтоновость --- NP-полная задача (в то время как проверка на эйлеровость решается за $cal(O)(n)$).

== Ore’s theorem <ore-thm>

Если $G$ имеет $n >= 3$ вершин и для любой пары несмежных вершин $u, v in V$ выполняется $ deg(u) + deg(v) >= n, $ то граф гамильтонов.

== Dirac’s theorem <dirac-thm>

Если $G$ имеет $n >= 3$ вершин и $delta(G) >= n/2$, то граф гамильтонов.

== Theorem on the balance of regular bipartite graphs <regular-bipartite-balance>

Если двудольный граф $G = (X, Y, E)$ регулярный, то $abs(X) = abs(Y)$. #footnote[https://www.youtube.com/watch?v=73u0OQCR2rs]

== Theorem on the existence of a perfect matching in a regular bipartite graph <regular-bipartite-perfect>

В регулярном двудольном графе существует совершенное паросочетание.

== Hall's theorem (on the existence of an X-perfect matching in a bipartite graph) <hall-thm>

_Соседство_ $N(S)$ двудольного графа $G = (X, Y, E)$ --- множество всех достижимых вершин из подмножества одной доли ($S subset.eq X$) в другую ($N(S) subset.eq Y$):

$
  N(S) = { y in Y | exists x in S. space {x, y} in E }
$

_Теорема Холла_: в двудольном графе существует совершенное паросочетание тогда и только тогда, когда для любого $S subset.eq X$ выполняется $abs(N(S)) >= abs(S)$.

== Whitney's theorem <whitney-thm>

Для любого графа $G$:

$
  #link(<vertex-connectivity>, $kappa(G)$) <= #link(<edge-connectivity>, $lambda(G)$) <= #link(<deg>, $delta(G)$)
$

== Menger's theorem <menger-thm>

- _$u$-$v$ разделитель_ (или вершинный разрез) --- множество вершин $S subset.eq V without {u, v}$, при удалении которых $u$ и $v$ окажутся в разных компонентах связности.
- Два различных пути между $u$ и $v$ называются _вершинно внутренне непересекающимися_, если в этих путях нет общих вершин, кроме $u$ и $v$.

_Теорема Менгера для вершин_: пусть $u$, $v$ --- пара несмежных вершин в $G$. Тогда _максимальное_ количество вершинно внутренне непересекающихся путей $u$-$v$ равно _минимальной_ мощности $u$-$v$ разделителя $S$.

Аналогичная теорема есть и для ребер.

- _$u$-$v$ реберный разрез_ --- множество ребер $F subset.eq E$, при удалении которых $u$ и $v$ окажутся в разных компонентах связности.
- Два различных пути между $u$ и $v$ называются _реберно внутренне непересекающимися_, если в этих путях нет общих ребер.

_Теорема Менгера для вершин_: пусть $u$, $v$ --- пара несмежных вершин в $G$. Тогда _максимальное_ количество реберно внутренне непересекающихся путей $u$-$v$ равно _минимальной_ мощности $u$-$v$ реберного разреза $F$.

Данная теорема имеет большую роль в транспортных сетях (в частности, в $s$-$t$ разрезе).

= Потоки <flows>

== Flow network <flow-net>

_Транспортная сеть_ --- кортеж $(V, E, s, t, c)$, где:
- $G = (V, E)$ --- направленный граф;
- $s, t in V$ --- _исток_ и _сток_ ($s != t$);
- $c : E -> R_(>=0)$  --- функция _емкости_ ребра, то есть сколько потока может течь по этому ребру.

#figure[
  #diagram(
    spacing: 3em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 1), $s$, stroke: green, fill: green.transparentize(75%), name: <s>),
    node((1, 2), $a$, name: <a>),
    node((1, 0), $b$, name: <b>),
    node((3, 2), $c$, name: <c>),
    node((2, 1), $d$, name: <d>),
    node((3, 0), $e$, name: <e>),
    node((4, 1), $t$, stroke: red, fill: red.transparentize(75%), name: <t>),
    edge(<s>, <a>, "-}>", [0/10], label-side: center, label-angle: auto),
    edge(<s>, <b>, "-}>", [0/8], label-side: center, label-angle: auto),
    edge(<b>, <a>, "-}>", [0/3], label-side: center, label-angle: auto),
    edge(<a>, <c>, "-}>", [0/5], label-side: center, label-angle: auto),
    edge(<a>, <d>, "-}>", [0/4], label-side: center, label-angle: auto),
    edge(<b>, <d>, "-}>", [0/10], label-side: center, label-angle: auto),
    edge(<b>, <e>, "-}>", [0/3], label-side: center, label-angle: auto),
    edge(<d>, <c>, "-}>", [0/3], label-side: center, label-angle: auto),
    edge(<e>, <d>, "-}>", [0/8], label-side: center, label-angle: auto),
    edge(<c>, <t>, "-}>", [0/8], label-side: center, label-angle: auto),
    edge(<d>, <t>, "-}>", [0/9], label-side: center, label-angle: auto),
    edge(<e>, <t>, "-}>", [0/10], label-side: center, label-angle: auto),
  )
]

== Flow value <flow-value>

_Поток_ сети $N$ --- функция $f : E -> RR_(>= 0)$, удовлетворяющая условиям:
+ _Ограничение по емкости_: $0 <= f(e) <= c(e)$. Простыми словами, поток не превышает емкость.
+ _Закон сохранения_: для любой вершины $v in V without {s, t}$: $ underbrace(sum_(e in "in"(v)) f(e), "сколько втекло") = underbrace(sum_(e in "out"(v)) f(e), "столько вытекло") $

_Величина потока_ $abs(f)$ --- поток через исток:
$
  abs(f) = underbrace(sum_(e in "out"(s)) f(e), "сколько вытекло из" s) - underbrace(sum_(e in "in"(s)) f(e), "сколько втелко в" s \ "(= 0, если входных" \ "ребер не было)")
$

== Residual network <residual-net>

_Остаточная сеть_ $N_f$ --- граф, у которой есть два типа ребер:
- Прямое ребро $u->v$. Его вес равен $c(u, v) - f(u, v)$, то есть сколько еще можно пустить потока.
- Обратное ребро $v->u$. Его вес равен $f(u, v)$, то есть сколько потока было пущено по ребру. Предназначен для отката потока.

_Дополняющий путь_ $P$ --- путь из $s$ в $t$ по остаточной сети. _Узкое горлышко_ (боттлнек) дополняющего пути равен минимальному весу ребра из $P$.

== Flow network cut <flow-net-cut>

_$s$-$t$ разрез_ сети $N$ --- разбиение вершин сети на два таких множества $(A, B)$, что $s in A$ и $t in B$.

#figure[
  #diagram(
    spacing: 3em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node-shape: circle,
    node((0, 1), $s$, stroke: red, fill: red.transparentize(75%), name: <s>),
    node((1, 2), $a$, stroke: red, fill: red.transparentize(75%), name: <a>),
    node((1, 0), $b$, stroke: green, fill: green.transparentize(75%), name: <b>),
    node((3, 2), $c$, stroke: green, fill: green.transparentize(75%), name: <c>),
    node((2, 1), $d$, stroke: green, fill: green.transparentize(75%), name: <d>),
    node((3, 0), $e$, stroke: green, fill: green.transparentize(75%), name: <e>),
    node((4, 1), $t$, stroke: green, fill: green.transparentize(75%), name: <t>),
    edge(<s>, <a>, "-}>", [9/10], label-side: center, label-angle: auto, stroke: red),
    edge(<s>, <b>, "-}>", [8/8], label-side: center, label-angle: auto, stroke: gray),
    edge(<b>, <a>, "--}>", [0/3], label-side: center, label-angle: auto, stroke: gray),
    edge(<a>, <c>, "-}>", [5/5], label-side: center, label-angle: auto, stroke: gray),
    edge(<a>, <d>, "-}>", [4/4], label-side: center, label-angle: auto, stroke: gray),
    edge(<b>, <d>, "-}>", [8/10], label-side: center, label-angle: auto, stroke: green),
    edge(<b>, <e>, "-}>", [0/3], label-side: center, label-angle: auto, stroke: green),
    edge(<d>, <c>, "-}>", [3/3], label-side: center, label-angle: auto, stroke: green),
    edge(<e>, <d>, "-}>", [0/8], label-side: center, label-angle: auto, stroke: green),
    edge(<c>, <t>, "-}>", [8/8], label-side: center, label-angle: auto, stroke: green),
    edge(<d>, <t>, "-}>", [9/9], label-side: center, label-angle: auto, stroke: green),
    edge(<e>, <t>, "-}>", [0/10], label-side: center, label-angle: auto, stroke: green),
  )
]

_Емкость_ $s$-$t$ разреза $(A, B)$ равен сумме емкостей ребер $A -> B$:
$
  c(A, B) := sum_((u, v) in E, \ u in A, space v in B) c(u, v)
$

_Поток_ $s$-$t$ разреза $(A, B)$ равен сумме потоков $A->B$ минус сумма потоков $B->A$:

$
  f(A, B) := sum_((u, v) in E, \ u in A, space v in B) f(u, v) - sum_((v, u) in E, \ v in B, space u in A) f(v, u)
$

_Теорема_: $f(A, B) = abs(f)$.

== Max-flow Min-cut theorem <maxflow-mincut>

В любой транспортной сети $N$, следующие условия эквивалентны:
+ $abs(f)$ максимален.
+ Не существует дополняющих путей в остаточной сети $N_f$
+ Существует $s$-$t$ разрез $(A, B)$, у которого $abs(f) = c(A, B)$

Более того, когда эти условия выполняются, разрез $(A, B)$ _минимален_, то есть имеет наименьшую емкость.

= Формальные языки <formal-langs>

Немного полезных определений:
- _Алфавит_ $Sigma$ --- конечное непустое множество символов. Пример: $Sigma = {a, b, c}$.
- _Слово_ --- конечная последовательность символов из $Sigma$. Особый случай --- пустое слово $epsilon$.
- _Звезда Клини_ --- множество всех конечных слов над алфавитом: $Sigma^* = union.big_(k=0)^oo Sigma^k$.
- _Формальный язык_ $L subset.eq Sigma^*$ --- множество конечных слов над конечным алфавитом.

Над формальными языками доступны различные операции:
- Мощность: $abs(L)$
- Дополнение: $overline(L) = {w | w in.not L} = Sigma^* without L$
- Объединение: $L_1 union L_2 = {w | w in L_1 or w in L_2}$
- Конкатенация: $L_1 dot L_2 = {a b | a in L_1, b in L_2}$
  - $L^k = L dot L dot ... dot L = {w_1 w_2 ... w_k | w_i in L}$, $L^0 = {epsilon}$
- Звезда Клини: $L^* = union.big_(k = 0)^oo L^k$

== Deterministic Finite Automaton (DFA) <dfa>

_Детерминированный конечный автомат (ДКА)_ --- 5-кортеж $(Q, Sigma, delta, q_0, F)$, в котором:
- $Q$ --- конечное множество _состояний_:
- $Sigma$ --- алфавит;
- $delta : Q times Sigma -> Q$ --- _функция перехода_;
- $q_0 in Q$ --- _начальное состояние_;
- $F subset.eq Q$ --- множество _принимающих состояний_.

ДКА --- машина, которая принимает очередной символ строки и совершает переход из текущего состояния в новое, в зависимости от входного символа. Автомат может _принимать_ или _отвергать_ строку, в зависимости от состояния, на котором он остановился.

#figure(
  grid(
    columns: 2,
    column-gutter: 2em,
    align: center + horizon,
    table(
      columns: 3,
      align: center,
      stroke: (x, y) => if y == 0 { (bottom: 1pt) } + if (x == 0) { (right: 1pt) },
      table.header([], [$0$], [$1$]),
      [$->q_1$], [$q_2$], [$q_2$],
      [$q_2^*$], [$q_1$], [$-$],
    ),
    automaton(
      (
        q1: (q2: (0, 1)),
        q2: (q1: 0),
      ),
      final: "q2",
      style: (
        state: (radius: 0.5, extrude: 0.8),
        transition: (curve: 0.5),
      ),
    ),
  ),
)

_Детерминированный_ означает, что в любом состоянии, для любого символа есть _ровно один_ переход.

== Non-deterministic Finite Automaton (NFA) <dfa>

_Недетерминированный конечный автомат (НКА)_ --- 5-кортеж $(Q, Sigma, delta, q_0, F)$, в котором:
- $Q$ --- конечное множество _состояний_;
- $Sigma$ --- алфавит;
- $delta : Q times Sigma -> 2^Q$ --- _функция перехода_;
- $q_0 in Q$ --- _начальное состояние_;
- $F subset.eq Q$ --- множество _принимающих состояний_.

#figure[
  #grid(
    columns: 2,
    column-gutter: 2em,
    align: center + horizon,
    [
      #table(
        columns: 3,
        align: center,
        stroke: (x, y) => if y == 0 { (bottom: 1pt) } + if (x == 0) { (right: 1pt) },
        table.header([], [$0$], [$1$]),
        [$->q_0$], [${ q_0, q_1 }$], [${ q_0 }$],
        [$q_1$], [$emptyset$], [${ q_2 }$],
        [$q_2^*$], [${ q_2 }$], [${q_2}$],
      )
    ],
    automaton(
      (
        q0: (q0: ("0", "1"), q1: "0"),
        q1: (q2: "1"),
        q2: (q2: ("0", "1")),
      ),
      final: "q2",
      style: (
        state: (radius: 0.5, extrude: 0.8),
        transition: (curve: 0.5),
        q0-q1: (curve: 0, label: (dist: -0.25)),
        q1-q2: (curve: 0, label: (dist: -0.25)),
      ),
    ),
  )
]

Главное отличие от ДКА в том, что для входного символа может быть несколько переходов в разные состояния.

== Regular language <regular-lang>

_Класс регулярных языков_ $"REG"$ (то есть множество всех возможных _регулярных_ формальных языков над $Sigma$) определяется индуктивно:

- $"Reg"_0 = {emptyset, {epsilon}} union {{a} | a in Sigma}$ --- _пустой_ и _синглтон-_ языки;
- $"Reg"_(i+1) = "Reg"_i union {A union B | A, B in "Reg"_i} union {A B | A, B in "Reg"_i} union {A^* | A in "Reg"_i}$

  То есть мы берем все языки из предыдущего _поколения_, объединяем/конкатенируем/применяем звезду Клини над ними, и добавляем их в новое поколение (вместе с предыдущим поколением, конечно).

Итак, $"REG" = union.big_(k=0)^oo "Reg"_k$.

== Regular expression <regex>

_Регулярное выражение_ --- нотация, описывающая регулярные языки (и операции над ними):
- $epsilon$ --- язык, состоящий только из пустого слова
- `a` --- синглтон-язык из символа `a`
- $alpha beta$ --- конкатенация двух языков.
- $alpha | beta$ --- объединение двух языков.
- $alpha^*$ --- звезда Клини над языком.

Пример регулярного выражения над $Sigma = {0, 1}$: `0*(1|0)`. Описывает все слова, которые начинаются с произвольного количества нулей и заканчиваются либо единицей, либо нулем. Например: `001`, `00000`, `1`.

Этого достаточно, чтобы описать какие-нибудь другие операции, например:

$
  alpha^+ = alpha alpha^* wide
  alpha? = alpha | epsilon wide
  alpha{n} = underbrace(alpha alpha ... alpha, n "раз")
$

Если для вас было не очень понятно определение REG, то по сути это множество всех возможных регулярных выражений над каким-то заданным алфавитом.

== Kleene's theorem <kleene-thm>

$"REG" = "AUT"$, где AUT --- класс языков, которые _распознаются_ с помощью ДКА. Язык _распознается_ ДКА, если каждое слово из языка принимается автоматом.

По сути это значит, что язык регулярный тогда и только тогда, когда его можно распознать с помощью ДКА.

== Thompson’s construction <thompson-construction>

_Построение Томпсона_ --- алгоритм построения $epsilon$-НКА из регулярного выражения.

Суть в том, регулярное выражение преобразуется в синтаксическое дерево, потом делаются автоматы для листьев, и потом из них делаются более крупные автоматы, в зависимости от операции объединения/конкатенации/звезды, и снизу вверх так по дереву.

#figure(  
  automaton(
    (
      q1: (q2: "e", q9: "e"),
      q2: (q3: 0),
      q3: (q4: "e", q6: "e"),
      q4: (q5: 0),
      q5: (q8: "e"),
      q6: (q7: 1),
      q7: (q8: "e"),
      q8: (q9: "e", q2: "e"),
      q9: (),
    ),
    input-labels: (e: $epsilon$),
    style: (
      state: (radius: 0.5, extrude: 0.8),
      transition: (curve: 0.0, label: (dist: -0.25)),
      q1-q9: (curve: 3),
      q8-q2: (curve: 3),
    ),
    layout: finite.layout.custom.with(positions: (
      q1: (0, 0),
      q2: (2, 0),
      q3: (4, 0),
      q4: (6, 1),
      q5: (8, 1),
      q6: (6, -1),
      q7: (8, -1),
      q8: (10, 0),
      q9: (12, 0),
    )),
  ),
  caption: [Пример для регулярного выражения `(0(0|1))*`],
  supplement: none,
)

== Kleene’s algorithm <kleene-algo>

_Алгортм Клини_ --- алгоритм для построения регулярного выражения из ДКА. По своей сути схож с Флойдом-Уоршеллом (но придуман раньше него!).

Пусть $R^k_(i j)$ --- регулярное выражение, описываемое переходами из $q_i$ в $q_j$ транзитом через промежуточные состояния $q_1, q_2, ..., q_k$. При $k=0$ --- регулярка для прямого пути из $q_i$ в и $q_j$. Логично, что базовая регулярка для перехода из состояния в самого себя --- $epsilon$ или петля (если есть такой переход).

Построение регулярки производится по итеративно:
$
  R^0_(i j) &= cases(
    {a | delta(q_i, a) = q_j} wide &i != j,
    {a | delta(q_i, a) = q_j} union {epsilon} wide &i = j,
  )

  \

  R^k_(i j) &= R^(k-1)_(i j) union R^(k-1)_(i k) (R^(k-1)_(k k))^* R^(k - 1)_(k j)
$

== Mealy machine <mealy-machine>

Автомат Мили --- 6-кортеж $T = (Q, Sigma, cal(O), delta, 𝑞_0, lambda)$, где:
- $Q$ конечное множество состояний;
- $Sigma$ алфавит (конечное множество входных символов);
- $cal(O)$ --- _выходной алфавит_ (конечное множество выходных символов);
- $delta : Q times Sigma -> Q$ --- функция перехода;
- $q_o subset.eq Q$ --- множество начальных состояний;
- $lambda : Q times Sigma -> cal(O)$ --- функция вывода.

По сути, это автомат, в котором, при _переходе_ между состояниями, выдается какой-то символ из $cal(O)$.

#figure(
  grid(
    columns: 2,
    column-gutter: 3em,
    align: center + horizon,
    table(
      columns: 5,
      align: center,
      stroke: (x, y) => if y == 0 { (bottom: 1pt) } + if (x == 0 or x == 2) { (right: 1pt) },
      table.header([], [$0$], [$cal(O)$], [$1$], [$cal(O)$]),
      [$->q_0$], [$q_0$], [$a$], [$q_1$], [$a$],
      [$q_1$], [$q_3$], [$a$], [$q_1$], [$b$],
      [$q_2$], [$q_1$], [$c$], [$q_0$], [$a$],
      [$q_3$], [$q_2$], [$b$], [$q_3$], [$c$],
    ),
    automaton(
      (
        q0: (q0: "0/a", q1: "1/a"),
        q1: (q3: "0/a", q1: "1/b"),
        q2: (q1: "0/c", q0: "1/a"),
        q3: (q2: "0/b", q3: "1/c"),
      ),
      final: (),
      style: (
        state: (radius: 0.5, extrude: 0.8),
        transition: (curve: 0),
        q0-q0: (anchor: bottom),
        q1-q1: (anchor: right),
        q3-q3: (anchor: right),
      ),
      layout: finite.layout.grid.with(columns: 2),
    ),
  ),
)

== Moore machine <moore-machine>

Автомат Мура --- 6-кортеж $T = (Q, Sigma, cal(O), delta, 𝑞_0, G)$, где:
- $Q$ конечное множество состояний;
- $Sigma$ алфавит (конечное множество входных символов);
- $cal(O)$ --- _выходной алфавит_ (конечное множество выходных символов);
- $delta : Q times Sigma -> Q$ --- функция перехода;
- $q_o subset.eq Q$ --- множество начальных состояний;
- $G : Q -> cal(O)$ --- функция вывода.

#figure(
  grid(
    columns: 2,
    column-gutter: 3em,
    align: center + horizon,
    table(
      columns: 4,
      align: center,
      stroke: (x, y) => if y == 0 { (bottom: 1pt) } + if (x == 0 or x == 2) { (right: 1pt) },
      table.header([], [$0$], [$1$], [$cal(O)$]),
      [$->q_0$], [$q_0$], [$q_1$], [$a$],
      [$q_1$], [$q_3$], [$q_1$], [$b$],
      [$q_2$], [$q_1$], [$q_0$], [$a$],
      [$q_3$], [$q_2$], [$q_3$], [$c$],
    ),
    automaton(
      (
        q0: (q0: 0, q1: 1),
        q1: (q3: 0, q1: 1),
        q2: (q1: 0, q0: 1),
        q3: (q2: 0, q3: 1),
      ),
      final: (),
      style: (
        state: (radius: 0.65, extrude: 0.8),
        transition: (curve: 0),
        q0: (label: $q_0\/a$),
        q1: (label: $q_1\/b$),
        q2: (label: $q_2\/a$),
        q3: (label: $q_3\/c$),
        q0-q0: (anchor: bottom),
        q1-q1: (anchor: right),
        q3-q3: (anchor: right),
      ),
      layout: finite.layout.grid.with(columns: 2),
    ),
  ),
)

Отличие от автомата Мили в том, что выходные символы находятся не на переходах, а на состояниях.

== Pumping lemma for regular languages <pumping-lem>

_Полная лемма о накачке_: пусть $L$ --- регулярный язык. Значит, существует такое $n in NN, n > 0$, что для любого слова $w in L$, у которого $abs(w) >= n$, существуют строки $x$, $y$ и $z$ такие, что:
- $w = x y z$;
- $y != epsilon$;
- $abs(x y) <= n$;
- $forall i in NN : x y^i z in L$.

_Слабая лемма о накачке_ отличается тем, что не требует $abs(x y) <= n$.

== Non-regular languages <non-regular-langs>

Ну а что тут сказать? Нерегулярные языки --- это те, которые... не регулярные. Например, контекстно-свободные, контекстно-зависимые, рекурсивно перечислимые. Для их распознавания нужны более крутые автоматы: pushdown автомат, машина Тьюринга.

Ну например можно опровергнуть предположение о регулярности какого-либо языка, если нарушается лемма о накачке (то есть это только _необходимое_ условие регулярности).

А есть еще теорема Майхилла-Нероуда, которая определяет необходимое и достаточное условие регулярности.

== Chomsky hierarchy <chomsky-hierarchy>

Иерархия Хомского --- классификация формальных языков по уровню условной сложности:
- Тип 3 --- регулярные языки (REG). Самые простые. Для распознавания достаточно конечного автомата.
- Тип 2 --- контекстно-свободные языки (CF). Для распознавания достаточно _pushdown-автомата_ --- автомата, у которой помимо состояний и переходов, есть еще память в виде стека.
- Тип 1 --- контекстно-зависимые языки (CS). Для распознавания достаточно машины Тьюринга с ограниченной лентой.
- Тип 0 --- рекурсивно-перечислимые языки (RE). Для них нужна полноценная машина Тьюринга.

Иерархия такова:

$
  "REG" subset "CF" subset "CS" subset "RE"
$

== Closure properties of regular languages <closure-props>

Регулярные языки замкнуты (то есть остаются регулярными) над следующими операциями:
+ Объединение $L_1 union L_2$;
+ Пересечение $L_1 inter L_2$;
+ Дополнение $overline(L)$;
+ Разница $L_1 without L_2$;
+ Обратное преобразование $L^R = {w^R | w in L}$;
+ Звезда Клини $L^*$;
+ Конкатенация $L_1 dot L_2$;
+ Гомоморфизм (т.е. замена символов из $Sigma$ на какие-нибудь строки);
+ Обратный гомоморфизм.

