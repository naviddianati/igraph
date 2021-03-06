
#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#   
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

cocitation <- function(graph, v=V(graph)) {

  if (!is.igraph(graph)) {
    stop("Not a graph object")
  }
  v <- as.igraph.vs(graph, v)
  on.exit( .Call("R_igraph_finalizer", PACKAGE="igraph") )
  res <- .Call("R_igraph_cocitation", graph, v-1,
               PACKAGE="igraph")
  if (getIgraphOpt("add.vertex.names") && is.named(graph)) {
    rownames(res) <- get.vertex.attribute(graph, "name", v)
    colnames(res) <- get.vertex.attribute(graph, "name")
  }
  res
}

bibcoupling <- function(graph, v=V(graph)) {
  if (!is.igraph(graph)) {
    stop("Not a graph object")
  }
  v <- as.igraph.vs(graph, v)
  on.exit( .Call("R_igraph_finalizer", PACKAGE="igraph") )
  res <- .Call("R_igraph_bibcoupling", graph, v-1,
               PACKAGE="igraph")
  if (getIgraphOpt("add.vertex.names") && is.named(graph)) {
    rownames(res) <- get.vertex.attribute(graph, "name", v)
    colnames(res) <- get.vertex.attribute(graph, "name")
  }
  res
}
