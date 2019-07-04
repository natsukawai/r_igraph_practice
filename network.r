# nodes: id, name
# links: from, to, weight

library(igraph)
library(dplyr)

nodes <- read.csv('nodes.csv', header = T)
nodes <- distinct(nodes, id, name)      # ノードの重複を取り除く
links <- read.csv('links.csv', header = T)
links <- aggregate(links[3], links[-3], sum) # リンクをまとめて weight の和を算出

net <- graph.data.frame(d=links, vertices=nodes, directed=T)
net <- simplify(net)

V(net)$size <- 4
V(net)$frame.color <- 'white'
V(net)$label.cex <- 0.5
V(net)$label.color <- '#37474f'

E(net)$width <- E(net)$weight/5
E(net)$arrow.size <- 0.2

set.seed(1)
plot(net, layout=layout_with_fr)
