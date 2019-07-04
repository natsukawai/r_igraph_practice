library(igraph)

nodes <- read.csv('nodes.csv', header = T)
links <- read.csv('links.csv', header = T)

links <- aggregate(links[3], links[-3], sum)
net <- graph.data.frame(d=links, vertices=nodes, directed=T)
net <- simplify(net)

V(net)$size <- 4
V(net)$frame.color <- 'white'
V(net)$label = NA

E(net)$width <- E(net)$weight/5
E(net)$arrow.size <- 0.2

set.seed(1)
plot(net, layout=layout_with_fr)
